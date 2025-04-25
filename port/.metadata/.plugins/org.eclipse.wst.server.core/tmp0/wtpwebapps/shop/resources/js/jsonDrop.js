// コントローラーからデータを取得
// var jsonData = JSON.parse('${category}');
// サーバーから渡されたデータをJSON形式で解析し、jsonData変数に保存します
var cate1Arr = new Array(); // 配列の初期化
var cate1Obj = new Object(); // オブジェクトの初期化

// 1次分類のセレクトボックスに挿入するデータを準備
for(var i = 0; i < jsonData.length; i++){
    // jsonData配列を巡回し、levelが"1"の項目を探して
    // cate1ObjにcateCodeとcateNameを保存し、これをcate1Arr配列に追加します
    if(jsonData[i].level == "1"){
        cate1Obj = new Object(); // 初期化
        cate1Obj.cateCode = jsonData[i].cateCode;
        cate1Obj.cateName = jsonData[i].cateName;
        cate1Arr.push(cate1Obj);
    }
}
// 1次分類のセレクトボックスにデータを挿入
var cate1Select = $("select.category1"); // 選択されたカテゴリ例: 100

for (var i=0; i < cate1Arr.length; i++){ // 例: 100,200,300,400
    cate1Select.append("<option value='"+ cate1Arr[i].cateCode +"'>" + cate1Arr[i].cateName + "</option>");
}
// 空のoptionタグに値を挿入
/*
<option value="100">New</option>
ただし、コンピューターがどのカテゴリを選択するかはchat GPTでもわからない。
この後、親カテゴリを選択するイベントが発生
 */
$(document).on("change", "select.category1", function(){
    // select.category1が変更された場合に実行される関数
    var cate2Arr = new Array(); // 配列の初期化
    var cate2Obj = new Object(); // オブジェクトの初期化

    // 2次分類のセレクトボックスに挿入するデータを準備
    for(var i =0; i < jsonData.length; i++){
        if(jsonData[i].level == "2"){
            cate2Obj = new Object(); // 初期化
            cate2Obj.cateCode = jsonData[i].cateCode;
            cate2Obj.cateName = jsonData[i].cateName;
            cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
            cate2Arr.push(cate2Obj);
        }    
    }
    var cate2Select = $("select.category2"); // セレクトボックスを指定
    cate2Select.children().remove(); // 子要素を削除

    $("option:selected", this).each(function(){
        var selectVal = $(this).val(); // 選択された値を取得
        cate2Select.append("<option value='" + selectVal+ "'>全体</option>"); // 全体オプション追加
        
        for(var i=0; i < cate2Arr.length; i++){
            if(selectVal == cate2Arr[i].cateCodeRef){
                cate2Select.append("<option value='"+ cate2Arr[i].cateCode +"'>" + cate2Arr[i].cateCode + "</option>");
            }
        }
    });
});