<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../include/header.jsp"/>

<div class="container-fluid bg-gradient-primary">
<div class="row">
<div class="col-md-12">
<div class="d-flex">
<div class="w-25">
<div class="mt-1"></div>
<jsp:include page="../include/lnb.jsp"/>
</div>
<div class="w-75 p-4">
<h2 class="mt-5 mb-3 text-white">상품등록</h2>
<form method="post" enctype="multipart/form-data"><!-- 이미지나 다른 파일을 등록할때  -->
<div class="input-group">
<label class="form-label text-white">1차 분류</label>
<select class="form-select category1 mx-3">
<option value="">
전체
</option>
</select>
<label class="form-label text-white">2차 분류</label>
<select class="form-select category2 mx-3" name="cateCode">
<option value="">
전체
</option>
</select>
</div>

<div class="input-group mt-5">
<label class="form-label text-white w-10">상품명</label>
<input type="text" id="gdsName" name="gdsName" class="form-control w-90" required/>
</div>

<div class="input-group mt-5">
<label class="form-label text-white w-10">상품가격</label>
<input type="text" id="gdsPrice" name="gdsPrice" class="form-control w-90" required/>
</div>

<div class="input-group mt-5"><!-- 실패하는 경우 수량에는 숫자가 아닌 문자열을 사용할수 없게 만듬 10 11많음 -->
<label class="form-label text-white w-10">상품수량</label>
<input type="text" id="gdsStock" name="gdsStock" class="form-control w-90" required/>
</div>

<div class="input-group mt-5">
<label class="form-label text-white w-10">상품소개</label>
<textarea rows="5" id="gdsDes" name="gdsDes" class="form-control" required>내용을 적어주세요</textarea>
<script src="${contextPath}/resources/js/ckeditorConfig.js">
</script>
</div>

<div class="input-group mt-5"><!-- 실제 파일을 올리는곳 -->
<label class="form-label text-white w-10">이미지</label>
<input type="file" id="gdsImg" name="file" class="form-control w-90"/>
</div>

<!-- 아래는 올린 이미지를 확인 -->
<div class="select_img my-3">
<img src="" style="width:100px;"/>
</div>
<div class="d-flex">
<div class="text-white">원본 이미지</div>
<img src="${goods.gdsImg}" style="width:100px;"/>
<div class="text-white">썸네일</div>
<img src="${goods.gdsThumbImg}" style="width:50px;"/>
</div>
<script src="${contextPath}/resources/js/changeImgFunction.js"></script>
<div class="text-white"><%=request.getRealPath("/") %></div>
<button type="submit" id="register_Btn" class="btn btn-warning btn-lg btn-block my-4">
등록
</button>
</form>
<script>
let jsonData = JSON.parse('${category}');
</script>
<script src="${contextPath}/resources/js/jsonDrop.js"><!--2개의 드롭다운으로 카테고리를 선택할때 json으로 오라클에db 카테고리를 선택-->
</script>
</div>
</div>
</div>
</div>
</div>


<jsp:include page="../../include/footer.jsp"/>