use std::time::Duration;

use anyhow::{Context as _, Result};
use clap::Parser;
use futures::{
    stream::{FuturesOrdered, FuturesUnordered},
    TryStreamExt,
};
use indicatif::{MultiProgress, ProgressBar, ProgressStyle};

use crate::{
    display::{self, Service, ServiceStatusList},
    remote, Context,
};

#[derive(Clone, Parser)]
pub struct Args {}

pub async fn run(_args: &Args, context: &Context) -> Result<()> {
    let services = context
        .config
        .services
        .iter()
        .map(|service| async {
            Service::get_for(service.clone())
                .await
                .context(format!("Couldn't get service status for {:?}", service.name))
        })
        .collect::<FuturesOrdered<_>>()
        .try_collect::<Vec<_>>()
        .await?;

    let progress = MultiProgress::new();

    let hosts = context
        .config
        .hosts
        .iter()
        .map(|host| async {
            let pb = progress.add(ProgressBar::new_spinner());
            pb.enable_steady_tick(Duration::from_millis(150));
            pb.set_style(
                ProgressStyle::with_template("{spinner:.green} {msg} ({elapsed})")
                    .unwrap()
                    .tick_strings(&[".  ", ".. ", "...", " ..", "  .", "   ", " ✓ "]),
            );

            pb.set_message(host.name.clone());

            let res = remote::get_services(host.clone())
                .await
                .context(format!("Couldn't get services for {:?}", host.name))
                .map(|mut list| {
                    list.hostname_services.iter_mut().for_each(|(hostname, _)| {
                        if *hostname != host.name {
                            hostname.insert_str(0, &format!("{}/", host.name));
                        }
                    });

                    list
                });

            pb.finish();

            res
        })
        .collect::<FuturesUnordered<_>>()
        .try_collect::<Vec<_>>()
        .await?;

    let _ = progress.clear();

    let mut list = ServiceStatusList {
        hostname_services: vec![(context.config.hostname.clone(), services)],
    };

    for mut host in hosts {
        list.hostname_services.append(&mut host.hostname_services);
    }

    display::output(context, list)
}
