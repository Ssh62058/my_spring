<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../../include/header.jsp" flush="false"/> <!-- ヘッダー部分のインクルード -->

<div class="container-fluid bg-gradient-primary min-vh-100">
<div class="row">
<div class="col-md-12">
<div class="d-flex">
<div class="w-25">
<div class="mt-5 pt-5"></div>
<jsp:include page="../include/lnb.jsp"/> <!-- サイドメニュー部分のインクルード -->
</div>
<div class="w-75 p-3 mt-5 pt-5 ">
<!-- コンテンツ表示部分 -->
<h2 class="text-white fw-bold">商品一覧</h2>
<table class="table table-dark table-hover">
<colgroup>
<col width="5%"/> <!-- 番号列の幅 -->
<col width="10%"/> <!-- 商品画像列の幅 -->
<col width="40%"/> <!-- 商品タイトル列の幅 -->
<col width="10%"/> <!-- カテゴリー列の幅 -->
<col width="5%"/> <!-- 価格列の幅 -->
<col width="5%"/> <!-- 数量列の幅 -->
<col width="20%"/> <!-- 登録日列の幅 -->
</colgroup>
<thead>
<tr class="text-center">
<th>番号</th><th>商品画像</th><th>商品タイトル</th><th>カテゴリー</th><th>価格</th><th>数量</th><th>登録日</th>
</tr>
</thead>

<tbody>
<c:forEach items="${list}" var="list"> <!-- 商品リストをループして表示 -->
<tr>
<td class="text-center">${list.gdsNum}</td> <!-- 商品番号 -->
<td><img src="${list.gdsThumbImg}" class="thumb img-thumbnail"/></td> <!-- 商品画像 -->
<td>
<a href="/admin/goods/view?n=${list.gdsNum}" class="text-white">
<!-- タイトルをクリックすると、対応する商品の詳細ページに遷移 -->
${list.gdsName} <!-- 商品タイトル -->
</a>
</td>
<td class="text-center">${list.cateCode}</td> <!-- カテゴリーコード -->
<td class="text-center">${list.gdsPrice}</td> <!-- 商品価格 -->
<td class="text-center">${list.gdsStock}</td> <!-- 商品数量 -->
<td class="text-center">${list.gdsDate}</td> <!-- 登録日 -->
</tr>
</c:forEach>
</tbody>
</table>


<div class="d-flex justify-content-center my-5"> <!-- ページネーション部分 -->
<ul class="pagination">
  <li class="page-item"><a class="page-link" href="#">Previous</a></li> <!-- 前のページ -->
  <li class="page-item active"><a class="page-link" href="#">1</a></li> <!-- 現在のページ -->
  <li class="page-item"><a class="page-link" href="#">2</a></li> <!-- 次のページ -->
  <li class="page-item"><a class="page-link" href="#">3</a></li> <!-- さらに次のページ -->
  <li class="page-item"><a class="page-link" href="#">Next</a></li> <!-- 次のページ -->
</ul>
</div>
</div>
</div>
</div>
</div>
</div>

<jsp:include page="../../include/footer.jsp"/> <!-- フッター部分のインクルード -->