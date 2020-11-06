# Towards14
iOS 14 対応をまとめたサンプルアプリです。
基本的に以下の 2 つのブランチが参考になると思います。

1. `iOS13`: iOS 13 以下で正常に動作する
1. `iOS14`: iOS 14 対応を施したブランチ

## 対応している項目
本アプリで対応している問題と、アプリ上での View 名は以下のとおりです。

- `UIStackView` の `backgroundColor` が付く問題: `UIStackViewBackgroundColor`
- `UIPageControl` の仕様が変わった問題: `UIPageControl`
- デフォルトブラウザの変更により `canOpenURL(_:)` が `false` になる問題: `CustomDefaultBrowser`
- `navigationItem.backBarButton` に長押しメニューが追加された問題: `PushBackButtonLongPress`

## 基本的な使い方

### ざっくり対応を知りたい場合:
ざっくり問題の概要だったり、対応方法が知りたい場合は Pull Request が適しています。

- [デフォルトブラウザを変更した際に \`canOpenURL\(\_:\)\` が false になる問題を修正](https://github.com/daichikuwa0618/Towards14/pull/6)
- [iOS 14 端末で UIStackView の backgroundColor が見えるようになったので不要な背景色を削除](https://github.com/daichikuwa0618/Towards14/pull/10)
- [iOS 14 で backButton 長押しでタイトルが付くようになったのに対応](https://github.com/daichikuwa0618/Towards14/pull/11)
- [バックボタンタイトル・履歴メニュータイトルの制御を navigationItem\.backButtonDisplayMode に変更](https://github.com/daichikuwa0618/Towards14/pull/14)

### 問題を再現してみたい場合:
シミュレーターや実機等で問題を発現し、触ってみたい場合は、 `iOS13` ブランチが適しています。

`iOS13` ブランチをチェックアウトし、 **Xcode 12 でビルド + iOS 14 端末にインストール**してみると iOS 14 未対応の状態のアプリがインストールされるので、問題が発現すると思います。

### 対応を Xcode 上で確認したい場合:
`iOS14` ブランチが適しています。

当該ブランチをチェックアウトし、 Xcode 12 でビルドすることで、 iOS 14 に対応したアプリがインストールされます。

<!---
## スクリーンショット

|メイン|`CustomDefaultBrowser`|`UIStackViewBackgroundColor`|`PushBackButtonLongPress`|`UIPageControl`|
|--|--|--|--|--|
||||||
---!>
