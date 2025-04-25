$(function(){ // 非同期にドキュメントが実行される前にロードするのを防ぎます

    $("#allCheck").click(function(){
        var chk = $("#allCheck").prop("checked"); // "allCheck"チェックボックスの状態を取得
        if(chk) {
            $(".chBox").prop("checked", true); // すべてのチェックボックスを選択状態にする
        } else {
            $(".chBox").prop("checked", false); // すべてのチェックボックスを未選択状態にする
        }
    });

    $(".selectDelete_btn").click(function(){
        var confirm_val = confirm("本当に削除しますか？"); // 削除確認のダイアログを表示

        if(confirm_val) {
            var checkArr = new Array(); // 選択されたチェックボックスのデータを格納する配列を作成

            // 選択されたチェックボックスの数だけ繰り返し
            $("input[class='chBox']:checked").each(function(){
                checkArr.push($(this).attr("data-cartNum")); // 配列にデータを挿入
            });

            $.ajax({
                url : "/shop/deleteCart", // サーバーにリクエストを送るURL
                type : "post", // リクエストのタイプはPOST
                data : { chbox : checkArr }, // サーバーに送信するデータ
                success : function(result){ // リクエストが成功した場合
                    if(result == 1) { 
                        location.href = "/shop/cartList"; // カートリストページにリダイレクト
                    } else {
                        alert("削除失敗"); // 失敗メッセージを表示
                    }
                }
            });
        }
    });

    $(".orderOpne_bnt").click(function(){
        $(".orderInfo").slideDown();  // ".orderInfo"を表示
        $(".orderOpne_bnt").slideUp(); // ".orderOpne_bnt"を非表示
    });

    $(".cancel_btn").click(function(){
        $(".orderInfo").slideUp();  // ".orderInfo"を非表示
        $(".orderOpne_bnt").slideDown();  // ".orderOpne_bnt"を表示
    });

});