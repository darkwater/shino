use anyhow::{Context, Result};
use clap::Parser;
use futures::{stream::FuturesOrdered, TryStreamExt};

use crate::{
    config::Config,
    display::{self, Service, ServiceStatusList},
    remote,
};

#[derive(Clone, Parser)]
pub struct Args {}

pub async fn run(args: Args, config: Config, all_args: super::Args) -> Result<()> {
    let services = config
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

    let hosts = config
        .hosts
        .iter()
        .map(|host| async {
            remote::get_services(host.clone())
                .await
                .context(format!("Couldn't get services for {:?}", host.name))
        })
        .collect::<FuturesOrdered<_>>()
        .try_collect::<Vec<_>>()
        .await?;

    let mut ssl = ServiceStatusList {
        hostname_services: vec![(config.hostname.clone(), services)],
    };

    for mut host in hosts {
        ssl.hostname_services.append(&mut host.hostname_services);
    }

    display::output(all_args, config, ssl)
}
