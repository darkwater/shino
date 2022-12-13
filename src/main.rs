use std::fs;

use anyhow::Result;
use clap::Parser;
use dirs::config_dir;

use crate::args::Args;

mod args;
mod commands;
mod config;
mod systemd;

#[tokio::main]
async fn main() -> Result<()> {
    pretty_env_logger::init();

    let args = Args::parse();

    let config_file = match args.config_file {
        Some(path) => path,
        None => {
            let mut path =
                config_dir().ok_or_else(|| anyhow::anyhow!("Could not find config directory"))?;
            path.push("shino");

            if !path.exists() {
                fs::create_dir(&path)?;
            }

            path.push("config.toml");

            if !path.exists() {
                fs::write(&path, include_str!("../default-config.toml"))?;
            }

            path.to_str()
                .ok_or_else(|| anyhow::anyhow!("Could not convert path to string"))?
                .to_string()
        }
    };

    let config = fs::read_to_string(config_file)?;
    let config: config::Config = toml::from_str(&config)?;

    match args.command {
        args::Command::List(args) => commands::list::run(args, config).await,
    }
}
