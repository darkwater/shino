use std::path::Path;

use wasmtime::component::{Component, ResourceTable};
use wasmtime::*;
use wasmtime_wasi::{WasiCtx, WasiCtxView, WasiView};

use crate::runtime::Runtime;

pub struct Worker {
    pub wasi_ctx: WasiCtx,
    pub resource_table: ResourceTable,
}

impl Worker {
    pub fn spawn(path: &Path, runtime: &Runtime) -> wasmtime::Result<()> {
        let component = Component::from_file(runtime.engine(), path)?;

        // Create a WASI context and put it in a Store; all instances in the store
        // share this context. `WasiCtx` provides a number of ways to
        // configure what the target program will have access to.
        let wasi = WasiCtx::builder().inherit_stdio().build();
        let state = Worker {
            wasi_ctx: wasi,
            resource_table: ResourceTable::new(),
        };
        let mut store = Store::new(runtime.engine(), state);

        // Instantiate it as a normal component
        let instance = runtime
            .linker()
            .instantiate(&mut store, &component)
            .unwrap();

        std::thread::spawn(move || {
            // Get the index for the exported interface
            let interface_idx = instance
                .get_export_index(&mut store, None, "wasi:cli/run@0.2.0")
                .expect("Cannot get `wasi:cli/run@0.2.0` interface");

            // Get the index for the exported function in the exported interface
            let func_idx = instance
                .get_export_index(&mut store, Some(&interface_idx), "run")
                .expect("Cannot get `run` function in `wasi:cli/run@0.2.0` interface");

            let func = instance
                .get_typed_func::<(), (Result<(), ()>,)>(&mut store, func_idx)
                .unwrap();

            let (result,) = func.call(&mut store, ()).unwrap();

            result.unwrap();
        });

        Ok(())
    }
}

impl WasiView for Worker {
    fn ctx(&mut self) -> WasiCtxView<'_> {
        WasiCtxView {
            ctx: &mut self.wasi_ctx,
            table: &mut self.resource_table,
        }
    }
}
