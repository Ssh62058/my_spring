$(".addCart_btn").click(function(){
    const gdsNum = $("#gdsNum").val(); // 商品番号を取得
    const cartStock = $(".numBox").val(); // カートに入れる商品数量を取得

    const data = {gdsNum: gdsNum, cartStock: cartStock}; // 商品番号と数量のデータをオブジェクトとして定義

    $.ajax({
        url: "/shop/view/addCart", // リクエストを送るURL
        type: "POST", // リクエストのタイプはPOST
        data: data, // サーバーに送信するデータ
        success: function(){
            alert("カートに追加成功"); // 成功メッセージをアラートで表示
            $(".numBox").val("1"); // 数量フィールドを1にリセット
        },
        error: function(){
            alert("カートに追加失敗"); // エラーメッセージをアラートで表示
        }
    });
});