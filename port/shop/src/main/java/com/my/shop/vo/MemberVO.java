package com.my.shop.vo;

import java.util.Date;

// 会員情報を格納するためのVOクラス
public class MemberVO {

    // 会員に関するプロパティ
    private String userId; // ユーザーID
    private String userPass; // ユーザーパスワード
    private String userPassRe; // 再入力されたパスワード（確認用）
    private String userName; // ユーザー名
    private String userPhone; // ユーザーの電話番号
    private String userEmail; // ユーザーのメールアドレス
    private String userGender; // ユーザーの性別
    private String userAddr1; // ユーザーの住所1
    private String userAddr2; // ユーザーの住所2
    private String userAddr3; // ユーザーの住所3
    private Date regiDate; // 登録日時
    private int verify; // ユーザーの認証状態（例: 管理者か一般ユーザーかのフラグ）

    // 以下はプロパティにアクセスするためのgetterおよびsetterメソッド

    public String getUserId() { // ユーザーIDを取得
        return userId;
    }
    public void setUserId(String userId) { // ユーザーIDを設定
        this.userId = userId;
    }
    public String getUserPass() { // パスワードを取得
        return userPass;
    }
    public void setUserPass(String userPass) { // パスワードを設定
        this.userPass = userPass;
    }
    public String getUserPassRe() { // 再入力されたパスワードを取得
        return userPassRe;
    }
    public void setUserPassRe(String userPassRe) { // 再入力されたパスワードを設定
        this.userPassRe = userPassRe;
    }
    public String getUserName() { // ユーザー名を取得
        return userName;
    }
    public void setUserName(String userName) { // ユーザー名を設定
        this.userName = userName;
    }
    public String getUserPhone() { // 電話番号を取得
        return userPhone;
    }
    public void setUserPhone(String userPhone) { // 電話番号を設定
        this.userPhone = userPhone;
    }
    public String getUserEmail() { // メールアドレスを取得
        return userEmail;
    }
    public void setUserEmail(String userEmail) { // メールアドレスを設定
        this.userEmail = userEmail;
    }
    public String getUserGender() { // 性別を取得
        return userGender;
    }
    public void setUserGender(String userGender) { // 性別を設定
        this.userGender = userGender;
    }
    public String getUserAddr1() { // 住所1を取得
        return userAddr1;
    }
    public void setUserAddr1(String userAddr1) { // 住所1を設定
        this.userAddr1 = userAddr1;
    }
    public String getUserAddr2() { // 住所2を取得
        return userAddr2;
    }
    public void setUserAddr2(String userAddr2) { // 住所2を設定
        this.userAddr2 = userAddr2;
    }
    public String getUserAddr3() { // 住所3を取得
        return userAddr3;
    }
    public void setUserAddr3(String userAddr3) { // 住所3を設定
        this.userAddr3 = userAddr3;
    }
    public Date getRegiDate() { // 登録日時を取得
        return regiDate;
    }
    public void setRegiDate(Date regiDate) { // 登録日時を設定
        this.regiDate = regiDate;
    }
    public int getVerify() { // 認証状態を取得
        return verify;
    }
    public void setVerify(int verify) { // 認証状態を設定
        this.verify = verify;
    }
}