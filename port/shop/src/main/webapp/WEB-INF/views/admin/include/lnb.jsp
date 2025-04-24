<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> <!-- アプリケーションのコンテキストパスを設定 -->

<div class="mt-3">&nbsp;</div>
<ul class="list-group mt-10"> <!-- サイドメニューのリスト -->

<li class="list-group-item">
	<a href="${contextPath}/admin/goods/register" class="a-link text-decoration-none"> <!-- 商品登録ページへのリンク -->
	商品登録
	</a>
</li>

<li class="list-group-item">
	<a href="${contextPath}/admin/goods/list" class="a-link text-decoration-none"> <!-- 商品一覧ページへのリンク -->
	商品一覧
	</a>
</li>

<li class="list-group-item">
	<a href="${contextPath}/admin/shop/orderList" class="a-link text-decoration-none"> <!-- 注文一覧ページへのリンク -->
	注文一覧
	</a>
</li>

<li class="list-group-item">
	<a href="${contextPath}/admin/shop/allReply" class="a-link text-decoration-none"> <!-- 商品レビュー一覧ページへのリンク -->
	商品感想
	</a>
</li>

<li class="list-group-item">
	<a href="${contextPath}/admin/shop/allUser" class="a-link text-decoration-none"> <!-- ユーザー一覧ページへのリンク -->
	ユーザー一覧
	</a>
</li>

</ul>