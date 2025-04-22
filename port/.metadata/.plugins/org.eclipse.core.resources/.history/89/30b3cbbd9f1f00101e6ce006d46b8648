<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp" flush="false" />



<div class="container-fluid min-vh-100">
<div class="row">
<div class="col-md-2 mt-5 pt-5">
<jsp:include page="../include/aside.jsp" />		
		</div>
		<div class="col-md-1 d-flex">
		<div class="vr"></div>
	    </div>
<div class="col-md-9">

<section id="container" class="mt-5 pt-5">
		<div id="container_box">
		<h1 class="mt-5">CartList</h1>
			<section id="content">
					
				<ul class="list-group list-group-flush">
					<li class="list-group-item">
						<div class="allCheck">
						<div class="input-group">
						<input type="checkbox" name="allCheck" id="allCheck" class="form-check"/>
						<label for="allCheck" class="form-lable mx-2">모두 선택</label>
						</div>
					
						</div>
						
						<div class="delBtn my-2">
							<button type="button" class="selectDelete_btn btn btn-outline-danger btn-lg">선택 삭제</button>
							
						</div>
						
					</li>
				
					<%-- jsp상의 변수 선언 --%>
					<c:set var="sum" value="0" />
				
					<c:forEach items="${cartList}" var="cartList">
					<li class="list-group-item">
						<div class="checkBox">
							<input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}" />
							<script>
								$(".chBox").click(function(){
									$("#allCheck").prop("checked", false);
								});
							</script>
						</div>
					
						<div class="d-flex justify-content-between align-items-center">
							<img src="${cartList.gdsThumbImg}" class="img-thumbnail w-25"/>
							
							<div class="gdsInfo w-75 mx-3">
<p class="p-3">
	<div>상품명<span class="mx-3">${cartList.gdsName}</span></div>
	<div>개당 가격<span class="mx-3"><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}" /> 원</span></div>
	<div>구입 수량<span class="mx-3">${cartList.cartStock} 개</span></div>
	<div>최종 가격<span class="mx-3"><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}" /> 원</span></div>
</p>
						</div>
						</div>

							
<div class="delete d-flex justify-content-end">
								<button type="button" class="delete_${cartList.cartNum}_btn btn btn-outline-danger px-5" data-cartNum="${cartList.cartNum}">삭제</button>
								<script>
									$(".delete_${cartList.cartNum}_btn").click(function(){
										var confirm_val = confirm("정말 삭제하시겠습니까?");
										
										if(confirm_val) {
											var checkArr = new Array();
											
											checkArr.push($(this).attr("data-cartNum"));
																						
											$.ajax({
												url : "/shop/deleteCart",
												type : "post",
												data : { chbox : checkArr },
												success : function(result){
													if(result == 1) {												
														location.href = "/shop/cartList";
													} else {
														alert("삭제 실패");
													}
												}
											});
										}	
									});
								</script>								
								<script>
									
								</script>
							</div>
						</div>			
					</li>
					
					<%-- 반복할 때마다 sum에 상품 가격(gdsPrice)*상품 갯수(cartStock)만큼을 더함 --%>
					<c:set var="sum" value="${sum + (cartList.gdsPrice * cartList.cartStock)}" />
					
					</c:forEach>
				</ul>
			
			<div class="listResult">
				<div class="sum my-3">
					총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원
				</div>
				<div class="orderOpne mt-3 mb-3">
					<button type="button" class="orderOpne_bnt btn btn-outline-success">주문 정보 입력</button>
					

					
				</div>
			</div>
			
			<div class="orderInfo">
				<form role="form" method="post" autocomplete="off">
							
					<input type="hidden" name="amount" value="${sum}" />
							
					<div class="inputArea input-group mb-3">
						<label for="" class="form-label w-10">수령인</label>
						<input type="text" name="orderRec" id="orderRec" required="required" class="form-control w-90"/>
					</div>
					
					<div class="inputArea input-group">
						<label for="orderPhone" class="form-label w-10">수령인 연락처</label>
						<input type="text" name="orderPhone" id="orderPhone" required="required" class="form-control w-90"/>
					</div>
					<!-- 
					<div class="inputArea">
						<label for="userAddr1">우편번호</label>
						<input type="text" name="userAddr1" id="userAddr1" required="required" />
					</div>
					
					<div class="inputArea">
						<label for="userAddr2">1차 주소</label>
						<input type="text" name="userAddr2" id="userAddr2" required="required" />
					</div>
					
					<div class="inputArea">
						<label for="userAddr3">2차 주소</label>
						<input type="text" name="userAddr3" id="userAddr3" required="required" />
					</div>
					-->
					<div class="inputArea">
					

						<div class="input-group my-3">
							<input type="text" id="sample2_postcode" placeholder="우편번호" class="form-control">
							<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기" class="btn btn-outline-success">
						</div>

						<p class="my-5">
							<input type="text" name="userAddr1" id="sample2_address" placeholder="주소" class="form-control">
							<input type="text" name="userAddr2" id="sample2_detailAddress" placeholder="상세주소" class="form-control my-3">
							<input type="text" name="userAddr3" id="sample2_extraAddress" placeholder="참고항목" class="form-control">
						</p>
						
						<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
						<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div>
						
						<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
						<script src="${contextPath}/resources/js/daumlayer.js"></script>
					</div>
					
					<div class="inputArea my-5">
					<div class="my-5 d-flex justify-content-end my-5">
					<div class="btn-group">
						<button type="submit" class="order_btn  mb-5 btn btn-outline-success">주문</button>
						<button type="button" class="cancel_btn mb-5 btn btn-outline-danger">취소</button>
					</div>

					</div>


						
					</div>
					
				</form>	
			</div>
			
				
			</section>
</div>
</div>
</div>
<script src="${contextPath}/resources/js/cartlist.js"></script>	

<jsp:include page="../include/footer.jsp" flush="false" />