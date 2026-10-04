# 教科書に乗っていない積分の話

このRepositoryは「教科書に乗っていない積分の話」のupLaTeX原稿と出版履歴を管理します。正式版PDFはGitHub Releaseに固定して配布し、GitHub Pagesでは公開済みReleaseのうち最大のSemVer版を案内します。

## ローカルでビルド

TeX Liveとlatexmkを用意し、Repositoryルートで実行します。

```bash
latexmk "教科書に乗っていない積分の話.tex"
```

GitHub ActionsではTeX Live 2025のDockerイメージをdigest固定で使い、ビルド、参照、埋め込みフォントを確認します。生成PDFはGitに含めず、正式版Releaseのassetとして保存します。

## 日常の執筆

`main`で原稿を編集し、CommitしてPushします。Build WorkflowがPDF生成を検証します。`main`上の原稿はPublic Repositoryを通じて誰でも閲覧できます。

## 正式版の公開

GitHubのWeb画面で操作できます。原稿を`main`にCommitするとBuildが自動実行されます。正式版にするときはActions → **Release** → **Run workflow**を開き、Branchに`main`を選択し、新しい版番号（例: `v1.0.1`）を入力して実行します。Workflowが原稿をビルドし、タグ、Release、PDF、SHA-256を作成・検証します。成功後、Pages Workflowが最新版を配信します。

GitHubのReleases画面から先にReleaseを作らないでください。公開済みの版番号は再利用できません。PDFとSHA-256がそろった正式版だけがPagesの対象になります。

本棚に表示する版番号は、ReleaseとPagesの公開後に[数学書の本棚](https://github.com/mas256/math-textbooks)の`books.json`で更新します。

## ブランチ

- `main`: 次に公開する原稿
- `release/N.x`: 第N版の保守線。必要になった場合、その系列の最新公開Tagから作ります。

初期設定やRepository設定は[docs/setup.md](docs/setup.md)を参照してください。

## 利用条件

原稿の利用条件は未設定です。再利用条件を決めるまでLICENSEは追加していません。

## 最新版（開発中）

`main`へのpush時にBuild WorkflowがPDFを作成し、ビルド・参照・フォント検査に成功した場合だけ、
run番号ごとに固有の`latest-build-<run number>` Pre-releaseへ保存します。公開済みassetは変更せず、Pagesの`latest.pdf`だけを成功ビルドに合わせて更新します。
正式版のReleaseとPagesの`book.pdf`は従来どおりです。
ビルド失敗時は直前の最新版PDFを維持し、古いrunの再実行による巻き戻しも防ぎます。
最新版は[数学書の本棚](https://mas256.github.io/math-textbooks/)から閲覧できます。

## PagesのPDFファイル名と本棚への公開情報

Pagesの正式版PDFは `タイトル-vMAJOR.MINOR.PATCH.pdf`、開発中PDFは `latest-タイトル-vMAJOR.MINOR.PATCH.pdf` です。タイトルは公開Release時点の `book.yml`、版番号は配信する正式Releaseから取得します。開発中PDFの名前も現在の正式Release番号を使い、内容の更新はSHA-256クエリで区別します。

Pages WorkflowはPDFと一緒に `catalog.json` を公開します。正式版はReleaseの公開日時、latestは成功ビルドの `built_at` を最終更新日時とし、再配信では変更しません。本棚はこの情報から版番号・更新日時・PDFリンクを自動取得するため、`books.json` の版番号更新は不要です。

既存リンクとの互換性のため `book.pdf` と `latest.pdf` も残しますが、紹介ページと本棚はタイトル・版番号付きのPDFを案内します。公開済みReleaseのassetやTagは変更しません。
