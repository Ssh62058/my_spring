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
<div class="mt-1"></div>
<jsp:include page="../include/lnb.jsp"/>
</div>
<div class="w-75 p-3">
<form role="form" method="post" enctype="multipart/form-data">
<input type="hidden" name="gdsNum" value="${goods.gdsNum}"/>

<div class="d-flex my-3">
	<div class="text-white">기등록 카테고리</div>
	<div class="text-white mx-3">${goods.cateName}</div>
	<div class="text-white mx-3">${goods.cateCode}</div>
</div>

<!-- 카테고리 -->

<div class="d-flex">
	<label class="form-label fw-bold text-white">1차 분류
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

    <label class="form-label fw-bold mx-3 text-white">2차 분류
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

<!--수정할때 쓰기와 다른점 기존에 썼던 내용을 받아와야 해서 input에 밸류가 el로 들어감-->
<div class="input-group my-3">
    <label class="form-label fw-bold w-25 text-white">상품명</label>
    <input type="text" id="gdsName" name="gdsName" value="${goods.gdsName}" class="form-control">
</div>

<div class="input-group mb-3">
    <label class="form-label fw-bold w-25 text-white">상품가격</label>
    <input type="text" id="gdsPrice" name="gdsPrice" value="${goods.gdsPrice}" class="form-control">
</div>

<div class="input-group my-3">
    <label class="form-label fw-bold w-25 text-white">상품수량</label>
    <input type="text" id="gdsStock" name="gdsStock" value="${goods.gdsStock}" class="form-control">
</div>

<div class="input-group">
    <label class="form-label w-25 fw-bold text-white">상품소개</label>
    <textarea name="gdsDes" id="gdsDes" rows="5">${goods.gdsDes}</textarea>
<script src="${contextPath}/resources/js/ckeditorConfig.js">
</script>
</div>

<!--이미지 추가-->
<div class="input-group mt-3">
    <label class="form-label fw-bold w-25 text-white">이미지</label>
    <input type="file" id="gdsImg" name="file" class="form-control"/>
</div>
<div class="my-3">
    <div class="select_img d-flex justify-content-end">
        <img src="${goods.gdsImg}" alt="이미지 이므니다" class="thumb img-thumbnail">
        <input type="hidden" name="gdsImg" value="${goods.gdsImg}"/>
        <input type="hidden" name="gdsThumbImg" value="${goods.gdsThumbImg}"/>
    </div>
<script src="${contextPath}/resources/js/changeImgFunction.js">       
</script>
<div class="my-2 text-white d-flex justify-content-end"><%=request.getRealPath("/")%></div>

</div>

<!--버튼 세트-->
<div class="d-flex justify-content-end my-5">
    <div class="btn-group">
<button type="submit" id="update_Btn" class="btn btn-outline-warning btn-lg">완료</button>
<button type="button" id="back_Btn" class="btn btn-outline-warning btn-lg">취소</button>
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