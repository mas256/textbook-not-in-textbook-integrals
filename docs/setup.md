# 初期設定

この手順は「教科書に乗っていない積分の話」向けです。公開範囲や版の不変性は、最初のReleaseを作る前に設定してください。

## 1. Repository構成とBuild

原稿入口はルートの`教科書に乗っていない積分の話.tex`です。.github/workflows/_build.yml はこれをupLaTeX + dvipdfmxでBuildします。環境はTeX Live 2025のDocker image digestに固定済みです。Buildが成功すると、PDF内のフォント埋め込みとHaranoAjiフォントの使用も確認します。

## 2. GitHub Repository設定

GitHub上のRepositoryはPublicにします。Publicでは`main`の原稿自体も誰でも閲覧できます。

1. **Pages:** Settings → Pages → Sourceを「GitHub Actions」にします。
2. **Immutable releases:** Settingsで有効にします。最初のReleaseの前に行います。
3. **Tag ruleset:** Settings → Rules → Rulesets → New tag ruleset。
   - 対象: `v[0-9]*.[0-9]*.[0-9]*`
   - Restrict updatesとRestrict deletionsを有効化し、Activeにします。
4. **Actions権限:** Settings → Actions → General → Workflow permissionsを読み取りのみにします。書き込みが必要なRelease jobは個別に権限を指定しています。
5. **Environment `github-pages`:** Pages有効化時に作られます。デプロイ対象はデフォルトブランチのみとし、Tagパターンを追加しません。

## 3. 初回確認と正式版

`main`へのPushでBuildが成功することを確認します。正式版公開時はGit BashまたはWSLで、成功したCommitに対して実行します。

```bash
bash scripts/tag-release.sh v1.0.0
```

ReleaseにPDFと`.sha256`が添付され、Pagesが最新版を配信します。

## 4. ライセンス

原稿の利用条件は未設定です。条件を決めるまで`LICENSE`は置きません。
