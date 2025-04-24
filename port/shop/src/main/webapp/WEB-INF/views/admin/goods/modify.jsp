<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../../include/header.jsp"/> <!-- ヘッダー部分をインクルード -->

<div class="container-fluid bg-gradient-primary">
<div class="row">
<div class="col-md-12">
<div class="d-flex">
<div class="w-25">
<div class="mt-5 pt-5"></div>
<jsp:include page="../include/lnb.jsp"/> <!-- サイドメニュー部分をインクルード -->
</div>
<div class="w-75 p-3 mt-5 pt-5">
<form role="form" method="post" enctype="multipart/form-data">
<input type="hidden" name="gdsNum" value="${goods.gdsNum}"/> <!-- 商品番号を隠しフィールドとして設定 -->

<div class="d-flex my-3">
	<div class="text-white">登録済みカテゴリ</div>
	<div class="text-white mx-3">${goods.cateName}</div> <!-- カテゴリ名を表示 -->
	<div class="text-white mx-3">${goods.cateCode}</div> <!-- カテゴリコードを表示 -->
</div>

<!-- カテゴリ選択 -->
<div class="d-flex">
	<label class="form-label fw-bold text-white">一次分類
	    <select name="category1" id="" class="form-select category1">
	  <c:forEach var="cate" items="${category}"> <!-- カテゴリリストをループ -->
        <c:if test="${cate.cateCodeRef == null}"> <!-- 親カテゴリ -->
          <option value="${cate.cateCode}" ${goods.cateCodeRef == cate.cateCode ? 'selected' : ''}>
                ${cate.cateName}>
          </option>
      	</c:if>
      	<c:if test="${cate.cateCodeRef != null}"> <!-- 子カテゴリ -->
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
		        <c:if test="${cate.cateCodeRef != null}"> <!-- 子カテゴリ -->
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
<script src="${contextPath}/resources/js/newSelect.js"></script> <!-- カテゴリ選択に関連するスクリプト -->

<!-- 商品情報の入力 -->
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
    <textarea name="gdsDes" id="gdsDes" rows="5">${goods.gdsDes}</textarea> <!-- 商品の説明を入力 -->
<script src="${contextPath}/resources/js/ckeditorConfig.js"></script> <!-- 商品説明に関連するスクリプト -->
</div>

<!-- 商品画像の追加 -->
<div class="input-group mt-3">
    <label class="form-label fw-bold w-25 text-white">画像</label>
    <input type="file" id="gdsImg" name="file" class="form-control"/> <!-- 商品画像をアップロード -->
</div>
<div class="my-3">
    <div class="select_img d-flex justify-content-end">
        <img src="${goods.gdsImg}" alt="画像です" class="thumb img-thumbnail"> <!-- 現在の画像を表示 -->
        <input type="hidden" name="gdsImg" value="${goods.gdsImg}"/> <!-- 元画像のパス -->
        <input type="hidden" name="gdsThumbImg" value="${goods.gdsThumbImg}"/> <!-- サムネイル画像のパス -->
    </div>
<script src="${contextPath}/resources/js/changeImgFunction.js"></script> <!-- 画像変更に関連するスクリプト -->
<div class="my-2 text-white d-flex justify-content-end"><%=request.getRealPath("/")%></div>
</div>

<!-- ボタンセット -->
<div class="d-flex justify-content-end my-5">
    <div class="btn-group">
<button type="submit" id="update_Btn" class="btn btn-outline-warning btn-lg">完了</button> <!-- 更新ボタン -->
<button type="button" id="back_Btn" class="btn btn-outline-warning btn-lg">キャンセル</button> <!-- キャンセルボタン -->
    </div>
</div>
<script src="${contextPath}/resources/js/backBtn.js"></script> <!-- ボタン操作に関連するスクリプト -->
<script type="text/javascript">
var jsonData = JSON.parse('${category}'); <!-- カテゴリデータをJSON形式で扱う -->
</script>

</form>
</div>
</div>
</div>
</div>
</div>

<jsp:include page="../../include/footer.jsp"/> <!-- フッター部分をインクルード -->