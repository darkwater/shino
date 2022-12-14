use anyhow::{Context, Result};
use clap::Parser;
use futures::{stream::FuturesOrdered, TryStreamExt};

use crate::{
    config::Config,
    display::{self, Service, ServiceStatusList},
};

#[derive(Parser)]
pub struct Args {}

pub async fn run(_args: Args, config: Config) -> Result<()> {
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

    display::output(ServiceStatusList { services })
}
