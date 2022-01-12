# HACKING

このドキュメントでは、特にプログラミングの経験がない方を対象として、本ボットの設定ファイル [`Pipitor.dhall`](Pipitor.dhall) の構成および編集の方法について説明します。

本ボットは [`pipitor`] というボットプログラムを利用しており、その設定ファイルの構成は [`pipitor/CONFIG.md`] でドキュメント化されています。また、設定ファイルは [Dhall] 言語で記述されています。

本ボットの `Pipitor.dhall` は Dhall の機能を利用してメンテナンス性のために複数のファイルに分割しており、その実体の大半は [`/dhall/`](dhall) ディレクトリー以下に置かれています。

[`pipitor`]: <https://github.com/tesaguri/pipitor>
[`pipitor/CONFIG.md`]: <https://github.com/tesaguri/pipitor/blob/dhall-schema-v0.3.0-alpha.10/CONFIG.md>
[Dhall]: <https://dhall-lang.org/>

## <span id="section-structure">`Pipitor.dhall` の構成</span>

[`/dhall/`](dhall) ディレクトリー以下は次のような構成になっています。

- [`/dhall/rule.dhall`](dhall/rule.dhall): 収集対象のフィードや Twitter アカウント（トピック）とそれらの投稿の中から転載・リツイートするべきものを選別するための検索条件（フィルター）の対応を記述したファイル。トピックの分類別に複数ファイルに分割されている。
  - [`/dhall/rule/kf-official.dhall`](dhall/rule/kf-official.dhall): けものフレンズプロジェクトの公式アカウントなど、けものフレンズについての投稿のみを行うトピック群のルール。
  - [`/dhall/rule/general.dhall`](dhall/rule/general.dhall): 特別のフィルターを要さない一般トピック群のルール。公式関連企業、グッズ会社、イベントなど。
  - [`/dhall/rule/streamer.dhall`](dhall/rule/streamer.dhall): 配信者や VTuber 関連のトピック群のルール。
  - [`/dhall/rule/media.dhall`](dhall/rule/media.dhall): ニュースサイトや報道機関などのプレス系のトピック群のルール。
  - [`/dhall/rule/individual.dhall`](dhall/rule/individual.dhall): スタッフやキャストの個人の Twitter アカウントのルール。
  - [`/dhall/rule/zoo-aquarium.dhall`](dhall/rule/zoo-aquarium.dhall): 動物園・水族館。
- [`/dhall/filter.dhall`](dhall/filter.dhall): `rule.dhall` で共通的に用いられるフィルター群の定義。
- [`/dhall/account.dhall`](dhall/account.dhall): ボットアカウントの一覧。基本的にいじる必要はない。
- [`/dhall/twitter.dhall`](dhall/twitter.dhall): ボットの Twitter API とのやりとりに関する設定。基本的にいじる必要はない。
- [`/dhall/util/`](dhall/util): 各種ユーティリティー関数。使用法は後述。

## ファイルを編集する（変更を提案する）

GitHub の Web インターフェースからファイルを編集することができます。

編集画面を開くには、リポジトリーのページをブラウズして編集したいファイルのページを開き、ページ上のファイルが表示されている部分のすぐ右上にある "Raw" "Blame" ボタンの右隣にある鉛筆アイコンの ![Fork this project and edit the file][pencil] ボタンをクリックします。

編集画面で目的の変更を加えたら "Propose changes" 以下のテキストボックスに変更の概要を記入し、そのさらに下の "Propose changes" ボタンを押すと変更の提案（プルリクエスト）が送信されるはずです。

[pencil]: <https://github.com/primer/octicons/raw/2956111310a7565153c215b3125e9514cdf3cba0/icons/pencil-16.svg>

## フィード・アカウント（トピック）を追加する

収集対象のフィードや Twitter アカウント（トピック）を追加するには [`/dhall/rule/`](dhall/rule) の中から追加したいトピックのカテゴリーに当てはまる `.dhall` ファイルを編集します。前述の[一覧](#section-structure)から選ぶのが手軽でしょう。

`/dhall/rule/` 以下の `.dhall` ファイルは概ね次のような構造をとります。

```dhall
--| サンプルファイル
let Pipitor = ../Pipitor.dhall

let account = ../account.dhall

let filter = ../filter.dhall

let util = ../util.dhall

let rx = util.rx

let Feed = Pipitor.Topic.Feed

let Twitter = Pipitor.Topic.Twitter

let youtube = util.youtube

in  [ Pipitor.Rule::{
      , filter = Some Pipitor.Filter::{ title = filter.basic }
      , outbox = [ Pipitor.Outbox.Twitter account.pipitor ]
      , topics = [
          Feed "https://example.com/feed", -- フィードの例
          youtube "UCHogeHoge_PiyoPiyo_Fuga", -- YouTube チャンネルの例
          Twitter 9876543210, -- @TwitterExample Twitter アカウントの例
          -- ...
        ]
    ]
```

ごちゃごちゃとしていますが、トピックを追加するときに見るべき部分は基本的に `topics = [` とそれに対応する `]` の間の部分のみです。この部分にトピックを指定する行を記述していきます。これ以降の例ではその他の部分を省略した形のコードを示すものとします。

慣習として各行の末尾にコメント（`--` 以降）としてトピックの名前をメモするようにしていますが、これについては雑に書いたり、あるいは完全に省いてしまっても構いません。

次節以降でトピックの区分別に具体的な記述方法を示します。

### YouTube チャンネル

YouTube チャンネルをトピックとして追加するには `youtube` 関数を使います。

「『けものフレンズプロジェクト』公式」（<https://www.youtube.com/channel/UCEOugXOAfa-HRmRjKbH8z3Q>）のチャンネルを例にとると、次のように記述されます。

```dhall
let youtube = (../util.dhall).youtube

in [
  youtube "UCEOugXOAfa-HRmRjKbH8z3Q", -- 『けものフレンズプロジェクト』公式
]
```

ここで `UCEOugXOAfa-HRmRjKbH8z3Q` は YouTube の[チャンネル ID][channel-url] です。これは一般的にはチャンネルの URL の `/channel/` に続く英数字・ハイフン（`-`）・アンダースコア（`_`）からなる文字列ですが、URL の形式によってはこれが記されていないこともあります。その場合は後述の[ブックマークレット](#section-utilities)によってチャンネル ID を取得できます。

[channel-url]: <https://support.google.com/youtube/answer/6180214>

### その他フィード

YouTube 以外の一般の RSS/Atom フィードのトピックは `Feed` バリアントで表されます。

Crunchyroll の News ページ（<https://www.crunchyroll.com/news>）のフィードを例にとると、次のように記述されます。

```dhall
let Feed = (../Pipitor.dhall).Topic.Feed

in [
  Feed "https://feeds.feedburner.com/crunchyroll/animenews", -- Latest in Anime News by Crunchyroll!
]
```

ただし現時点では技術的な都合により [WebSub]（旧称 PubSubHubbub）のハブを持つトピックのみの対応となっています。すなわちフィードのソース内に `<link rel="hub" />` を持つトピックにのみ対応しています。

ちなみに前節の `youtube "CHANNEL_ID"` は `Feed "https://www.youtube.com/xml/feeds/videos.xml?channel_id=CHANNEL_ID"` の省略形です。

[WebSub]: <https://www.w3.org/TR/websub/>

### Twitter アカウント

Twitter アカウントのトピックは `Twitter` バリアントで表されます。

「けものフレンズ＠公式アカウント」（[@kemo\_project]）を例にとると、次のように記述されます。

```dhall
let Twitter = (../Pipitor.dhall).Topic.Twitter

in [
  Twitter 2801592695, -- @kemo_project けものフレンズ＠公式アカウント
]
```

ここで `2801592695` は Twitter アカウントの[ユーザー ID][user-object] です。これはスクリーンネーム（`@kemo_project`）とは違い、各アカウントに割り当てられる不変な識別子であって、64 ビットの整数で表されます。

後述の[ブックマークレット](#section-utilities)によってこのユーザー ID を取得することができます。

[@kemo\_project]: <https://twitter.com/kemo_project>
[user-object]: <https://developer.twitter.com/en/docs/twitter-api/v1/data-dictionary/object-model/user>

### <span id="section-utilities">ユーティリティー</span>

次に示すのは前節までに示したトピックの記述を補助するブックマークレットです。

```
javascript:(_=>{let%20c=t=>navigator.clipboard.writeText(t).then(_=>alert(`%E3%82%B3%E3%83%94%E3%83%BC%E3%81%97%E3%81%BE%E3%81%97%E3%81%9F:\n${t}`));switch(location.host){case'twitter.com':let%20b=document.querySelector('[data-testid="placementTracking"]');let%20i=b?.firstChild?.firstChild?.dataset?.testid?.split('-')?.[0];let%20[n,s]=b?.parentNode?.parentNode?.nextSibling?.querySelectorAll('div>span:first-of-type')||[];i&&s&&c(`Twitter%20${i},%20--%20${s.innerText}%20${n.innerText}`);break;case'www.youtube.com':let%20j=document.querySelector('meta[itemprop="channelId"]')?.content;j&&c(`youtube%20"${j}",%20--%20`+document.querySelector('meta[itemprop="name"]').content)}})()
```

これを YouTube のチャンネルのトップページや Twitter アカウントのプロフィールページ上で実行すると、そのページのトピックが前述の `.dhall` ファイルにそのままペーストできる `youtube "UCHogeHoge_PiyoPiyo_Fuga", -- チャンネル名` のような形式の文字列としてコピーされます。

技術的な都合により、このブックマークレットは YouTube のサイト内のリンクをクリックしてチャンネルのページに遷移した状態で実行すると正しく動作しません。その場合はブラウザでページの再読み込みを行なってから実行すると正しく動作します。

ブックマークレットのソースコードを次に示します。汚いですが、特に minify していない手書きのコードです。

```javascript
(_ => {
    // `t` をクリップボードにコピーして確認メッセージを表示する
    let c = t => navigator.clipboard.writeText(t).then(_ => alert(`コピーしました:\n${t}`));

    switch (location.host) {
      case 'twitter.com':
        // 「フォロー」ボタン
        let b = document.querySelector('[data-testid="placementTracking"]');
        // ユーザー ID
        let i = b?.firstChild?.firstChild?.dataset?.testid?.split('-')?.[0];
        // アカウントの名前とスクリーンネーム
        let [n, s] = b?.parentNode?.parentNode?.nextSibling?.querySelectorAll('div>span:first-of-type') || [];
        i && s && c(`Twitter ${i}, -- ${s.innerText} ${n.innerText}`);
        break;
      case 'www.youtube.com':
        // チャンネル ID
        let j = document.querySelector('meta[itemprop="channelId"]')?.content;
        j && c(`youtube "${j}", -- ` + document.querySelector('meta[itemprop="name"]').content)
    }
})()
```

ブックマークレットに加えて、同様の機能を持つユーザースクリプトも用意しています。

<https://github.com/U-cauda-elongata/copy-pipitor-topic-user-js/raw/master/copy-pipitor-topic.user.js>

これは YouTube のチャンネルのトップページや Twitter アカウントのプロフィールページにおいて、前述のブックマークレットと同様の内容をコピーするためのコンテクストメニュー項目を追加します。また、それに加えて TweetDeck 上で選択した Twitter アカウントについても同様の内容をコピーすることができます。

ただし、このユーザースクリプトは廃止予定の [`<menuitem>`] 要素に依存しているため、将来に動かなくなる可能性が高いです。執筆時点で最新の Firefox では `about:config` で `dom.menuitem.enabled` を `true` にすることでようやく使えるようになります。また、その他のプラウザーでは一切使えないはずです。

[`<menuitem>`]: <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/menuitem>

## 検索条件（フィルター）を編集する (_WIP_)
