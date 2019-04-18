//!
//! This func.rs file for functions
//!

use colored::*;
use std::process::Command;

pub fn list() {
    let mut cmd = Command::new("ls");

    cmd.arg("-la");

    match cmd.output() {
        // Output routine
        Ok(o) => unsafe {
            println!(
                " {} {}",
                "Program output is ->\n".yellow(),
                String::from_utf8_unchecked(o.stdout).green()
            );
        },

        Err(e) => {
            println!(" {} {}", "There was an error!\n".red(), e);
        }
    }
}
