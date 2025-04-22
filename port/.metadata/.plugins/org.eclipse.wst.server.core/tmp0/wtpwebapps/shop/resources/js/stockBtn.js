// + ボタンを押すと数量が増加しますが、商品の総数量を超えません
$(".plus").click(function(){ 
	let num = $(".numBox").val(); // 現在の数量を取得
	let plusNum = Number(num) + 1; // 数量を1増やす
	let stock = $(".gdsStock_hidden"); // 在庫数を取得
	
	if(plusNum >= stock){ 
		$(".numBox").val(num); // 在庫を超えた場合、現在の数量を維持
	} else {
		$(".numBox").val(plusNum); // 在庫以内の場合、数量を更新
	}
});

// -
$(".minus").click(function(){
	let num = $(".numBox").val(); // 現在の数量を取得
	let minusNum = Number(num) - 1; // 数量を1減らす
	
	if(minusNum <= 0){ 
		$(".numBox").val(num); // 数量が0以下になった場合、現在の数量を維持
	} else {
		$(".numBox").val(minusNum); // 数量が0より大きい場合、数量を更新
	}
});