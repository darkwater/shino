pub mod list;
pub mod show;

use clap::Parser;

use crate::commands;

#[derive(Parser)]
pub struct Args {
    /// Path to the config file. If not specified, it will default to $XDG_CONFIG_HOME/shino/config.toml
    #[clap(short, long)]
    pub config_file: Option<String>,

    /// Format the output as JSON
    #[clap(short, long)]
    pub json: bool,

    #[command(subcommand)]
    pub command: Command,
}

#[derive(Parser)]
pub enum Command {
    #[clap(aliases = ["l", "ls"])]
    List(commands::list::Args),

    #[clap(aliases = ["s", "sh"])]
    Show(commands::show::Args),
}
