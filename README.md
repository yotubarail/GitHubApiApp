# GitHubApiApp

## 使用したライブラリ
<a href="https://github.com/pkluz/PKHUD">PKHUD</a>  
ロード中の表すために使用しました

## 工夫した点
・UISearchBarに日本語入力をするとロードの状態が続いてしまうため、エンコードを行うようにしました。  
・再検索を行った時にUITableViewが一番上まで戻るようにしました。  
・UISearchBarに文字が入っていない場合や、ユーザーが見つからなかった時にPKHUDでエラー表示を出すようにしました。  

## これからつけたい機能
・WebViewの画面で戻ったり、進んだりするボタンをつけWeb画面の使い心地をブラウザに近づけたい。  