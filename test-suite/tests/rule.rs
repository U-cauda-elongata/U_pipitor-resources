use pipitor::manifest::{Manifest, Outbox};
use pipitor::router::Router;
use pipitor::twitter::{Tweet, User};

const PIPITOR: i64 = 1120428863828316160;
const PIPITOR_INDV: i64 = 1175697149343887360;
const PIPITOR_INTL: i64 = 1156087464907329536;

const YOS_RRX: i64 = 158297883;
const NEXON_SHIKYOKU: i64 = 3017102584;
const MAINICHI: i64 = 49540955;
const HANAMARU_UDON: i64 = 100358790;
const CRUNCHYROLL: i64 = 28023330;
const MARISSA_LENTI: i64 = 1873469676;

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
                concat!("(", stringify!($id), ", ", stringify!($text), ")"),
            );
        };
    }

    assert_route!((NEXON_SHIKYOKU, "けもフレ") => [PIPITOR]);

    // 個人アカウントはハッシュタグ付きツイートのみリツイートする（スパム的振る舞いの抑止のため）
    assert_route!((YOS_RRX, "#はなまる") => [PIPITOR_INDV]);
    assert_route!((YOS_RRX, "けもフレ") => []);

    // ある程度までの表記揺れ対策
    assert_route!((YOS_RRX, "#KemonoFriends") => [PIPITOR_INDV]);
    assert_route!((YOS_RRX, "＃KEMONOFRIENDS") => [PIPITOR_INDV]);

    // メディアにおける作品と無関係の文脈での典型的な言及パターンの対応
    assert_route!((MAINICHI, "「けものフレンズ」のたつき監督") => []);

    // はなまるうどんは例外対応
    assert_route!((HANAMARU_UDON, "#はなまる") => []);
    assert_route!((HANAMARU_UDON, "はなまるアニマル") => [PIPITOR]);

    // English accounts should be routed to @KF_pipitor_intl.
    assert_route!((CRUNCHYROLL, "Welcome to the JAPARI PARK") => [PIPITOR_INTL]);
    assert_route!((MARISSA_LENTI, "#KemonoFriends") => [PIPITOR_INTL]);
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
