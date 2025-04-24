<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- JSPページの基本設定 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTLコアタグライブラリ -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <!-- JSTLフォーマットタグライブラリ -->
<jsp:include page="../include/header.jsp" /> <!-- ヘッダーのインクルード -->

<div class="container-fluid min-vh-100"> <!-- 全画面高さを持つコンテナ -->
	<div class="row">
		<div class="col-md-2 mt-5 pt-5">
<jsp:include page="../include/aside.jsp" /> <!-- サイドバーのインクルード -->
		</div>
		<div class="col-md-1 d-flex">
		<div class="vr"></div> <!-- 垂直の区切り線 -->
	    </div>
		<div class="col-md-9 mt-5 pt-5"> <!-- メインコンテンツ部分 -->
			<ul class="list-group list-group-flush"> <!-- フラッシュスタイルのリストグループ -->
				<c:forEach items="${orderList}" var="orderList"> <!-- 注文リストをループで出力 -->
				<li class="list-group-item">
					<pre>
						<span class="fw-bold">注文番号</span>	<a href="/shop/orderView?n=${orderList.orderId}" class="">${orderList.orderId}</a>
						<span class="fw-bold">受取人</span>		${orderList.orderRec}
						<span class="fw-bold">住所</span>		(${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3}
						<span class="fw-bold">価格</span>		<fmt:formatNumber pattern="###,###,###" value="${orderList.amount}"/> 円
						<span class="fw-bold">状態</span>		${orderList.delivery}
					</pre> <!-- 注文情報の詳細表示 -->
				</li>	
				</c:forEach>
			</ul>
		</div>
	</div>
</div>

<jsp:include page="../include/footer.jsp" /> <!-- フッターのインクルード -->