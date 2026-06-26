mod logging;

use wasmtime::{Engine, component::Linker};

use crate::worker::Worker;

pub struct Runtime {
    engine: Engine,
    linker: Linker<Worker>,
}

impl Runtime {
    pub fn new() -> Self {
        let engine = Engine::default();
        let mut linker = Linker::new(&engine);
        wasmtime_wasi::p2::add_to_linker_sync(&mut linker).unwrap();
        self::logging::add_to_linker(&mut linker);

        Self { engine, linker }
    }

    pub fn engine(&self) -> &Engine {
        &self.engine
    }

    pub fn linker(&self) -> &Linker<Worker> {
        &self.linker
    }
}
