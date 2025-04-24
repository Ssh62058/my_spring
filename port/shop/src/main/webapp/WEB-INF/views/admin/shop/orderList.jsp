<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTLのcoreタグライブラリを使用 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <!-- JSTLのフォーマットタグライブラリを使用 -->
<jsp:include page="../../include/header.jsp" /> <!-- ヘッダー部分をインクルード -->

<div class="container-fluid bg-gradient-primary min-vh-100"> <!-- 背景がグラデーションのコンテナ -->
	<div class="row">
		<div class="col-md-3 mt-5 pt-5">
			<jsp:include page="../include/lnb.jsp" /> <!-- サイドメニュー部分をインクルード -->
		</div>		
		<div class="col-md-9 mt-5 pt-5">
			<h2 class="text-white fw-bold">注文一覧</h2> <!-- 注文一覧タイトル -->
				<ul class="bg-white list-group mt-3"> <!-- 注文リスト -->
					<c:forEach items="${orderList}" var="orderList"> <!-- 注文データをループして表示 -->
						<li class="list-group-item"> <!-- 個別の注文情報 -->
							<div>
								<pre>
									<span class="fw-bold">注文番号</span>		<a href="/admin/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a> <!-- 注文番号へのリンク -->
									<span class="fw-bold">注文者</span>			${orderList.userId}	<!-- 注文者のユーザーID -->
									<span class="fw-bold">受取人</span>			${orderList.orderRec}	<!-- 受取人名 -->
									<span class="fw-bold">住所</span>			(${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3} <!-- 配送先住所 -->
									<span class="fw-bold">価格</span>			<fmt:formatNumber pattern="###,###,###" value="${orderList.amount}"/> <!-- 注文価格をフォーマットして表示 -->
									<span class="fw-bold">状態</span>			${orderList.delivery} <!-- 配送状態 -->
								</pre>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

<jsp:include page="../../include/footer.jsp" /> <!-- フッター部分をインクルード -->