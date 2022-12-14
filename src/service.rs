use anyhow::{Context, Result};
use bollard::Docker;

use crate::{
    config::{ServiceConfig, ServiceSpec},
    display::{Service, ServiceStatus},
    systemd::Systemd,
};

impl Service {
    pub async fn get_for(config: ServiceConfig) -> Result<Self> {
        let status = match config.spec()? {
            ServiceSpec::Systemd(name) => Systemd::new()
                .await
                .context("Couldn't connect to systemd")?
                .get_unit_status(&name)
                .await
                .context(format!("Couldn't get unit status for {:?}", name))?
                .into(),
            ServiceSpec::Docker(name) => {
                match Docker::connect_with_socket_defaults()?
                    .inspect_container(&name, None)
                    .await
                    .map(|c| c.state)
                {
                    Ok(Some(state)) => {
                        if let Some(true) = state.dead {
                            ServiceStatus::Failed
                        } else if let Some(true) = state.error.map(|e| !e.is_empty()) {
                            ServiceStatus::Failed
                        } else if let Some(true) = state.running {
                            ServiceStatus::Running
                        } else {
                            ServiceStatus::Unknown
                        }
                    }
                    Ok(None) => ServiceStatus::Unknown,
                    Err(e) => {
                        eprintln!("{e:?}");
                        ServiceStatus::Unknown
                    }
                }
            }
        };

        Ok(Self { config, status })
    }
}
