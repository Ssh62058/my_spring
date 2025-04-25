<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- JSPページの基本設定 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTLコアタグライブラリの読み込み -->
<jsp:include page="include/header.jsp" flush="false"/> <!-- ヘッダー部分をインクルード -->
<!-- 
  JSPでは主に出力バッファを強制的にクリアするために使用されます。
  これにより、ページでリアルタイムにデータを表示したり、
  複数段階の出力を効果的に管理することができます。
-->
<jsp:include page="include/body.jsp" flush="false"/> <!-- ボディ部分をインクルード -->

<jsp:include page="include/footer.jsp" flush="false"/> <!-- フッター部分をインクルード -->