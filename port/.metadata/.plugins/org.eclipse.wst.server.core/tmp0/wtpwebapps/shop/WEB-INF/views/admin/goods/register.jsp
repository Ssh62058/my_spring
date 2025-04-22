<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../include/header.jsp"/>

<div class="container-fluid bg-gradient-primary">
<div class="row">
<div class="col-md-12">
<div class="d-flex">
<div class="w-25">
<div class="mt-5 pt-5"></div>
<jsp:include page="../include/lnb.jsp"/>
</div>
<div class="w-75 p-4 mt-5 pt-5 ">
<h2 class="text-white fw-bold">商品登録</h2>
<form method="post" enctype="multipart/form-data"><!-- イメージや他のファイルを登録する際に使用 --> 
<div class="input-group">
<label class="form-label text-white">一次分類</label>
<select class="form-select category1 mx-3">
<option value="">
全体
</option>
</select>
<label class="form-label text-white">二次分類</label>
<select class="form-select category2 mx-3" name="cateCode">
<option value="">
全体
</option>
</select>
</div>

<div class="input-group mt-5">
<label class="form-label text-white w-10">商品名</label>
<input type="text" id="gdsName" name="gdsName" class="form-control w-90" required/>
</div>

<div class="input-group mt-5">
<label class="form-label text-white w-10">商品価格</label>
<input type="text" id="gdsPrice" name="gdsPrice" class="form-control w-90" required/>
</div>

<div class="input-group mt-5"><!-- 数量フィールドでは数値以外の文字列を使用できないように設定 -->
<label class="form-label text-white w-10">商品数量</label>
<input type="text" id="gdsStock" name="gdsStock" class="form-control w-90" required/>
</div>

<div class="input-group mt-5">
<label class="form-label text-white w-10">商品紹介</label>
<textarea rows="5" id="gdsDes" name="gdsDes" class="form-control" required>内容を記入してください</textarea>
<script src="${contextPath}/resources/js/ckeditorConfig.js">
</script>
</div>

<div class="input-group mt-5"><!-- 実際にファイルをアップロードする場所 -->
<label class="form-label text-white w-10">イメージ</label>
<input type="file" id="gdsImg" name="file" class="form-control w-90"/>
</div>

<!-- アップロードしたイメージを確認 -->
<div class="select_img my-3">
<img src="" style="width:100px;"/>
</div>
<div class="d-flex">
<div class="text-white">原本イメージ</div>
<img src="${goods.gdsImg}" style="width:100px;"/>
<div class="text-white">サムネイル</div>
<img src="${goods.gdsThumbImg}" style="width:50px;"/>
</div>
<script src="${contextPath}/resources/js/changeImgFunction.js"></script>
<div class="text-white"><%=request.getRealPath("/") %></div>
<button type="submit" id="register_Btn" class="btn btn-warning btn-lg btn-block my-4">
登録
</button>
</form>
<script>
let jsonData = JSON.parse('${category}');
</script>
<script src="${contextPath}/resources/js/jsonDrop.js"><!-- 二つのドロップダウンでカテゴリを選択する際、JSONを利用してOracle DBのカテゴリを選択 -->
</script>
</div>
</div>
</div>
</div>
</div>

<jsp:include page="../../include/footer.jsp"/>