<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../../include/header.jsp" flush="false"/>

<div class="container-fluid bg-gradient-primary min-vh-100">
<div class="row">
<div class="col-md-12">
<div class="d-flex">
<div class="w-25">
<div class="mt-5 pt-5"></div>
<jsp:include page="../include/lnb.jsp"/>
</div>
<div class="w-75 p-3 mt-5 pt-5 ">
<!-- コンテンツ -->
<h2 class="text-white fw-bold">商品一覧</h2>
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
<th>番号</th><th>商品画像</th><th>商品タイトル</th><th>カテゴリー</th><th>価格</th><th>数量</th><th>登録日</th>
</tr>
</thead>

<tbody>
<c:forEach items="${list}" var="list">
<tr>
<td class="text-center">${list.gdsNum}</td>
<td><img src="${list.gdsThumbImg}" class="thumb img-thumbnail"/></td>
<td>
<a href="/admin/goods/view?n=${list.gdsNum}" class="text-white">
<!-- タイトルをクリックすると、対応する順番の商品詳細ページに遷移 -->
${list.gdsName}<!-- タイトル -->
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