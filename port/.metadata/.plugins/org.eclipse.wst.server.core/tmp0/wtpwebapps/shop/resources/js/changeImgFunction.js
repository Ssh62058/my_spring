$('#gdsImg').change(function(){ // 画像プレビュー処理。HTML要素にイベントリスナーを接続
    // ユーザーが入力フィールドで画像を選択すると、changeイベントがトリガーされます
    if(this.files && this.files[0]){ // 配列が埋まっているか(ユーザーがファイルを選択したか)を確認
        // files[0]で選択された最初のファイルにアクセス。ファイル入力は複数ファイルを選択可能なため
        var reader = new FileReader; // 選択されたファイルを読むためのオブジェクトを生成
        reader.onload = function(data){ // 画像を読み込む際にトリガーされるイベントハンドラ
            $(".select_img img").attr("src", data.target.result).width(100);
            // class "select_img" の子要素である imgタグに幅100pxを設定
            // 画像データのURLを保持
        }   
        reader.readAsDataURL(this.files[0]); // 最初に選択されたファイルをデータURLとして読み取る
    }
});

// 数量入力フィールドで数字以外の入力を防止
var regExp = /[^0-9]/gi; // 数字以外の全てに一致する正規表現
// gフラグを指定すると、グローバルに適用
// iフラグを指定すると、大文字小文字を区別しない
$("#gdsPrice").keyup(function(){numCheck($(this));});
$("#gdsStock").keyup(function(){numCheck($(this));});

function numCheck(selector){
    var tempVal = selector.val(); // 入力フィールドの現在の値を取得
    selector.val(tempVal.replace(regExp, "")); 
    // 数字(0-9)以外の全ての文字を削除
}