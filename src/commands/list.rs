use anyhow::Result;
use clap::Parser;
use futures::{stream::FuturesOrdered, TryStreamExt};

use crate::{
    config::Config,
    display::{self, Service, ServiceStatusList},
    systemd::Systemd,
};

#[derive(Parser)]
pub struct Args {}

pub async fn run(_args: Args, config: Config) -> Result<()> {
    let systemd = Systemd::new().await?;

    let services = config
        .services
        .iter()
        .map(|service| async {
            let status = systemd
                .get_unit_status(service.systemd_service.as_ref().unwrap())
                .await?;

            Result::<_, anyhow::Error>::Ok(Service {
                config: service.clone(),
                status: status.into(),
            })
        })
        .collect::<FuturesOrdered<_>>()
        .try_collect::<Vec<_>>()
        .await?;

    display::output(ServiceStatusList { services })
}
