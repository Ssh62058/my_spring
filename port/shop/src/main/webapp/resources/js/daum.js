function go_daum_address() { // Daumの住所検索機能を使用する

    new daum.Postcode({ // ポップアップで検索結果の項目をクリックした際に実行するコード
        oncomplete: function(data) {
            var addr = ''; // 住所変数
            var extraAddr = ''; // 補足項目変数
            
            // ユーザーが選択した住所タイプに応じて該当する住所を取得
            if (data.userSelectedType === 'R') { // ユーザーが道路名住所を選択した場合
                addr = data.roadAddress;
            } else { // ユーザーが地番住所を選択した場合(J)
                addr = data.jibunAddress;    
            }

            // ユーザーが選択した住所が道路名タイプの場合、補足項目を結合
            if (data.userSelectedType === 'R') {
                // 法定洞名がある場合、追加（法定里は除外）
                // 法定洞は最後の文字が"洞/路/街"で終わる
                if (data.bname !== '' && /[洞|路|街]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }

                // 建物名があり、共同住宅の場合は追加
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }    

                // 表示する補足項目がある場合、括弧を付けた最終文字列を作成
                if (extraAddr !== '') {
                    extraAddr = '(' + extraAddr + ')';
                }
                addr += extraAddr;
            } else {
                addr += ' ';
            }    

            // 郵便番号と住所情報を該当フィールドに設定
            $(".address_input_1").val(data.zonecode); // 郵便番号
            $(".address_input_2").val(addr); // 住所
            
            // 住所が選択された後、残りの内容を入力するためにinput_3の読み取り専用属性を解除
            $(".address_input_3").attr("readonly", false);    
            $(".address_input_3").focus(); // フォーカスを設定                
        }
    }).open();
}