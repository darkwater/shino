use anyhow::{Context, Result};
use tokio::process::Command;

use crate::{config::HostConfig, display::ServiceStatusList};

pub async fn get_services(config: HostConfig) -> Result<ServiceStatusList> {
    let output = Command::new("ssh")
        .args([&config.address, "shino", "--json", "list"])
        .output()
        .await
        .context("SSH command failed")?;

    let stdout = String::from_utf8_lossy(&output.stdout);

    if !output.stderr.is_empty() {
        let stderr = String::from_utf8_lossy(&output.stderr);

        eprintln!("{} stdout:\n{}", config.name, stdout);
        eprintln!("{} stderr:\n{}", config.name, stderr);
    }

    serde_json::from_str(&stdout).context("SSH command output was invalid JSON")
}
