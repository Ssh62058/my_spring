<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- JSPページの基本設定 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTLコアタグ -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <!-- JSTLフォーマットタグ -->
<jsp:include page="../include/header.jsp" flush="false" /> <!-- ヘッダーインクルード -->

<div class="container-fluid min-vh-100"> <!-- 全画面高さのコンテナ -->
<div class="row">
<div class="col-md-2 mt-5 pt-5">
<jsp:include page="../include/aside.jsp" />		 <!-- サイドバー（ナビゲーション）インクルード -->
		</div>
		<div class="col-md-1 d-flex">
		<div class="vr"></div> <!-- 垂直区切り線 -->
	    </div>
<div class="col-md-9">

<section id="container" class="mt-5 pt-5"> <!-- メインコンテンツセクション -->
		<div id="container_box">
		<h1 class="mt-5">CartList</h1> <!-- カートリストタイトル表示 -->
			<section id="content">
					
				<ul class="list-group list-group-flush"> <!-- カート内商品のリスト -->
					<li class="list-group-item">
						<div class="allCheck"> <!-- 「すべて選択」チェックボックス -->
						<div class="input-group">
						<input type="checkbox" name="allCheck" id="allCheck" class="form-check"/>
						<label for="allCheck" class="form-lable mx-2">すべて選択</label>
						</div>
						</div>
						
						<div class="delBtn my-2"> <!-- 「選択削除」ボタン -->
							<button type="button" class="selectDelete_btn btn btn-outline-danger btn-lg">選択削除</button>
						</div>
						
					</li>
				
					<%-- jsp上の変数宣言：合計金額の初期化 --%>
					<c:set var="sum" value="0" />
				
					<c:forEach items="${cartList}" var="cartList"> <!-- cartListの各商品をループ表示 -->
					<li class="list-group-item">
						<div class="checkBox">
							<input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}" /> <!-- 個別商品のチェックボックス -->
							<script>
								$(".chBox").click(function(){
									$("#allCheck").prop("checked", false); // チェック操作時「すべて選択」チェック解除
								});
							</script>
						</div>
					
						<div class="d-flex justify-content-between align-items-center">
							<img src="${cartList.gdsThumbImg}" class="img-thumbnail w-25"/> <!-- 商品サムネイル画像 -->
							
							<div class="gdsInfo w-75 mx-3">
<p class="p-3">
	<div>商品名<span class="mx-3">${cartList.gdsName}</span></div> <!-- 商品名表示 -->
	<div>単価<span class="mx-3"><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}" /> 円</span></div> <!-- 単価表示 -->
	<div>購入数量<span class="mx-3">${cartList.cartStock} 個</span></div> <!-- 購入数量表示 -->
	<div>最終価格<span class="mx-3"><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}" /> 円</span></div> <!-- 小計（最終価格）表示 -->
</p>
						</div>
						</div>

							
<div class="delete d-flex justify-content-end"> <!-- 削除操作部 -->
								<button type="button" class="delete_${cartList.cartNum}_btn btn btn-outline-danger px-5" data-cartNum="${cartList.cartNum}">削除</button>
								<script>
									$(".delete_${cartList.cartNum}_btn").click(function(){
										var confirm_val = confirm("本当に削除しますか？"); // 削除確認
										
										if(confirm_val) {
											var checkArr = new Array();
											
											checkArr.push($(this).attr("data-cartNum")); // 削除対象のcartNumを配列に格納
																						
											$.ajax({
												url : "/shop/deleteCart", // 削除リクエスト送信先
												type : "post",
												data : { chbox : checkArr },
												success : function(result){
													if(result == 1) {												
														location.href = "/shop/cartList"; // 削除成功時にカートリストを再表示
													} else {
														alert("削除に失敗しました"); // 失敗時アラート表示
													}
												}
											});
										}	
									});
								</script>
								<script>
									// (追加のスクリプトがある場合に利用)
								</script>
							</div>
						</div>			
					</li>
					
					<%-- 各アイテム毎に合計金額(sum)に (単価×数量) を加算 --%>
					<c:set var="sum" value="${sum + (cartList.gdsPrice * cartList.cartStock)}" />
					
					</c:forEach>
				</ul>
			
			<div class="listResult"> <!-- 合計金額表示と注文入力ボタン -->
				<div class="sum my-3">
					合計 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />円
				</div>
				<div class="orderOpne mt-3 mb-3">
					<button type="button" class="orderOpne_bnt btn btn-outline-success">注文情報入力</button>
				</div>
			</div>
			
			<div class="orderInfo"> <!-- 注文情報入力フォーム -->
				<form role="form" method="post" autocomplete="off">
								
					<input type="hidden" name="amount" value="${sum}" /> <!-- 注文金額を隠しフィールドで送信 -->
								
					<div class="inputArea input-group mb-3">
						<label for="" class="form-label w-10">受取人</label>
						<input type="text" name="orderRec" id="orderRec" required="required" class="form-control w-90"/> <!-- 受取人入力 -->
					</div>
						
					<div class="inputArea input-group">
						<label for="orderPhone" class="form-label w-10">受取人連絡先</label>
						<input type="text" name="orderPhone" id="orderPhone" required="required" class="form-control w-90"/> <!-- 受取人連絡先入力 -->
					</div>
						
					<div class="inputArea"> <!-- 住所入力エリア -->
						
						<div class="input-group my-3">
							<input type="text" id="sample2_postcode" placeholder="郵便番号" class="form-control">
							<input type="button" onclick="sample2_execDaumPostcode()" value="郵便番号検索" class="btn btn-outline-success">
						</div>
						
						<p class="my-5">
							<input type="text" name="userAddr1" id="sample2_address" placeholder="住所" class="form-control"> <!-- 住所入力 -->
							<input type="text" name="userAddr2" id="sample2_detailAddress" placeholder="詳細住所" class="form-control my-3"> <!-- 詳細住所入力 -->
							<input type="text" name="userAddr3" id="sample2_extraAddress" placeholder="参考項目" class="form-control"> <!-- 参考項目入力 -->
						</p>
								
						<!-- iOSではposition:fixedバグがあるため、必要に応じてスタイル調整 -->
						<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="閉じるボタン">
						</div>
								
						<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- Daum郵便番号検索スクリプト -->
						<script src="${contextPath}/resources/js/daumlayer.js"></script> <!-- 住所検索用レイヤースクリプト -->
					</div>
						
					<div class="inputArea my-5"> <!-- 注文確定エリア -->
					<div class="my-5 d-flex justify-content-end my-5">
					<div class="btn-group">
						<button type="submit" class="order_btn  mb-5 btn btn-outline-success">注文</button> <!-- 注文確定ボタン -->
						<button type="button" class="cancel_btn mb-5 btn btn-outline-danger">キャンセル</button> <!-- 注文キャンセルボタン -->
					</div>
					
					</div>
					</div>
						
				</form>	
			</div>
					
			</section>
</div>
</div>
</div>
<script src="${contextPath}/resources/js/cartlist.js"></script>	 <!-- カートリスト操作用スクリプト -->
 
<jsp:include page="../include/footer.jsp" flush="false" /> <!-- フッター部分をインクルード -->