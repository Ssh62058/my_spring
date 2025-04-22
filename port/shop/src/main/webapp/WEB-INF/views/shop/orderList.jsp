<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp" />

<div class="container-fluid min-vh-100">
	<div class="row">
		<div class="col-md-2 mt-5 pt-5">
<jsp:include page="../include/aside.jsp" />		
		</div>
		<div class="col-md-1 d-flex">
		<div class="vr"></div>
	    </div>
		<div class="col-md-9 mt-5 pt-5">
			<ul class="list-group list-group-flush">
				<c:forEach items="${orderList}" var="orderList">
				<li class="list-group-item">
					<pre>
						<span class="fw-bold">注文番号</span>	<a href="/shop/orderView?n=${orderList.orderId}" class="">${orderList.orderId}</a>
						<span class="fw-bold">受取人</span>		${orderList.orderRec}
						<span class="fw-bold">住所</span>		(${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3}
						<span class="fw-bold">価格</span>		<fmt:formatNumber pattern="###,###,###" value="${orderList.amount}"/> 円
						<span class="fw-bold">状態</span>		${orderList.delivery}
					</pre>
				</li>	
				</c:forEach>
			</ul>
		</div>
	</div>
</div>

<jsp:include page="../include/footer.jsp" />