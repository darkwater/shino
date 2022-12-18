use anyhow::Result;
use clap::Parser;

use crate::{
    display::{self, Service, ServiceDetails},
    Context,
};

#[derive(Clone, Parser)]
pub struct Args {
    /// The (partial) name of the service to show
    service: String,
}

pub async fn run(args: &Args, context: &Context) -> Result<()> {
    let Some(service_config) = context.config
        .services
        .iter()
        .find(|service| service.name.contains(&args.service)) else {
            return Err(anyhow::anyhow!("Couldn't find service with name containing {:?}", args.service));
        };

    let service = Service::get_for(service_config.clone()).await?;

    display::output(context, ServiceDetails { service })
}
