<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../../include/header.jsp"/>

<div class="container-fluid bg-gradient-primary">
<div class="row">
<div class="col-md-12">
<div class="d-flex">
<div class="w-25">
<div class="mt-1"></div>
<jsp:include page="../include/lnb.jsp"/>
</div>
<div class="w-75 p-5">
<h1 class="my-5 text-white">view</h1>
<form role="form" method="post" autocomplete="off"><!-- jquery나 ajax일때는 method form 적지 말것 -->
<input type="hidden" name="n" value="${goods.gdsNum}"/>
<!-- 카테고리 -->
<div class="input-group">
<label class="form-label fw-bold text-white">1차 분류</label>
<span class=" mx-2 text-white">${goods.cateName}</span>
<label class="form-label fw-bold text-white">2차 분류</label>
<span class=" mx-2 text-white">${goods.cateCode}</span>
</div>

<div class="input-group">
	<label class="form-label w-25 fw-bold text-white">메인 이미지</label>
	
</div>

<div class="w-100 d-flex justify-content-center my-5">
	<img src="${goods.gdsImg}" class="w-50 img-thumbnail"/>
</div>

<div class="input-group">
	<label class="form-label w-25 fw-bold text-white">상품명</label>
	<span class="w-75 text-white">${goods.gdsName}</span>
</div>

<div class="input-group">
	<label class="form-label w-25 fw-bold text-white">상품가격</label>
	<span class="w-75 text-white">
<fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###"/>
	</span>
</div>

<div class="input-group">
	<label class="form-label w-25 fw-bold text-white">상품수량</label>
	<span class="w-75 text-white">${goods.gdsStock}</span>
</div>

<div class="input-group">
	<label class="form-label w-25 fw-bold text-white">상품소개</label>
	<span class="w-75 text-white">${goods.gdsDes}</span>
</div>

<div class="d-flex justify-content-end my-5">
	<div class="btn-group">
		<button id="modify_Btn" class="btn btn-outline-warning btn-lg">수정</button>
		<button id="delete_Btn" class="btn btn-outline-warning btn-lg">삭제</button>
	</div>
</div>
<script src="${contextPath}/resources/js/viewjs_01.js"></script>
</form>
<!-- 무리가 없는한 자바스크립트나 jquery는 linking으로 -->

</div>
</div>
</div>
</div>
</div>


<jsp:include page="../../include/footer.jsp"/>