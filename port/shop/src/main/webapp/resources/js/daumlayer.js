// 郵便番号検索画面を表示するための要素
var element_layer = document.getElementById('layer');

function closeDaumPostcode() {
    // iframeを含む要素を非表示にする
    element_layer.style.display = 'none';
}

function sample2_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) { 
            // 検索結果の項目をクリックした時に実行するコード

            // 各住所の表示ルールに基づいて住所を組み合わせる
            // 渡される変数が値を持たない場合は空白('')を参照し分岐処理する
            var addr = ''; // 住所変数
            var extraAddr = ''; // 補足項目変数

            // ユーザーが選択した住所タイプに応じて該当する住所値を取得
            if (data.userSelectedType === 'R') { // ユーザーが道路名住所を選択した場合
                addr = data.roadAddress;
            } else { // ユーザーが地番住所を選択した場合(J)
                addr = data.jibunAddress;
            }

            // ユーザーが選択した住所が道路名タイプの場合、補足項目を結合する
            if(data.userSelectedType === 'R'){
                // 法定洞名がある場合、追加する (法定里は除外)
                // 法定洞は最後の文字が"洞/路/街"で終わる
                if(data.bname !== '' && /[洞|路|街]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 建物名があり、共同住宅の場合は追加する
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 表示する補足項目がある場合、括弧を付けた最終文字列を作成する
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 結合された補足項目を該当フィールドに設定する
                document.getElementById("sample2_extraAddress").value = extraAddr;

            } else {
                document.getElementById("sample2_extraAddress").value = '';
            }

            // 郵便番号と住所情報を該当フィールドに設定する
            document.getElementById('sample2_postcode').value = data.zonecode;
            document.getElementById("sample2_address").value = addr;

            // カーソルを詳細住所フィールドに移動する
            document.getElementById("sample2_detailAddress").focus();

            // iframeを含む要素を非表示にする
            element_layer.style.display = 'none';
        },
        width: '100%',
        height: '100%',
        maxSuggestItems: 5 // 表示候補の最大項目数
    }).embed(element_layer);

    // iframeを含む要素を表示する
    element_layer.style.display = 'block';

    // iframeを含む要素の位置を画面の中央に移動する
    initLayerPosition();
}

// ブラウザサイズの変更に合わせてレイヤーを中央に移動したい場合
// resizeイベントやorientationchangeイベントを使用して値が変更される度にこの関数を実行するか
// element_layerのtopとleftの値を直接修正することが可能
function initLayerPosition(){
    var width = 300; // 郵便番号検索サービスの要素幅
    var height = 400; // 郵便番号検索サービスの要素高さ
    var borderWidth = 5; // サンプルで使用するボーダーの厚さ

    // 上記で宣言した値を実際の要素に設定する
    element_layer.style.width = width + 'px';
    element_layer.style.height = height + 'px';
    element_layer.style.border = borderWidth + 'px solid';

    // 実行時の画面幅と高さを取得し、中央に表示するよう位置を計算する
    element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth) + 'px';
    element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth) + 'px';
}