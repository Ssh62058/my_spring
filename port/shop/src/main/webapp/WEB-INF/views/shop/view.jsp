<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../include/header.jsp" />

<div class="container-fluid min-vh-100">
	<div class="row">
		<div class="col-md-2 mt-5 pt-5 pb-5">
<jsp:include page="../include/aside.jsp" />		
		</div>
		<div class="col-md-1 d-flex">
		<div class="vr"></div>
	    </div>
<div class="col-md-9 mt-5 pt-5 pb-5">

<div class="">
<jsp:include page="../include/breadcrumbs.jsp"/>
</div>

<form role="form">
<input type="hidden" name="gdsNum" value="${view.gdsNum}"/>
<!-- エクスプレッション、Java表現式 el エクスプレッションランゲージ -->
</form>

<div class="my-3">
<img src="${view.gdsImg}" class="img-thumbnail"/>
</div>

<div class="my-3">
	<label class="form-label">商品名</label>
	<span class="mx-3">${view.gdsName}</span>
</div>

<div class="my-3">
	<label class="form-label">カテゴリ</label>
	<span class="mx-3">${view.cateName}</span>
</div>

<div class="my-3">
<label class="form-label">価格</label>
<span class="mx-3"><fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}"/>円</span>
</div>

<div class="my-3">
<label class="form-label">商品数量</label>
<span class="mx-3"><fmt:formatNumber pattern="###,###,###" value="${view.gdsStock}"/>EA</span>
</div>

<c:if test="${view.gdsStock != 0 }">
<span>購入数量</span>
<div class="d-flex w-25">
<button type="button" class="plus btn btn-light">+</button>
<input type="number" class="numBox form-control text-center" min="1" max="${view.gdsStock}" value="1" readonly="readonly"/>
 <button type="button" class="minus btn btn-light">-</button>
</div>
<input type="hidden" value="${view.gdsStock }"/>
<script src="/resources/js/stockBtn.js"></script>
</c:if>

<!-- カートに入れる -->
<div class="my-3">
<button type="button" class="addCart_btn btn btn-outline-success">
カートに入れる
</button>
<script src="/resources/js/cart.js"></script>
</div>
<c:if test="${view.gdsStock == 0 }">
<p>商品数量が不足しています。</p>
</c:if>

<div class="my-3">
<label class="form-label">商品説明</label>
<span class="mx-3">${view.gdsDes}</span>
</div>

<div id="reply">
<c:if test="${member == null}">
	<p>商品レビューを残すには<a href="/member/signin">ログイン</a>してください。</p>
</c:if>

<c:if test="${member != null}"><!-- ログインしていればコメントが利用可能 -->
<section class="replyForm">
<!-- 隠しフィールドに商品番号を設定 -->
<form role="form" method="post" autocomplete="off">

<input type="hidden" name="gdsNum" id="gdsNum" value="${view.gdsNum}">
<!-- コメントを書く -->
<div class="my-3">
<textarea name="repCon" id="repCon" class="form-control">商品レビューを残してください</textarea>
</div>

<div class="d-flex justify-content-end">
<button type="button" id="reply_btn" class="btn btn-outline-primary">
商品レビューを書く
</button>
<script src="/resources/js/reply.js"></script>
</div>

</form>
</section>
</c:if>

<section class="replyList">
<ul class="list-group list-group-flush">

</ul>
<script>
replyList();//ヘッダーで作成した関数を呼び出し
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
	<textarea class="modal_repCon form-control" name="modal_repCon"></textarea>
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
<script src="/resources/js/replyDelete.js"></script>
<script src="/resources/js/replyEdit.js"></script>

<div class="modalBackground"></div><!-- 黒い背景に透明度80 -->
</div>




<jsp:include page="../include/footer.jsp" />