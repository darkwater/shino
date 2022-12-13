use std::fmt::Display;

use anyhow::Result;
use colored::Colorize;
use serde::{Deserialize, Serialize};

use crate::config::ServiceConfig;

pub fn output(output: impl Display + Serialize) -> Result<()> {
    println!("{}", output);
    Ok(())
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ServiceStatusList {
    pub services: Vec<Service>,
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
            ServiceStatus::Unknown => "[?]".bright_black(),
        };

        write!(f, "{} {}", icon, self.config.name)
    }
}

impl Display for ServiceStatusList {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        for service in &self.services {
            writeln!(f, "{service}")?;
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

        Ok(())
    }
}
