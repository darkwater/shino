use std::fmt::Display;

use anyhow::Result;
use colored::Colorize;
use serde::{Deserialize, Serialize};

use crate::{config::ServiceConfig, Context};

pub fn output(context: &Context, output: impl Display + Serialize) -> Result<()> {
    if context.args.json {
        println!("{}", serde_json::to_string_pretty(&output)?);
    } else {
        println!("{}", output);
    }

    Ok(())
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ServiceStatusList {
    pub hostname_services: Vec<(String, Vec<Service>)>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ServiceDetails {
    pub service: Service,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Service {
    pub config: ServiceConfig,
    pub status: ServiceStatus,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum ServiceStatus {
    Running,
    Ended,
    Failed,
    Disabled,
    Changing,
    Unknown,
}

impl Display for Service {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let icon = match &self.status {
            ServiceStatus::Running => "[✓]".green(),
            ServiceStatus::Ended => "[D]".green(),
            ServiceStatus::Failed => "[E]".red(),
            ServiceStatus::Disabled => "[X]".yellow(),
            ServiceStatus::Changing => "[R]".blue(),
            ServiceStatus::Unknown => "[?]".red(),
        };

        write!(f, "{} {}", icon, self.config.name)
    }
}

impl Display for ServiceStatusList {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        for (hostname, services) in &self.hostname_services {
            writeln!(f, "{}", hostname.bold().underline())?;
            for service in services {
                writeln!(f, "{service}")?;
            }
            writeln!(f)?;
        }

        Ok(())
    }
}

impl Display for ServiceDetails {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        writeln!(f, "{}", self.service)?;
        writeln!(f)?;

        if let Some(ref systemd_service) = self.service.config.systemd_service {
            writeln!(f, "systemd service: {systemd_service}")?;
        }

        if let Some(ref docker_container) = self.service.config.docker_container {
            writeln!(f, "docker container: {docker_container}")?;
        }

        Ok(())
    }
}
