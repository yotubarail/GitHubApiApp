# GitHubApiApp

## 概要
GitHub APIを用いてユーザーを探すアプリです。  

## 環境
<ul>
<li>Xcode12</li>
<li>Swift5</li>
<li>iOS11以上対象</li>
<li>iPhone8、iPhoneSE、iPhone8Plus、iPhoneXS, iPhoneXS Max, iPhoneXR対応</li>
</ul>

## 使用したライブラリ
CocoaPodsを使用してライブラリの導入を行いました。  

<table border="2" style="border-collapse: collapse">
  <thead>
    <tr>
        <th>ライブラリ</th>
        <th>説明</th>
    </tr>
</thead>
<tbody>
    <tr>
        <td><a href="https://github.com/pkluz/PKHUD">PKHUD</a></td>
        <td>ロード中の様子を表すために使用しました。</td>
    </tr>
    <tr>
        <td><a href="https://github.com/dzenbot/DZNEmptyDataSet">DZNEmptyDataSet</a></td>
        <td>tableViewの要素が0の時にUISearchBarへの入力を促す文を表示させるために使用しました。</td>
    </tr>
</tbody>  
</table>

## 工夫した点
<ul>
<li>UISearchBarに日本語入力をするとロードの状態が続いてしまうため、エンコードを行うようにしました。</li>
<li>再検索を行った時にUITableViewが一番上まで戻るようにしました。</li>
<li>UISearchBarに文字が入っていない場合や、ユーザーが見つからなかった時にPKHUDでエラー表示を出すようにしました。</li>
<li>使用したライブラリのライセンス情報を端末の設定アプリから見られるようにしました。</li>
<li>MARKを用いてどの部分のコードが書かれているかわかりやすくしました。</li>
<li>アプリ内でユーザーがGitHubにログインすることを想定し、cookieの情報を保持させることでアプリ終了後もログイン状態が続くようにしました。</li>
</ul>

## これからつけたい機能
<ul>
<li>WebViewの画面で戻ったり、進んだりするボタンをつけWeb画面の使い心地をブラウザに近づけたい。</li>
</ul>

## その他（迷ったところ、反省点等）
<ul>
<li>WebViewの画面においてWKWebViewとSFSafariViewのどちらを使用するかで迷いましたが、UINavigationControllerでの画面遷移が想定されていたのでWKWebViewを使用しました。</li>
<li>使用したライブラリが少なかったので、今回はLicensePlistは使用せず自分でライセンス情報を加えました。</li>
<li>MVPでコードを書くことは初めてだったため『iOSアプリ設計パターン入門』を購入したところ発送日が提出期限の日でした。もっと早く設計に関して勉強を進めるべきでした。</li>
</ul>

## 参考にしたサイト
<ul>
<li><a href="https://qiita.com/uhooi/items/0a57cad6e7ca8e30f09a">OSSのライセンスを設定アプリ内に表示する方法</a></li>
<li><a href="https://github.com/peaks-cc/iOS_architecture_samplecode">iOS_architecture_samplecode</a></li>
<li><a href="https://qiita.com/hicka04/items/25be38a90fdde29c97c2">【Swift】MVCから脱却したいのでMVPの勉強をした</a></li>
<li a href="https://qiita.com/i_nak/items/be0fac91bdc68aa165db">【Swift】WebViewのCookieを永続的に保持しておきたい</li>
</ul>
