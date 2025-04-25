// バージョンに依存する。上位バージョンを使用する場合、その設定を探す必要がある
var ckeditor_config = {
    resize_enaleb : false, // サイズ変更を無効化
    enterMode : CKEDITOR.ENTER_BR, // Enterキーで改行を追加
    shiftEnterMode : CKEDITOR.ENTER_P, // Shift + Enterキーで段落を追加
    filebrowserUploadUrl : "/admin/goods/ckUpload" // ファイルアップロードのURL設定
}
CKEDITOR.replace("gdsDes", ckeditor_config); // gdsDes要素にCKEditorを適用