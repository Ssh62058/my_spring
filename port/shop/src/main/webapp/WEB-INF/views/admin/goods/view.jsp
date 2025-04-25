<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../../include/header.jsp"/> <!-- ヘッダー部分をインクルード -->

<div class="container-fluid bg-gradient-primary">
<div class="row">
<div class="col-md-12">
<div class="d-flex">
<div class="w-25">
<div class="mt-5 pt-5"></div>
<jsp:include page="../include/lnb.jsp"/> <!-- サイドメニュー部分をインクルード -->
</div>
<div class="w-75 p-5 mt-5 pt-5">
<h1 class="my-5 text-white">view</h1>
<form role="form" method="post" autocomplete="off"> <!-- formのmethodを記載せず、JavaScriptやAJAXで操作 -->
<input type="hidden" name="n" value="${goods.gdsNum}"/> <!-- 商品番号を隠しフィールドとして設定 -->

<!-- カテゴリ表示 -->
<div class="input-group">
<label class="form-label fw-bold text-white">一次分類</label>
<span class="mx-2 text-white">${goods.cateName}</span> <!-- 一次カテゴリ名 -->
<label class="form-label fw-bold text-white">二次分類</label>
<span class="mx-2 text-white">${goods.cateCode}</span> <!-- 二次カテゴリコード -->
</div>

<!-- メイン画像 -->
<div class="input-group">
	<label class="form-label w-25 fw-bold text-white">メイン画像</label>
</div>
<div class="w-100 d-flex justify-content-center my-5">
	<img src="${goods.gdsImg}" class="w-50 img-thumbnail"/> <!-- 商品画像表示 -->
</div>

<!-- 商品名表示 -->
<div class="input-group">
	<label class="form-label w-25 fw-bold text-white">商品名</label>
	<span class="w-75 text-white">${goods.gdsName}</span>
</div>

<!-- 商品価格表示 -->
<div class="input-group">
	<label class="form-label w-25 fw-bold text-white">商品価格</label>
	<span class="w-75 text-white">
<fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###"/> <!-- 商品価格フォーマット -->
	</span>
</div>

<!-- 商品数量表示 -->
<div class="input-group">
	<label class="form-label w-25 fw-bold text-white">商品数量</label>
	<span class="w-75 text-white">${goods.gdsStock}</span>
</div>

<!-- 商品紹介表示 -->
<div class="input-group">
	<label class="form-label w-25 fw-bold text-white">商品紹介</label>
	<span class="w-75 text-white">${goods.gdsDes}</span>
</div>

<!-- 修正・削除ボタン -->
<div class="d-flex justify-content-end my-5">
	<div class="btn-group">
		<button id="modify_Btn" class="btn btn-outline-warning btn-lg">修正</button> <!-- 修正ボタン -->
		<button id="delete_Btn" class="btn btn-outline-warning btn-lg">削除</button> <!-- 削除ボタン -->
	</div>
</div>
<script src="${contextPath}/resources/js/viewjs_01.js"></script> <!-- 操作用JavaScriptファイル -->
</form>
<!-- JavaScriptやjQueryで問題がない場合はリンクとして設定 -->
</div>
</div>
</div>
</div>
</div>

<jsp:include page="../../include/footer.jsp"/> <!-- フッター部分をインクルード -->