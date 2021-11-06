このリポジトリーは Twitter の以下のボットアカウントの設定ファイルなどのリソース群を含みます。

- けものフレンズ RT bot（[@KF\_pipitor]）
- けものフレンズ RT bot (個人)（[@KF\_pipitor\_indv]）
- Kemono Friends RT bot（[@KF\_pipitor\_intl]）

[@KF\_pipitor]: <https://twitter.com/KF_pipitor>
[@KF\_pipitor\_indv]: <https://twitter.com/KF_pipitor_indv>
[@KF\_pipitor\_intl]: <https://twitter.com/KF_pipitor_intl>

これらのアカウントは『けものフレンズ』の公式関連っぽい記事の紹介やツイートのリツイートを行う非公式のボットです。

このリポジトリーの設定ファイルは、これらのボットが投稿の収集の対象とするフィード・アカウントや、その中で転載・リツイートを行なうべき投稿のパターンを記述するものです。

## リポジトリーの構成

- [`/Pipitor.dhall`](Pipitor.dhall): ボットの設定ファイルの本体。ただし実際の内容のほとんどは [`/dhall/`](dhall) ディレクトリー以下に分割して記述されている。詳細については [`HACKING.md`](HACKING.md) を参照。
- [`/test-suite/`](test-suite): `Pipitor.dhall` のテストスイート。
- [`/img/`](img): ボットアカウントのプロフィール画像やヘッダー画像。

## プロジェクトに貢献する

本プロジェクトでは設定の追加やその他の改善のアイデアの提案などの貢献を歓迎しています。貢献の方法について不明な点などがあれば [`CONTRIBUTING.md`](CONTRIBUTING.md) を参照してください。それが不十分であればこのリポジトリーの [Discussions] などにお気軽にご連絡ください。

[Discussions]: <https://github.com/U-cauda-elongata/KF_pipitor-resources/discussions>

## ライセンス

[`COPYING.md`](COPYING.md) を参照してください（TL;DR: [`/img/`](img) ディレクトリーを除いて `MIT OR ODbL-1.0`）。
