// Asynchronous javascript and xml : 必要な内容を部分的に更新し、必要なデータとリソースだけを取得することができる
// 再ロードせず、必要な部分だけを更新
$("#reply_btn").click(function(){ 
    var formObj = $(".replyForm form[role='form']"); // フォーム要素を取得
    var gdsNum = $('#gdsNum').val(); // gdsNumの値を取得
    var repCon = $('#repCon').val(); // repConの値を取得

    // ReplyVO形式でデータを生成
    var data = {gdsNum: gdsNum, repCon: repCon};

    $.ajax({
        url: "/shop/view/registReply", // サーバーにリクエストを送るURL
        type: "post", // POSTリクエストを使用
        data: data, // サーバーに送信するデータ
        success: function(){ 
            replyList(); // リストを更新
            $("#repCon").val(""); // テキストエリアを初期化
        }    
    });
});