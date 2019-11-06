use std::fs;

use pipitor::rules::Outbox;
use pipitor::twitter::{Tweet, User};
use pipitor::Manifest;

const PIPITOR: i64 = 1120428863828316160;

const HANAMARU_UDON: i64 = 100358790;

#[test]
fn rules() {
    let f = fs::read("../Pipitor.toml").unwrap();
    let m = toml::from_slice::<Manifest>(&f).unwrap();

    assert_eq!(
        m.rule
            .route_tweet(&tweet(HANAMARU_UDON, "#はなまる"))
            .collect::<Vec<&Outbox>>(),
        Vec::<&Outbox>::new()
    );
    assert_eq!(
        m.rule
            .route_tweet(&tweet(HANAMARU_UDON, "はなまるアニマル"))
            .map(unwrap_twitter)
            .collect::<Vec<i64>>(),
        vec![PIPITOR]
    );
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
