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
