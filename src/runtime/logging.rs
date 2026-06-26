use std::borrow::Cow;

use wasmtime::component::Linker;

use crate::worker::Worker;

wasmtime::component::bindgen!();

impl From<shino::rt::logging::Level> for log::Level {
    fn from(level: shino::rt::logging::Level) -> Self {
        match level {
            shino::rt::logging::Level::Critical => log::Level::Error,
            shino::rt::logging::Level::Error => log::Level::Error,
            shino::rt::logging::Level::Warn => log::Level::Warn,
            shino::rt::logging::Level::Info => log::Level::Info,
            shino::rt::logging::Level::Debug => log::Level::Debug,
            shino::rt::logging::Level::Trace => log::Level::Trace,
        }
    }
}

impl shino::rt::logging::Host for Worker {
    fn log(&mut self, level: shino::rt::logging::Level, context: String, message: String) {
        let target = if context.is_empty() {
            Cow::Borrowed(self.module_name.as_str())
        } else {
            format!("{}::{context}", self.module_name).into()
        };

        log::log!(
            target: &target,
            level.into(),
            "{}", message
        );
    }
}

pub fn add_to_linker(linker: &mut Linker<Worker>) {
    shino::rt::logging::add_to_linker::<Worker, wasmtime::component::HasSelf<Worker>>(
        linker,
        |state| state,
    )
    .unwrap();
}
