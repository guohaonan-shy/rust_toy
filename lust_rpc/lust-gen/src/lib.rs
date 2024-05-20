mod gen {
    include!(concat!(env!("OUT_DIR"), "/lust_gen.rs"));
}

pub use gen::lust_gen::*;
