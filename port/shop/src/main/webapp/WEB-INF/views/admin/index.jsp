<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- JSPページの設定を定義 -->
<jsp:include page="../include/header.jsp"/> <!-- ヘッダー部分をインクルード -->

<div class="container-fluid bg-gradient-primary"> <!-- 背景がグラデーションのコンテナ -->
<div class="row">
<div class="col-md-12">
<div class="d-flex"> <!-- フレックスボックスで要素を配置 -->
<div class="w-10"> <!-- サイドメニュー部分 -->
<div class="mt-5 pt-5"></div>
<jsp:include page="include/lnb.jsp"/> <!-- サイドナビゲーションメニューをインクルード -->
</div>
<div class="mt-5 pt-5"> <!-- ログセクション -->
<jsp:include page="include/log.jsp"/> <!-- ログ情報をインクルード -->
</div>
</div>
</div>
</div>
</div>

<jsp:include page="../include/footer.jsp"/> <!-- フッター部分をインクルード -->