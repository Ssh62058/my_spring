<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../../include/header.jsp"/>
<div class="container-fluid bg-gradient-primary">
<div class="row">
<div class="col-md-12">
<div class="d-flex">
<div class="w-25">
<div class="mt-5 pt-5"></div>
<jsp:include page="../include/lnb.jsp"/>
</div>
<div class="w-75 p-3 mt-5 pt-5">
<form role="form" method="post" enctype="multipart/form-data">
<input type="hidden" name="gdsNum" value="${goods.gdsNum}"/>

<div class="d-flex my-3">
	<div class="text-white">登録済みカテゴリ</div>
	<div class="text-white mx-3">${goods.cateName}</div>
	<div class="text-white mx-3">${goods.cateCode}</div>
</div>

<!-- カテゴリ -->

<div class="d-flex">
	<label class="form-label fw-bold text-white">一次分類
	    <select name="category1" id="" class="form-select category1">

	  <c:forEach var="cate" items="${category}">
        <c:if test="${cate.cateCodeRef == null}">
          <option value="${cate.cateCode}" ${goods.cateCodeRef == cate.cateCode ? 'selected' : ''}>
                ${cate.cateName}>
          </option>
      	</c:if>
      	<c:if test="${cate.cateCodeRef != null}">
      		<option value="">
      		${cate.cateName}
      		</option>
      	</c:if>
      </c:forEach>
	    </select>
	</label>

    <label class="form-label fw-bold mx-3 text-white">二次分類
        <select name="cateCode" id="" class="form-select category2">
			<c:forEach var="cate" items="${category}">
		        <c:if test="${cate.cateCodeRef != null}">

		            <option value="${cate.cateCode}" 
		                data-ref="${cate.cateCodeRef}"
		                ${goods.cateCode == cate.cateCode ? 'selected' : ''}>
		                ${cate.cateName}
		            </option>
		            
		            
		        </c:if>
		    </c:forEach>
        </select>
    </label>
</div>
<script src="${contextPath}/resources/js/newSelect.js"></script>

<!-- 修正時には作成とは異なり、以前使用した内容を受け取る必要があるため、inputの値にELを入力 -->
<div class="input-group my-3">
    <label class="form-label fw-bold w-25 text-white">商品名</label>
    <input type="text" id="gdsName" name="gdsName" value="${goods.gdsName}" class="form-control">
</div>

<div class="input-group mb-3">
    <label class="form-label fw-bold w-25 text-white">商品価格</label>
    <input type="text" id="gdsPrice" name="gdsPrice" value="${goods.gdsPrice}" class="form-control">
</div>

<div class="input-group my-3">
    <label class="form-label fw-bold w-25 text-white">商品数量</label>
    <input type="text" id="gdsStock" name="gdsStock" value="${goods.gdsStock}" class="form-control">
</div>

<div class="input-group">
    <label class="form-label w-25 fw-bold text-white">商品紹介</label>
    <textarea name="gdsDes" id="gdsDes" rows="5">${goods.gdsDes}</textarea>
<script src="${contextPath}/resources/js/ckeditorConfig.js">
</script>
</div>

<!-- 画像追加 -->
<div class="input-group mt-3">
    <label class="form-label fw-bold w-25 text-white">画像</label>
    <input type="file" id="gdsImg" name="file" class="form-control"/>
</div>
<div class="my-3">
    <div class="select_img d-flex justify-content-end">
        <img src="${goods.gdsImg}" alt="画像です" class="thumb img-thumbnail">
        <input type="hidden" name="gdsImg" value="${goods.gdsImg}"/>
        <input type="hidden" name="gdsThumbImg" value="${goods.gdsThumbImg}"/>
    </div>
<script src="${contextPath}/resources/js/changeImgFunction.js">       
</script>
<div class="my-2 text-white d-flex justify-content-end"><%=request.getRealPath("/")%></div>

</div>

<!-- ボタンセット -->
<div class="d-flex justify-content-end my-5">
    <div class="btn-group">
<button type="submit" id="update_Btn" class="btn btn-outline-warning btn-lg">完了</button>
<button type="button" id="back_Btn" class="btn btn-outline-warning btn-lg">キャンセル</button>
    </div>
</div>
<script src="${contextPath}/resources/js/backBtn.js">
</script>
<script type="text/javascript">
var jsonData = JSON.parse('${category}');
</script>
<!--  <script src="${contextPath}/resources/js/jsonDrop2.js"></script>-->
</form>
</div>
</div>
</div>
</div>
</div>

<jsp:include page="../../include/footer.jsp"/>