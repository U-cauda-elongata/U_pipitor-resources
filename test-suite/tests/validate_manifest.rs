use std::fs;

use pipitor::Manifest;

#[test]
fn validate() {
    let f = fs::read("../Pipitor.toml").unwrap();
    toml::from_slice::<Manifest>(&f).unwrap();
}
