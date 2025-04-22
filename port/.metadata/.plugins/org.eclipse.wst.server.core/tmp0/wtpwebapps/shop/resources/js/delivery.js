$(".delivery1_btn").click(function(){ 
    $(".delivery").val("配送中"); // deliveryクラスの値を「配送中」に設定
    run(); // run関数を実行
});

$(".delivery2_btn").click(function(){ 
    $(".delivery").val("配送完了"); // deliveryクラスの値を「配送完了」に設定
    run(); // run関数を実行
});

run = () => { 
    $(".deliveryForm").submit(); // deliveryFormクラスのフォームを送信
}