<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- JSPページの基本設定 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTLコアタグライブラリ -->

<jsp:include page="../include/header.jsp" /> <!-- ヘッダーのインクルード -->

<div class="container-fluid min-vh-100"> <!-- 全画面の高さを持つコンテナ -->
	<div class="row">
		<div class="col-md-2 mt-5 pt-5">
<jsp:include page="../include/aside.jsp" /> <!-- サイドバーのインクルード -->
		</div>
		<div class="col-md-1 d-flex">
		<div class="vr"></div> <!-- 垂直の区切り線 -->
	    </div>
		<div class="col-md-9">
<div class="mt-5 pt-5">
<jsp:include page="../include/breadcrumbs.jsp"/> <!-- パンくずリストのインクルード -->
</div>		
<ul class="list-group list-group-horizontal mt-5"> <!-- 商品リスト（水平表示）の開始 -->
<c:forEach items="${list}" var="list"> <!-- 商品リストのループ -->
<li class="list-group-item mt-5">
	<div class="">
	<img src="${list.gdsThumbImg}" class="img-thumbnail"/> <!-- 商品サムネイル画像 -->
	</div>
	<div class="text-center">
	<a href="/shop/view?n=${list.gdsNum}" class="">
	${list.gdsName} <!-- 商品名表示 -->
	</a>
	</div>
</li>
</c:forEach>	
</ul>	<!-- 商品リストの終了 -->
		</div>
	</div>
</div>

<jsp:include page="../include/footer.jsp" /> <!-- フッターのインクルード -->