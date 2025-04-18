<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../../include/header.jsp" />

<div class="container-fluid bg-gradient-primary min-vh-100">
	<div class="row">
		<div class="col-md-3 mt-5 pt-5">
<jsp:include page="../include/lnb.jsp" />
</div>		
			<div class="col-md-9 mt-5 pt-5">
			<h2 class="text-white fw-bold">주문목록</h2>
				<ul class="bg-white list-group mt-3">
					<c:forEach items="${orderList}" var="orderList">
						<li class="list-group-item">
							<div>
								<pre>
									<span class="fw-bold">주문 번호</span>		<a href="/admin/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a>	
									<span class="fw-bold">주문자</span>		${orderList.userId}	
									<span class="fw-bold">수령동지</span>		${orderList.orderRec}	
									<span class="fw-bold">주소</span>			(${orderList.userAddr1}) ${orderList.userAddr1} ${orderList.userAddr1}
									<span class="fw-bold">가격</span>			<fmt:formatNumber pattern="###,###,###" value="${orderList.amount}"/>
									<span class="fw-bold">상태</span>			${orderList.delivery}
								</pre>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

<jsp:include page="../../include/footer.jsp" />