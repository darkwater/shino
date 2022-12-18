use anyhow::{Context as _, Result};
use clap::Parser;
use futures::{stream::FuturesOrdered, TryStreamExt};

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

    let hosts = context
        .config
        .hosts
        .iter()
        .map(|host| async {
            remote::get_services(host.clone())
                .await
                .context(format!("Couldn't get services for {:?}", host.name))
                .map(|mut list| {
                    list.hostname_services.iter_mut().for_each(|(hostname, _)| {
                        if *hostname != host.name {
                            hostname.insert_str(0, &format!("{}/", host.name));
                        }
                    });

                    list
                })
        })
        .collect::<FuturesOrdered<_>>()
        .try_collect::<Vec<_>>()
        .await?;

    let mut list = ServiceStatusList {
        hostname_services: vec![(context.config.hostname.clone(), services)],
    };

    for mut host in hosts {
        list.hostname_services.append(&mut host.hostname_services);
    }

    display::output(context, list)
}
