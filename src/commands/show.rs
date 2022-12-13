use anyhow::Result;
use clap::Parser;

use crate::{
    config::Config,
    display::{self, Service, ServiceDetails},
    systemd::Systemd,
};

#[derive(Parser)]
pub struct Args {
    /// The (partial) name of the service to show
    service: String,
}

pub async fn run(args: Args, config: Config) -> Result<()> {
    let Some(service_config) = config
        .services
        .iter()
        .find(|service| service.name.contains(&args.service)) else {
            return Err(anyhow::anyhow!("Could not find service with name {}", args.service));
        };

    if let Some(ref systemd_service) = service_config.systemd_service {
        let systemd = Systemd::new().await?;
        let status = systemd.get_unit_status(systemd_service).await?;

        let service = Service {
            config: service_config.clone(),
            status: status.into(),
        };

        display::output(ServiceDetails { service })
    } else {
        Err(anyhow::anyhow!("Could not find systemd service for {}", args.service))
    }
}
