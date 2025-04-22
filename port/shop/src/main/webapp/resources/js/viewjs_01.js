var formObj = $("form[role='form']"); // role='form'属性を持つフォーム要素を取得
$("#modify_Btn").click(function(){ 
    formObj.attr("action", "/admin/goods/modify"); // フォームの送信先URLを設定
    formObj.attr("method", "get"); // フォームの送信方法をGETに設定
    formObj.submit(); // フォームを送信
});
$("#delete_Btn").click(function(){ 
    var con = confirm("本当に削除しますか？"); // ユーザーに削除確認のダイアログを表示
    if(con){ 
        formObj.attr("action", "/admin/goods/delete"); // フォームの送信先URLを設定
        formObj.submit(); // フォームを送信
    }
});