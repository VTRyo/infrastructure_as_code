# Terraform入門

このTerraformコードはサンプルです。AWSリソースを分割したファイルに記述しています。
スライド資料はこちら(https://speakerdeck.com/vtryo)

(2018-1-20追記：aws_s3.tf, aws_cloudfront, aws_ec2の書き方を変更しました。[くわしくはこちら](https://qiita.com/VTRyo/items/a633eaa3d9049cad0ed5))
## ディレクトリ構成
* aws_ec2.tf <br>
　EC2インスタンスを立ち上げるファイル。terraform importのセクションでは既存で稼働しているAWSリソースをコード化するための記述。

* aws_region.tf <br>
　AWSリソースを適用するリージョン指定するファイル。

* aws_securitygroup.tf <br>
　セキュリティグループを作成するファイル。

* aws_variables.tf <br>
　変数ファイル。

* aws_vpc.tf <br>
　VPCを作成するファイル。

* config.tf <br>
　backendの設定を記述するファイル。terraform.tfstateファイルをS3で管理する場合はこのサンプルのように記述すればよい。

* aws_cloudfront.tf<br>
  Cloudfrontを作成するファイル

* aws_s3.tf<br>
  S3を作成するファイル

## AWSアクセスキーについて
セキュリティ上の問題でアクセスキーやシークレットキーはファイルとして保存したくない。アクセスキーなどは作業マシンの環境変数への設定を推奨。

　
