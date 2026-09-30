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

## 3. 正式版をブラウザーから公開する

1. GitHubの原稿ファイル画面で編集し、`main`へCommitします。`main`上の変更でBuildが自動実行されます。
2. Actionsで`Build`が成功したことを確認します。
3. Actions → `Release` → `Run workflow`を開きます。
4. Branchを`main`にし、`version`に未使用の版番号（次回は`v1.0.1`）を入力して実行します。
5. `Release`が成功したら、ReleasesにPDFと`.sha256`の2ファイルが添付されたことを確認します。
6. `Deploy Pages`が成功したことを確認します。
7. `math-textbooks`リポジトリの`books.json`で版番号を更新してCommitします。
8. カタログのActionsが成功したら、本棚の表示を確認します。

GitHubのReleases画面から先にReleaseを作らないでください。Release Workflowがタグ、Release、添付ファイルをまとめて作成します。公開済みの版番号は再利用できません。

## 4. ライセンス

原稿の利用条件は未設定です。条件を決めるまで`LICENSE`は置きません。
