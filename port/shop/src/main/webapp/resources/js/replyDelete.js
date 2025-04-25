$(document).on("click", ".modify", function(){
    // 1) ゆっくり現れるアニメーションスタイル
    $(".replyModal").fadeIn(200); // モーダルウィンドウをフェードインで表示

    // 2) データを取得
    var repNum = $(this).attr("data-repNum"); // data-repNum属性からコメント番号を取得
    var repCon = $(this).parent().parent().children(".replyContent").text(); // コメント内容を取得
    
    $(".modal_repCon").val(repCon); // モーダル内のテキストエリアにコメント内容を設定
    $(".modal_modify_btn").attr("data-repNum", repNum); // モーダルの修正ボタンにコメント番号を設定
});

// コメント削除
$(document).on("click", ".delete", function(){
    // ユーザーに削除するかどうかを確認
    var deleteConfirm = confirm("本当に削除しますか？");

    // 削除を実行する場合
    if(deleteConfirm){
        var data = {repNum: $(this).attr("data-repNum")}; // data-repNum属性からコメント番号を取得

        // メモリを削減し、レンダリングを抑える...
        $.ajax({
            url: "/shop/view/deleteReply", // サーバーにリクエストを送るURL
            type: "post", // POSTリクエストを使用
            data: data, // サーバーに送信するデータ
            success: function(result){
                if(result == 1) { // セッションの有無によって異なる
                    replyList(); // 自身のコメントだけ削除可能
                } else {
                    alert("投稿者本人のみ削除できます"); // 他のユーザーは削除不可
                }
            },
            error: function(){ 
                alert("ログインが必要です"); // ログインが必要な場合のエラーメッセージ
            }        
        });
    }
});