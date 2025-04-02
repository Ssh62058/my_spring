<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../../include/header.jsp" flush="false"/>

<div class="container-fluid bg-gradient-primary">
<div class="row">
<div class="col-md-12">
<div class="d-flex">
<div class="w-25">
<div class="mt-1"></div>
<jsp:include page="../include/lnb.jsp"/>
</div>
<div class="w-75 p-3">
<!-- 내용 -->
<h2 class="mt-5 mb-3 text-white fw-bold">상품목록</h2>
<div class="my-3">
<ul class="breadcrumb">
  <li class="breadcrumb-item text-warning"><a href="#" class="text-warning">Photos</a></li>
  <li class="breadcrumb-item text-warning"><a href="#" class="text-warning">Summer 2017</a></li>
  <li class="breadcrumb-item text-warning"><a href="#" class="text-warning">Italy</a></li>
  <li class="breadcrumb-item active text-white fw-bold">Rome</li>
</ul>
</div>
<table class="table table-dark table-hover">
<colgroup>
<col width="5%"/>
<col width="10%"/>
<col width="40%"/>
<col width="10%"/>
<col width="5%"/>
<col width="5%"/>
<col width="20%"/>
</colgroup>
<thead>
<tr class="text-center">
<th>번호</th><th>상품이미지</th><th>상품제목</th><th>카테고리</th><th>가격</th><th>수량</th><th>등록날짜</th>
</tr>
</thead>

<tbody>
<c:forEach items="${list}" var="list">
<tr>
<td class="text-center">${list.gdsNum}</td>
<td><img src="${list.gdsThumbImg}" class="thumb img-thumbnail"/></td>
<td>
<a href="/admin/goods/view?n=${list.gdsNum}" class="text-white">
<!-- 제목을 클릭할때 맞는 순번 상품순서로 view page-->
${list.gdsName}<!-- 제목 -->
</a>
</td>
<td class="text-center">${list.cateCode}</td>
<td class="text-center">${list.gdsPrice}</td>
<td class="text-center">${list.gdsStock}</td>
<td class="text-center">${list.gdsDate}</td>
</tr>
</c:forEach>
</tbody>
</table>



<div class="d-flex justify-content-center my-5">
<ul class="pagination">
  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
  <li class="page-item active"><a class="page-link" href="#">1</a></li>
  <li class="page-item"><a class="page-link" href="#">2</a></li>
  <li class="page-item"><a class="page-link" href="#">3</a></li>
  <li class="page-item"><a class="page-link" href="#">Next</a></li>
</ul>



</div>








</div>
</div>
</div>
</div>
</div>


<jsp:include page="../../include/footer.jsp"/>