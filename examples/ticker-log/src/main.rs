wit_bindgen::generate!(in "../../wit");

use std::time::Duration;

use shino::rt::logging::{Level, log};

fn main() {
    loop {
        log(Level::Info, "foo", "Hello, world!");
        std::thread::sleep(Duration::from_secs(5));
    }
}
