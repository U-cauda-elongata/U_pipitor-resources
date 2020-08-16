use pipitor::manifest::{Manifest, Outbox};
use pipitor::router::Router;
use pipitor::twitter::{Tweet, User};

const PIPITOR: i64 = 1120428863828316160;

const HANAMARU_UDON: i64 = 100358790;

#[test]
fn rules() {
    let manifest: Manifest = serde_dhall::from_file("../Pipitor.dhall").parse().unwrap();
    let router = Router::from_manifest(&manifest);

    macro_rules! assert_route {
        (($id:expr, $text:expr) => [$($outbox:expr),*]) => {
            assert_eq!(
                router
                    .route_tweet(&tweet($id, $text))
                    .map(unwrap_twitter)
                    .collect::<Vec<i64>>(),
                vec![$($outbox),*] as Vec<i64>,
            );
        };
    }

    assert_route!((HANAMARU_UDON, "#はなまる") => []);
    assert_route!((HANAMARU_UDON, "はなまるアニマル") => [PIPITOR]);
}

fn tweet(user_id: i64, text: impl Into<Box<str>>) -> Tweet {
    Tweet {
        id: 0,
        text: text.into(),
        user: User { id: user_id },
        in_reply_to_status_id: None,
        in_reply_to_user_id: None,
        quoted_status: None,
        retweeted_status: None,
    }
}

fn unwrap_twitter(outbox: &Outbox) -> i64 {
    match *outbox {
        Outbox::Twitter(id) => id,
        _ => panic!("expected Twitter outbox"),
    }
}
