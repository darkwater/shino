use std::fmt::Display;

use anyhow::Result;
use clap::Parser;
use colored::Colorize;
use futures::{stream::FuturesOrdered, TryStreamExt};

use crate::{
    config::Config,
    systemd::{Systemd, UnitStatus},
};

#[derive(Parser)]
pub struct Args {}

pub async fn run(_args: Args, config: Config) -> Result<()> {
    let systemd = Systemd::new().await?;

    let statuses = config
        .services
        .iter()
        .map(|service| async {
            let status = systemd
                .get_unit_status(service.systemd_service.as_ref().unwrap())
                .await?;

            Result::<_, anyhow::Error>::Ok(ServiceStatus {
                name: service.systemd_service.as_ref().unwrap().clone(),
                status,
            })
        })
        .collect::<FuturesOrdered<_>>()
        .try_collect::<Vec<_>>()
        .await?;

    for status in statuses {
        println!("{status}");
    }

    Ok(())
}

struct ServiceStatus {
    name: String,
    status: UnitStatus,
}

impl Display for ServiceStatus {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let icon = match &self.status {
            UnitStatus::NotLoaded => "[?]".bright_black(),
            UnitStatus::Loaded {
                active_state,
                sub_state,
            } => match (active_state.as_str(), sub_state.as_str()) {
                ("active", "running") => "[✓]".green(),
                ("active", "exited") => "[X]".green(),
                ("inactive", "dead") => "[X]".bright_black(),
                ("activating", _) => "[…]".on_yellow(),
                ("deactivating", _) => "[…]".on_yellow(),
                ("failed", _) => "[E]".red(),
                ("reloading", _) => "[R]".blue(),
                _ => "[ ]".bright_black(),
            },
        };

        write!(f, "{} {}", icon, self.name)
    }
}
