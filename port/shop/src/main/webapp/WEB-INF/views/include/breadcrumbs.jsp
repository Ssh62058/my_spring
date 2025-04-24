<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- JSPページの設定を定義 -->

<ul class="breadcrumb"> <!-- パンくずリストの定義 -->
  <li class="breadcrumb-item"><a href="/">Home</a></li> <!-- ホームページへのリンク -->
  <li class="breadcrumb-item"><a href="#" onclick="historyBack()">back</a></li> <!-- 戻るボタン。JavaScript関数を呼び出す -->
  <li class="breadcrumb-item active">商品ページ</li> <!-- 現在のページ（アクティブな状態） -->
</ul>

<script src="${contextPath}/resources/js/historyBack.js"></script> <!-- 戻る操作用のスクリプト -->