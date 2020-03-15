// Copyright: Ankitects Pty Ltd and contributors
// License: GNU AGPL, version 3 or later; http://www.gnu.org/licenses/agpl.html

#![deny(unused_must_use)]

mod backend_proto;

pub fn version() -> &'static str {
    include_str!("../../meta/version").trim()
}

pub mod backend;
pub mod cloze;
pub mod collection;
pub mod err;
pub mod i18n;
pub mod latex;
pub mod log;
pub mod media;
pub mod notes;
pub mod sched;
pub mod search;
pub mod storage;
pub mod template;
pub mod template_filters;
pub mod text;
pub mod time;
pub mod types;
