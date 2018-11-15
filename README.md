# 正規表現文字列変換プログラムのテスト

## テストのしかた

GitHubのユーザ名が`USERNAME`の場合:

  1. このリポジトリを`compiler-tl-USERNAME`と同じディレクトリに clone する．
  2. `compiler-tl-USERNAME/` ディレクトリで make して `printast`，`interp`，`comp` を作る．
  3. `compiler-tl-USERNAME/` ディレクトリで `test.sh` を実行する．
  
## テストの追加のしかた

テストするプログラム毎に次のディレクトリにテストケースファイルを作ってください．
  * `printtast`  --> `testcases/printtast`
  * `sinterp`と`comp` --> `testcases/interp`
  * `dcomp` --> `testcases/dcomp`

## テストケースファイルの書式

奇数行目にテストの入力を，続く偶数行目にテストの正解をそれぞれ1行で書いてください．
ただし，改行文字は空白に置き換えてください．

## テストケースファイルの名前

名前が衝突すると面倒なので，githubのユーザ名`.in`を付けたファイル名にしてください．
ユーザ名が`abc`であれば`abc_printast.in`や`abc_interp.in`というファイルを作ってください．

### githubユーザ名の確認のしかた

`compiler-tl-abc`というリポジトリが作られていれば`abc`がユーザ名です．
