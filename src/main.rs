use crate::worker::Worker;

mod runtime;
mod storage;
mod worker;

fn main() {
    env_logger::Builder::from_env(env_logger::Env::default().default_filter_or("info")).init();

    let paths = storage::load_modules();

    let runtime = runtime::Runtime::new();

    for path in paths {
        Worker::spawn(&path, &runtime).unwrap();
    }

    loop {
        std::thread::park();
        std::thread::sleep(std::time::Duration::from_secs(1));
    }
}
