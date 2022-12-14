use anyhow::Result;
use itertools::Itertools;
use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct Config {
    pub hostname: String,

    #[serde(default)]
    pub services: Vec<ServiceConfig>,

    #[serde(default)]
    pub hosts: Vec<HostConfig>,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct ServiceConfig {
    pub name: String,
    pub systemd_service: Option<String>,
    pub docker_container: Option<String>,
}

#[derive(Debug)]
pub enum ServiceSpec {
    Systemd(String),
    Docker(String),
}

impl ServiceConfig {
    pub fn spec(&self) -> Result<ServiceSpec> {
        Ok([
            self.systemd_service
                .as_ref()
                .cloned()
                .map(ServiceSpec::Systemd),
            self.docker_container
                .as_ref()
                .cloned()
                .map(ServiceSpec::Docker),
        ]
        .into_iter()
        .flatten()
        .exactly_one()?)
    }
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct HostConfig {
    pub name: String,
    pub address: String,
}
