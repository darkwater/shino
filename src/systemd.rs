use anyhow::Result;
use zbus::{dbus_proxy, Connection};

use crate::display::ServiceStatus;

pub struct Systemd {
    connection: Connection,
}

impl Systemd {
    pub async fn new() -> Result<Self> {
        Ok(Self {
            connection: Connection::system().await?,
        })
    }

    pub async fn get_unit(&self, name: &str) -> Result<UnitProxy> {
        let manager = ManagerProxy::new(&self.connection).await?;
        Ok(manager.get_unit(name).await?)
    }

    pub async fn get_unit_status(&self, name: &str) -> Result<UnitStatus> {
        let unit = match self.get_unit(name).await {
            Ok(unit) => unit,
            Err(a) if a.to_string().contains(" not loaded") => return Ok(UnitStatus::NotLoaded),
            Err(e) => return Err(e),
        };

        Ok(UnitStatus::Loaded {
            active_state: unit.active_state().await?,
            sub_state: unit.sub_state().await?,
        })
    }
}

#[derive(Debug)]
pub enum UnitStatus {
    NotLoaded,
    Loaded {
        active_state: String,
        sub_state: String,
    },
}

impl From<UnitStatus> for ServiceStatus {
    fn from(status: UnitStatus) -> Self {
        match status {
            UnitStatus::NotLoaded => Self::Unknown,
            UnitStatus::Loaded {
                active_state,
                sub_state,
            } => match (active_state.as_str(), sub_state.as_str()) {
                ("active", "running") => Self::Running,
                ("active", "exited") => Self::Ended,
                ("inactive", "dead") => Self::Disabled,
                ("failed", _) => Self::Failed,
                ("activating", _) => Self::Changing,
                ("deactivating", _) => Self::Changing,
                ("reloading", _) => Self::Changing,
                _ => Self::Unknown,
            },
        }
    }
}

#[dbus_proxy(
    interface = "org.freedesktop.systemd1.Manager",
    default_service = "org.freedesktop.systemd1",
    default_path = "/org/freedesktop/systemd1"
)]
trait Manager {
    #[dbus_proxy(object = "Unit")]
    async fn get_unit(&self, name: &str);
}

#[dbus_proxy(
    interface = "org.freedesktop.systemd1.Unit",
    default_service = "org.freedesktop.systemd1",
    default_path = "/org/freedesktop/systemd1"
)]
trait Unit {
    #[dbus_proxy(property)]
    fn active_state(&self) -> Result<String>;

    #[dbus_proxy(property)]
    fn sub_state(&self) -> Result<String>;
}
