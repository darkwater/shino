use std::path::PathBuf;

/// Returns paths to all modules on this host
///
/// Creates the modules directory if it does not exist.
pub fn load_modules() -> Vec<PathBuf> {
    let Some(dir) = dirs::data_local_dir() else {
        log::error!("User has no home directory; can't load any modules");
        return vec![];
    };

    let dir = dir.join("shino").join("modules");

    if !dir.exists() {
        log::debug!("Modules directory does not exist; creating it");
        if let Err(e) = std::fs::create_dir_all(&dir) {
            log::error!("Failed to create modules directory: {e}");
            return vec![];
        }
    }

    let Ok(entries) = dir.read_dir().map_err(|e| {
        log::error!("Failed to read modules directory: {e}");
    }) else {
        return vec![];
    };

    let mut modules = vec![];
    for entry in entries {
        match entry {
            Ok(entry) => {
                modules.push(entry.path());
            }
            Err(e) => {
                log::error!("Failed to read entry in modules directory: {e}");
                break;
            }
        }
    }

    log::info!("Found {} modules in {}", modules.len(), dir.display());

    modules
}
