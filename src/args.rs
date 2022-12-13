use crate::commands;
use clap::Parser;

#[derive(Parser)]
pub struct Args {
    /// Path to the config file. If not specified, it will default to $XDG_CONFIG_HOME/shino/config.toml
    #[clap(short, long)]
    pub config_file: Option<String>,

    #[command(subcommand)]
    pub command: Command,
}

#[derive(Parser)]
pub enum Command {
    #[clap(alias = "l")]
    List(commands::list::Args),
}
