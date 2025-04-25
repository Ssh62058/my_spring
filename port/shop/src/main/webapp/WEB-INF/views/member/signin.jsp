<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- JSPページの設定 -->
<jsp:include page="../include/header.jsp" flush="false"/> <!-- ヘッダー部分をインクルード -->

<div class="container-fluid bg-gradient-primary min-vh-100"> <!-- 背景がグラデーションのコンテナ -->
<div class="row justify-content-center">
<div class="col-xl-10 col-lg-12 col-md-9">

    <div class="card o-hidden border-0 shadow-lg my-5 min-vh-100"> <!-- カードコンテナ -->
        <div class="card-body p-0">
            <div class="row min-vh-100">
                <div class="col-lg-6 d-none d-lg-block bg-login-image">
<!--背景画像を表示するセクション-->
                </div>
                <div class="col-lg-6 ">
<div class="p-5"> <!-- ログインフォームセクション -->
<div class="text-center">
    <h1 class="h4 text-grey-900 mb-4">
        Welcome Back!
    </h1> <!-- タイトル: ログインを促すメッセージ -->
<form method="post" class="was-validated"> <!-- フォーム開始 -->
    <div class="my-3">
        <input
type="text"
class="form-control form-control-user" 
placeholder="IDを入力してください。" 
name="userId"   
required="required"  
        /> <!-- ユーザーID入力フィールド -->
    </div>
    <div class="mb-3">
        <input
type="password"
class="form-control form-control-user" 
placeholder="パスワードを入力してください。" 
name="userPass" 
required="required"         
        /> <!-- パスワード入力フィールド -->
    </div>
    
<div class="my-3">
	<div class="custom-control custom-checkbox small">
<input
type="checkbox"
class="custom-control-input"
id="customCheck"
/>	
<label class="custom-control-label" for="customCheck">
Remeber Me
</label>
	</div> <!-- 「ログイン状態を保持する」のチェックボックス -->
</div>     
    <p class="mb-3">
        <input 
        type="submit"
        class="btn btn-primary btn-user btn-block"
        value="ログイン"
        id="signin_btn"
        name="signin_btn"
        /> <!-- ログインボタン -->
    </p>
    
    <hr/> <!-- 区切り線 -->
    <p class="mb-3">
    <a href="${contextPath}/member/google" class="btn btn-google btn-user btn-block">
<i class="fab fa-google fa-fw"></i>
&nbsp;Login with Google

    </a> <!-- Googleでログイン -->
    </p>

    <p class="mb-3">
    <a href="${contextPath}/member/face" class="btn btn-facebook btn-user btn-block">
<i class="fab fa-facebook fa-fw"></i>
&nbsp;Login with Facebook

    </a> <!-- Facebookでログイン -->
    </p>
    
<hr/> <!-- 区切り線 -->

<div class="mb-3">
<a class="small" href="${contextPath}/member/forgot">
forgot Password?
</a> <!-- パスワードを忘れた場合のリンク -->
</div>

<div class="mb-3">
<a class="small" href="${contextPath}/member/signup">
join
</a> <!-- 会員登録ページへのリンク -->
</div>

    </form> <!-- フォーム終了 -->
</div>

</div>
                </div>
            </div>
        </div>
    </div>

</div>
</div>
</div>

<jsp:include page="../include/footer.jsp" flush="false"/> <!-- フッター部分をインクルード -->