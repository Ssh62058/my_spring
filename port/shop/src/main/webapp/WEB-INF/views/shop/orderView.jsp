<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- JSPページの基本設定 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTLコアタグライブラリ -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <!-- JSTLフォーマットタグライブラリ -->
<jsp:include page="../include/header.jsp" /> <!-- ヘッダー部分をインクルード -->

<div class="container-fluid min-vh-100"> <!-- 画面全体の高さを持つコンテナ -->
	<div class="row">
		<div class="col-md-2 mt-5 pt-5">
<jsp:include page="../include/aside.jsp" /> <!-- サイドバーのインクルード -->
		</div>
		<div class="col-md-1 d-flex">
		<div class="vr"></div> <!-- 垂直の区切り線 -->
	    </div>
		<div class="col-md-9 mt-5 pt-5"> <!-- メインコンテンツ領域 -->
			<c:forEach items="${orderView}" var="orderView" varStatus="status">
				<c:if test="${status.first}"> <!-- 最初のアイテムのみ、注文概要を表示 -->
					<pre>
	<span class="fw-bold">注文者</span>	${orderView.userId}
	<span class="fw-bold">受取人</span>	${orderView.orderRec}
	<span class="fw-bold">住所地</span>	(${orderView.userAddr1}) ${orderView.userAddr2} ${orderView.userAddr3}
	<span class="fw-bold">価格</span> 	<fmt:formatNumber pattern="###,###,###" value="${orderView.amount}"/>円
	<span class="fw-bold">状態</span> 	${orderView.delivery}
					</pre>
				</c:if>
			</c:forEach>
			<h2>注文詳細</h2>	<!-- 注文詳細タイトル -->
			<hr color="black" style="width:120px; border: 1px solid;"/> <!-- タイトル下の仕切り線 -->
			<ul class="orderView list-group mt-3">
			<table class="table table-dark table-hover"> <!-- 注文詳細のテーブル表示 -->
			<colgroup>
			<col width="20%"/>
			<col width="80%"/>
			</colgroup>
			<thead class="text-center">
			<tr>
			<th>IMAGE</th><th>CONTENTS</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${orderView}" var="orderView"> <!-- 注文商品の詳細をループで表示 -->
			<tr>
			<td>
			<li class="list-group-item">
			<div class="">
			<img src="${orderView.gdsThumbImg}" class="img-thumbnail"/> <!-- 商品サムネイル画像 -->
			</div>
			</td>
			<td>
			<div>
			<pre>
			<span class="fw-bold">商品名</span>  	${orderView.gdsName}
			<span class="fw-bold">単価</span> 		<fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice}"/> 円
			<span class="fw-bold">購入数量</span> 	${orderView.cartStock} 個
			<span class="fw-bold">最終価格</span> 	<fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice * orderView.cartStock}"/> 円
			</pre>
			</div>
			</li>
			</td>
			</tr>
			</c:forEach>
			</tbody>
			</table>
			</ul>
		</div>
	</div>
</div>

<jsp:include page="../include/footer.jsp" /> <!-- フッター部分をインクルード -->