use std::fs;

use anyhow::{bail, Result};
use clap::Parser;
use dirs::config_dir;

use crate::commands::{Args, Command};

mod commands;
mod config;
mod display;
mod remote;
mod service;
mod systemd;

pub struct Context {
    config: config::Config,
    args: Args,
}

#[tokio::main]
async fn main() -> Result<()> {
    pretty_env_logger::init();

    let args = Args::parse();

    let config_file = match args.config_file {
        Some(ref path) => path.clone(),
        None => {
            let Some(mut path) = config_dir() else {
                bail!("Could not find config directory");
            };
            path.push("shino");

            if !path.exists() {
                fs::create_dir(&path)?;
            }

            path.push("config.toml");

            if !path.exists() {
                fs::write(&path, include_str!("../default-config.toml"))?;
            }

            path.to_string_lossy().to_string()
        }
    };

    let config = fs::read_to_string(config_file)?;
    let config: config::Config = toml::from_str(&config)?;

    let context = Context { config, args };

    match context.args.command {
        Command::List(ref cargs) => commands::list::run(cargs, &context).await,
        Command::Show(ref cargs) => commands::show::run(cargs, &context).await,
    }
}
