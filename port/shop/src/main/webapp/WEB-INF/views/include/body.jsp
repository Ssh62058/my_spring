<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- JSPページの設定を定義 -->

<video autoplay muted loop id="myVideo"> <!-- 自動再生、ミュート、ループする動画 -->
  <source src="${contextPath}/resources/motion/donut.mp4" type="video/mp4"> <!-- 動画ファイルのパス -->
  Your browser does not support HTML5 video. <!-- ブラウザが動画をサポートしていない場合の表示メッセージ -->
</video>

<div class="content p-5"> <!-- ページコンテンツ -->
  <h1 class="text-center text-warning">スイーツ</h1> <!-- コンテンツタイトル -->
  <h2 class="text-warning text-center text-white">耐えられない甘さ</h2> <!-- サブタイトル -->
  <div class="d-flex justify-content-center">
  <button id="myBtn" onclick="myFunction()" class="btn btn-outline-warning px-5">Pause</button> <!-- 動画の再生を停止するボタン -->
  </div>
</div>
<script src="${contextPath}/resources/js/video.js"></script> <!-- 動画制御用のスクリプト -->