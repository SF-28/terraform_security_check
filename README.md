---
marp: true
---

# Terraform でセキュリティチェック

---

## 自己紹介

藤田　章吾 （@SF-28）

株式会社オーイーシー

DXデザインGr

AI、AWS

![bg right](./imgs/icon_square.png)

---

## [Terraform](https://github.com/hashicorp/terraform)

- IaC (Infrastructure as Code)
  - コードでインフラを定義
- HCL（HashiCorp Configuration Language）で記述

  ```hcl
  resource "aws_s3_bucket" "example" {
    bucket = "my-tf-test-bucket"

    tags = {
      Name        = "My bucket"
      Environment = "Dev"
    }
  }
  ```

---

## 今回やること

👉 tfsec + pre-commit でセキュリティを自動チェック

👉 TFLint, terrafom_fmt でコード品質を担保

👉 asdf で各ツールを一括管理

---

## [tfsec](https://github.com/aquasecurity/tfsec)

- Terraform のセキュリティチェック
  - 脆弱性の内容、修正方法を教えてくれる
  - 適切な実装方法(コード)を提示しているサイトへのリンクも表示
- 対策不要と判断した内容はコメントアウトで無視できる

---

## [pre-commit](https://github.com/pre-commit/pre-commit)

- 各ツール(tfsec, TFLint, terraform_fmt 等) をコミット前に自動実行
  - エラーがある場合はコミットを中断
  - コード品質、セキュリティを担保
- AWS の認証情報が含まれていないか確認
- 特定ブランチへの直 commit を禁止したりもできる

---

## [asdf](https://github.com/asdf-vm/asdf)

- 各種ツールのバージョン管理
- Terraform, TFLint, tfsec, pre-commit を一括インストール

---

## 開発環境作成

```sh
brew install asdf
asdf update

asdf add plugin terraform
asdf add plugin tflint
asdf add plugin tfsec
asdf add plugin pre-commit

asdf install

pre-commit install
```

---

## 初期構築手順

---

- asdf 設定

  ```sh
  brew install asdf
  asdf update

  asdf add plugin terraform
  asdf install terraform latest
  asdf local terraform latest

  asdf add plugin tflint
  asdf install tflint latest
  asdf local tflint latest

  asdf add plugin tfsec
  asdf install tfsec latest
  asdf local tfsec latest

  asdf add plugin pre-commit
  asdf install pre-commit latest
  asdf local pre-commit latest
  ```

---

- pre-commit 設定

  - [公式](https://github.com/pre-commit/pre-commit-hooks)を参考に`.pre-commit-config.yaml`を作成
  - [tflint, tfsec の設定を追加](https://github.com/antonbabenko/pre-commit-terraform#3-add-configs-and-hooks)
  - `pre-commit install` で `git hook` に登録

- `README.md`, `.gitignore` 作成

  - [Terraform.gitignore](https://github.com/github/gitignore/blob/main/Terraform.gitignore) を参考

---

## デモ

---

## まとめ

tfsec, pre-commit を使ってセキュリティ向上 👍

ついでに開発体験も向上
