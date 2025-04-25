$(".modal_modify_btn").click(function(){ 
    var modifyConfirm = confirm("本当に修正しますか？"); // 修正の確認ダイアログを表示
    if(modifyConfirm){
        var data = {repNum: $(this).attr("data-repNum"),  // コメント番号を取得
                    repCon: $(".modal_repCon").val()};    // 修正内容を取得
        $.ajax({
            url: "/shop/view/modifyReply", // サーバーへのリクエストURL
            type: "post", // POSTリクエストでデータを送信
            data: data, // サーバーに送信するデータ
            success: function(result){
                if(result == 1){ 
                    replyList(); // 修正後にリストを更新
                    $(".replyModal").fadeOut(200); // モーダルをフェードアウトで非表示
                } else {
                    alert("投稿者本人のみ修正可能です"); // 他のユーザーは修正不可
                }
            },
            error: function(){
                alert("ログインが必要です"); // ログインが必要な場合のエラーメッセージ
            }
        });    
    }        
});

// 修正をキャンセルするとフェードアウトでモーダルを非表示
$(".modal_cancel").click(function(){
    $(".replyModal").fadeOut(200); // モーダルをフェードアウトで非表示
});