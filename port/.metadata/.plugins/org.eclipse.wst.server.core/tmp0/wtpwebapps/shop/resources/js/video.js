var video = document.getElementById("myVideo"); // "myVideo"というIDを持つビデオ要素を取得
var btn = document.getElementById("myBtn"); // "myBtn"というIDを持つボタン要素を取得

function myFunction() { // ビデオの再生・一時停止を制御する関数
  if (video.paused) { // ビデオが一時停止している場合
    video.play(); // ビデオを再生
    btn.innerHTML = "Pause"; // ボタンのテキストを「Pause」に変更
  } else { // ビデオが再生中の場合
    video.pause(); // ビデオを一時停止
    btn.innerHTML = "Play"; // ボタンのテキストを「Play」に変更
  }
}