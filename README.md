# GitHubApiApp

## できでいないこと
<ul>
<li>PresenterからViewまで取得した情報を受け渡すことができていない。</li>

## 使用したライブラリ
<a href="https://github.com/pkluz/PKHUD">PKHUD</a>  
ロード中の表すために使用しました。  

<a href="https://github.com/dzenbot/DZNEmptyDataSet">DZNEmptyDataSet</a>  
tableViewの要素が0の時にUISearchBarへの入力を促す文を表示させるために使用しました。  

## 工夫した点
<ul>
<li>UISearchBarに日本語入力をするとロードの状態が続いてしまうため、エンコードを行うようにしました。</li>
<li>再検索を行った時にUITableViewが一番上まで戻るようにしました。</li>
<li>UISearchBarに文字が入っていない場合や、ユーザーが見つからなかった時にPKHUDでエラー表示を出すようにしました。</li>
<li>使用したライブラリのライセンス情報を端末の設定アプリから見られるようにしました。</li>
</ul>

## これからつけたい機能
<li>WebViewの画面で戻ったり、進んだりするボタンをつけWeb画面の使い心地をブラウザに近づけたい。</li>

## その他
<ul>
<li>WebViewの画面においてWKWebViewとSFSafariViewのどちらを使用するかで迷いましたが、UINavigationControllerでの画面遷移が想定されていたのでWKWebViewを使用しました。</li>  
<li>使用したライブラリが少なかったので、今回はLicensePlistは使用せず自分でライセンス情報を加えました。</li>
</ul>

## 参考にしたサイト
<ul>
<li><a href="https://qiita.com/uhooi/items/0a57cad6e7ca8e30f09a">OSSのライセンスを設定アプリ内に表示する方法</a></li>
<li></li>
<li></li>
</ul>
