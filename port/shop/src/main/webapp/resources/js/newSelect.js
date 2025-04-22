$(document).ready(function () { // ドキュメントが準備完了したときに以下のコードを実行
  let cate1Select = $('select.category1'); // 1次カテゴリのセレクトボックス
  let cate2Select = $('select.category2'); // 2次カテゴリのセレクトボックス

  function filterCate2() { // 2次カテゴリをフィルタリングする関数
    let selectedCate1 = cate1Select.val(); // 選択された1次カテゴリの値を取得
    cate2Select.children().hide(); // すべてのオプションを非表示にする
    cate2Select.find('option[value=""]').show(); // "全体"オプションを表示

    // 選択された1次カテゴリに属する2次カテゴリのみを表示
    cate2Select.find(`option[data-ref='${selectedCate1}']`).show();
  }

  // ページロード時に2次カテゴリをフィルタリング
  filterCate2();

  // 1次カテゴリが変更された場合、2次カテゴリのフィルタリングを適用
  cate1Select.on('change', function () {
    filterCate2(); // 2次カテゴリを更新
    cate2Select.val(''); // 1次カテゴリ変更時に2次カテゴリ選択をリセット
  });
});