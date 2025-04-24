<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../../include/header.jsp" /> <!-- ヘッダー部分をインクルード -->

<div class="container-fluid bg-gradient-primary min-vh-100 mt-5"> <!-- 背景がグラデーションのコンテナ -->
	<div class="row">
		<div class="col-md-3 pt-5">
			<jsp:include page="../include/lnb.jsp" /> <!-- サイドメニュー部分をインクルード -->
		</div>
		<div class="col-md-9 pt-5">
			<h2 class="text-white fw-bold">会員一覧</h2> <!-- 会員一覧タイトル -->
			<table class="table table-hover"> <!-- 会員情報を表示するテーブル -->
				<colgroup> <!-- 列幅の設定 -->
					<col style="width:11.11%"/>
					<col style="width:11.11%"/>
					<col style="width:11.11%"/>
					<col style="width:11.11%"/>
					<col style="width:11.11%"/>
					<col style="width:11.11%"/>
					<col style="width:11.11%"/>
					<col style="width:11.11%"/>
					<col style="width:11.11%"/>
					<col style="width:11.11%"/>
				</colgroup>
				<thead> <!-- テーブルヘッダー -->
					<tr>
					<th>ユーザーID</th> <!-- ユーザーID列 -->
					<th>名前</th> <!-- 名前列 -->
					<th>ユーザーのメールアドレス</th> <!-- メールアドレス列 -->
					<th>電話番号</th> <!-- 電話番号列 -->
					<th>住所1</th> <!-- 住所1列 -->
					<th>住所2</th> <!-- 住所2列 -->
					<th>住所3</th> <!-- 住所3列 -->
					<th>登録日</th> <!-- 登録日列 -->
					<th>会員グレード</th> <!-- 会員グレード列 -->
					</tr>
				</thead>
				<tbody> <!-- テーブルボディ -->
					<c:forEach items="${memberList}" var="memberList"> <!-- 会員情報をループして表示 -->
					<tr>
					<td>${memberList.userId }</td> <!-- ユーザーID -->
					<td>${memberList.userName }</td> <!-- 名前 -->
					<td>${memberList.userEmail }</td> <!-- メールアドレス -->
					<td>${memberList.userPhone }</td> <!-- 電話番号 -->
					<td>${memberList.userAddr1 }</td> <!-- 住所1 -->
					<td>${memberList.userAddr2 }</td> <!-- 住所2 -->
					<td>${memberList.userAddr3 }</td> <!-- 住所3 -->
					<td>${memberList.regiDate }</td> <!-- 登録日 -->
					<c:if test="${memberList.verify==9}"><td>管理者</td></c:if> <!-- 管理者の場合 -->
					<c:if test="${memberList.verify==0}"><td>一般客</td></c:if> <!-- 一般客の場合 -->
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<jsp:include page="../../include/footer.jsp" /> <!-- フッター部分をインクルード -->