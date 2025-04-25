<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../../include/header.jsp" /> <!-- ヘッダー部分をインクルード -->

<div class="container-fluid bg-gradient-primary min-vh-100 mt-5"> <!-- 背景がグラデーションのコンテナ -->
	<div class="row">
		<div class="col-md-3 pt-5 mb-5">
			<jsp:include page="../include/lnb.jsp" /> <!-- サイドメニューをインクルード -->
		</div>
		<div class="col-md-9 pt-5 mb-5">
		<h2 class="text-white fw-bold">コメント一覧</h2> <!-- コメント一覧タイトル -->
			<ul class="list-group bg-white"> <!-- コメントリスト -->
				<c:forEach items="${reply}" var="reply"> <!-- コメントをループして表示 -->
					<li class="replyInfo list-group-item">
						<pre>
							<span class="fw-bold">作成者</span>		${reply.userName}(${reply.userId}) <!-- コメント作成者 -->
							<span class="fw-bold">コメントを付けた製品</span>	<a href="/shop/view?n=${reply.gdsNum}">リンク</a> <!-- 商品リンク -->
							<span class="fw-bold">内容</span>
							${reply.repCon} <!-- コメント内容 -->
						</pre>
						<form role="form" method="post" class="">
							<input type="hidden" name="repNum" value="${reply.repNum}"/> <!-- コメント番号を隠しフィールドで送信 -->
							<div class="d-flex justify-content-end my-2">
								<button type="submit" class="delete_${reply.repNum}_btn btn btn-outline-danger">削除</button> <!-- コメント削除ボタン -->
							</div> 
						</form>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>

<jsp:include page="../../include/footer.jsp" /> <!-- フッター部分をインクルード -->