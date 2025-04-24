<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../../include/header.jsp" />

<div class="container-fluid bg-gradient-primary min-vh-100 mt-5">
	<div class="row">
		<div class="col-md-3 pt-5">
<jsp:include page="../include/lnb.jsp" />		
		</div>
		<div class="col-md-9 pt-5">
			<h2 class="text-white fw-bold">会員一覧</h2>
			<table class="table table-hover">
				<colgroup>
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
				<thead>
					<tr>
					<th>ユーザーID</th>
					<th>名前</th>
					<th>ユーザーのメールアドレス</th>
					<th>電話番号</th>
					<th>住所1</th>
					<th>住所2</th>
					<th>住所3</th>
					<th>登録日</th>
					<th>会員グレード</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${memberList}" var="memberList">
					<tr>
					<td>${memberList.userId }</td>
					<td>${memberList.userName }</td>
					<td>${memberList.userEmail }</td>
					<td>${memberList.userPhone }</td>
					<td>${memberList.userAddr1 }</td>
					<td>${memberList.userAddr2 }</td>
					<td>${memberList.userAddr3 }</td>
					<td>${memberList.regiDate }</td>
					<td>${memberList.verify }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<jsp:include page="../../include/footer.jsp" />