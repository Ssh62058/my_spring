<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- JSPページの基本設定 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTLコアタグライブラリ -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- JSTLフォーマットタグライブラリ -->
<jsp:include page="../include/header.jsp" /> <!-- ヘッダーのインクルード -->

<div class="container-fluid min-vh-100"> <!-- メインコンテンツ全体を覆うコンテナ -->
	<div class="row">
		<div class="col-md-2 mt-5 pt-5 pb-5">
<jsp:include page="../include/aside.jsp" />		 <!-- サイドバーのインクルード -->
		</div>
		<div class="col-md-1 d-flex">
		<div class="vr"></div> <!-- 垂直区切り線 -->
	    </div>
<div class="col-md-9 mt-5 pt-5 pb-5"> <!-- メイン表示領域 -->

<div class="">  
<jsp:include page="../include/breadcrumbs.jsp"/> <!-- パンくずリストのインクルード -->
</div>

<form role="form">
<input type="hidden" name="gdsNum" value="${view.gdsNum}"/>
<!-- エクスプレッション、Java表現式 (EL) を利用して商品番号を保持 -->
</form>

<div class="my-3">
<img src="${view.gdsImg}" class="img-thumbnail"/> <!-- 商品画像の表示 -->
</div>

<div class="my-3">
	<label class="form-label">商品名</label>
	<span class="mx-3">${view.gdsName}</span> <!-- 商品名の表示 -->
</div>

<div class="my-3">
	<label class="form-label">カテゴリ</label>
	<span class="mx-3">${view.cateName}</span> <!-- 商品カテゴリーの表示 -->
</div>

<div class="my-3">
<label class="form-label">価格</label>
<span class="mx-3"><fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}"/>円</span> <!-- 価格の表示 -->
</div>

<div class="my-3">
<label class="form-label">商品数量</label>
<span class="mx-3"><fmt:formatNumber pattern="###,###,###" value="${view.gdsStock}"/>EA</span> <!-- 在庫数量の表示 -->
</div>

<c:if test="${view.gdsStock != 0 }">
<!-- 在庫がある場合、購入数量のコントロールを表示 -->
<span>購入数量</span>
<div class="d-flex w-25">
<button type="button" class="plus btn btn-light">+</button>
<input type="number" class="numBox form-control text-center" min="1" max="${view.gdsStock}" value="1" readonly="readonly"/>
 <button type="button" class="minus btn btn-light">-</button>
</div>
<input type="hidden" value="${view.gdsStock }"/>
<script src="/resources/js/stockBtn.js"></script> <!-- 在庫操作用スクリプト -->
</c:if>

<!-- カートに入れるボタン -->
<div class="my-3">
<button type="button" class="addCart_btn btn btn-outline-success">
カートに入れる
</button>
<script src="/resources/js/cart.js"></script> <!-- カート操作用スクリプト -->
</div>
<c:if test="${view.gdsStock == 0 }">
<p>商品数量が不足しています。</p> <!-- 在庫切れの表示 -->
</c:if>

<div class="my-3">
<label class="form-label">商品説明</label>
<span class="mx-3">${view.gdsDes}</span> <!-- 商品説明の表示 -->
</div>

<div id="reply">
<c:if test="${member == null}">
    <p>商品レビューを残すには<a href="/member/signin">ログイン</a>してください。</p> <!-- 未ログイン時のレビュー投稿促進メッセージ -->
</c:if>

<c:if test="${member != null}"><!-- ログイン状態ならレビュー投稿フォームを表示 -->
<section class="replyForm">
<!-- 隠しフィールドに商品番号を設定 -->
<form role="form" method="post" autocomplete="off">

<input type="hidden" name="gdsNum" id="gdsNum" value="${view.gdsNum}">
<!-- 商品レビューの入力欄 -->
<div class="my-3">
<textarea name="repCon" id="repCon" class="form-control">商品レビューを残してください</textarea>
</div>

<div class="d-flex justify-content-end">
<button type="button" id="reply_btn" class="btn btn-outline-primary">
商品レビューを書く
</button>
<script src="/resources/js/reply.js"></script> <!-- レビュー投稿用スクリプト -->
</div>

</form>
</section>
</c:if>

<section class="replyList">
<ul class="list-group list-group-flush"> 
<!-- 商品レビューリストが表示される -->
</ul>
<script>
replyList();// ヘッダーで定義された関数を呼び出してレビューリストを更新
</script>
<!-- コメント修正関連スクリプト -->
</section>
</div>

		</div>
	</div>
</div>

<!-- コメント修正モーダル -->
<div class="replyModal">

<div class="modalContent">

	<div class="">
	<textarea class="modal_repCon form-control" name="modal_repCon"></textarea> <!-- レビュー修正用テキストエリア -->
	</div>

	<div class="d-flex justify-content-end my-2">
	<button type="button" class="modal_modify_btn btn btn-success mx-2">
	修正
	</button>
	<button type="button" class="modal_cancel btn btn-secondary">
	キャンセル
	</button>
	</div>

</div>
<script src="/resources/js/replyDelete.js"></script> <!-- レビュー削除用スクリプト -->
<script src="/resources/js/replyEdit.js"></script> <!-- レビュー編集用スクリプト -->

<div class="modalBackground"></div><!-- 黒い背景 (透明度80) -->
</div>

<jsp:include page="../include/footer.jsp" /> <!-- フッターのインクルード -->