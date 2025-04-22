var cate1Arr = new Array();
var cate1Obj = new Object();

for(var i = 0; i < jsonData.length; i++) { 
    if(jsonData[i].level == "1") {
        cate1Obj = new Object();  // 初期化
        cate1Obj.cateCode = jsonData[i].cateCode;  // jsonDataからcateCodeを取得してcate1Objに保存
        cate1Obj.cateName = jsonData[i].cateName;  // jsonDataからcateNameを取得してcate1Objに保存
        cate1Arr.push(cate1Obj);  // cate1Arr配列にcate1Objを追加
    }
}

var cate1Select = $("select.category1");

for(var i = 0; i < cate1Arr.length; i++) {
    cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>" 
                        + cate1Arr[i].cateName + "</option>");
}

// ここまでで、JSONから1次カテゴリデータを取得し、セレクトボックスに追加するコードです。

$(document).on("change", "select.category1", function(){

    var cate2Arr = new Array();
    var cate2Obj = new Object();

    for(var i = 0; i < jsonData.length; i++) {
        if(jsonData[i].level == "2") {
            cate2Obj = new Object(); // 初期化
            cate2Obj.cateCode = jsonData[i].cateCode; // jsonDataからcateCodeを取得してcate2Objに保存
            cate2Obj.cateName = jsonData[i].cateName; // jsonDataからcateNameを取得してcate2Objに保存
            cate2Obj.cateCodeRef = jsonData[i].cateCodeRef; // jsonDataからcateCodeRefを取得してcate2Objに保存
            cate2Arr.push(cate2Obj); // cate2Arr配列にcate2Objを追加
        } 
    }

    var cate2Select = $("select.category2");

    cate2Select.children().remove(); // 2次カテゴリセレクトボックスの既存オプションを削除

    $("option:selected", this).each(function(){
        var selectVal = $(this).val();  // 選択された1次カテゴリの値を取得
        cate2Select.append("<option value='" + selectVal + "'>全体</option>"); // "全体"オプションを追加

        for(var i = 0; i < cate2Arr.length; i++) {
            if(selectVal == cate2Arr[i].cateCodeRef) { 
                cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
                                    + cate2Arr[i].cateName + "</option>");
            }
        }        
    });
});

// このコードは、1次カテゴリ変更イベントを検知し、その値と関連する2次カテゴリデータをセレクトボックスに追加する役割をします。

var select_cateCode = '${goods.cateCode}';
var select_cateCodeRef = '${goods.cateCodeRef}';
var select_cateName = '${goods.cateName}';

console.log("select_cateCode = " + select_cateCode);
console.log("select_cateCodeRef = " + select_cateCodeRef);

// 元のデータをセレクトボックスに反映するコード
if(select_cateCodeRef != null && select_cateCodeRef != "") { 
    $(".category1").val(select_cateCodeRef); // 1次カテゴリの値を設定
    $(".category2").val(select_cateCode); // 2次カテゴリの値を設定
    $(".category2").children().remove(); // 既存オプションを削除
    $(".category2").append("<option value='" 
                            + select_cateCode + "'>" + select_cateName + "</option>");
} else {
    $(".category1").val(select_cateCode); // 1次カテゴリの値を設定
    $(".category2").append("<option value='" 
            + select_cateCode + "' selected='selected'>全体</option>");
}