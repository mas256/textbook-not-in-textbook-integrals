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

Buildが成功した最新Commitで、Git BashまたはWSLから次を実行します。

```bash
bash scripts/tag-release.sh v1.0.0
```

Tagは`vMAJOR.MINOR.PATCH`形式です。Release WorkflowがTagの原稿を再ビルドし、検証済みPDFとSHA-256を不変Releaseとして公開します。Pagesは公開済みReleaseのうちSemVerが最大の版を配信します。失敗した候補Tagは欠番として残し、削除・再利用しません。

## ブランチ

- `main`: 次に公開する原稿
- `release/N.x`: 第N版の保守線。必要になった場合、その系列の最新公開Tagから作ります。

初期設定やRepository設定は[docs/setup.md](docs/setup.md)を参照してください。

## 利用条件

原稿の利用条件は未設定です。再利用条件を決めるまでLICENSEは追加していません。
