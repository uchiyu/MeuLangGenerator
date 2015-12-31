# MeuLangGenerator

## About

入力された文字をひなビタ♪の芽兎めう風に変換するプログラム

## Installation

- Mecab

Mecabを利用しているので、各自installしてください
以下のコマンドで、辞書ファイルを生成します
```
/usr/lib/mecab/mecab-dict-index -d /var/lib/mecab/dic/ipadic-utf8 -u userdic.dic -f utf8 -t utf8 userdic.csv
```
また、Mecabの設定ファイル(/etc/mecabrc)のuserdicのコメントアウトを外して、生成されたuserdic.dicのパスに変更してください

- Natto

Nattoと呼ばれる、Rubyのgemも同様に各自installしてください

- リポジトリのセット

```
git clone https://github.com/uchiyu/MeuLangGenerator.git
cd MeuLangGenerator
bundle install --path vendor/bundle
```

- 実行

```
ruby main.rb
```
