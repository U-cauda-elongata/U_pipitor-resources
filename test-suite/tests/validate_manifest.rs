use pipitor::Manifest;

#[test]
fn validate() {
    serde_dhall::from_file("../Pipitor.dhall")
        .parse::<Manifest>()
        .unwrap();
}
