# AnoPost

![AnoPostロゴ](https://github.com/wawawatataru/anopost/blob/master/app/assets/images/android-chrome-256x256.png?raw=true,"AnoPostロゴ")

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/wawawatataru/anopost)

[![CircleCI](https://circleci.com/gh/wawawatataru/anopost.svg?style=svg)](https://circleci.com/gh/wawawatataru/anopost)

## AnoPostとは

`AnoPost` というサービスは、

`社内の不正や倫理的な問題を通報したいけど身バレしたくない問題`を解決したい

`匿名で通報をしたい社員と問題を未然に防ぎたい会社`向けの、

`企業倫理ホットライン作成サービス`です。

ユーザーは `匿名で不正や倫理的な問題の通報`ができ、

`匿名質問箱や既存のホットライン作成サービス`とは違って、

`アカウント登録や利用料金なしにすぐさま企業倫理ホットラインを作成できる機能`が備わっている事が特徴です。

## Lint&Test
下記のlintとテストが実装されます。

```
$ ./bin/before_commit
```

## Lint
rubocopとslim-lintが実行されます。

```
$ ./bin/lint
```

## Test
modelのテストとsystemテストが実行されます。

```
$ ./bin/test
```
