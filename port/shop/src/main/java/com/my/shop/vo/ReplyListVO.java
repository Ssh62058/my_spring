package com.my.shop.vo;

import java.util.Date;

// 商品に対するコメントリスト情報を格納するためのVOクラス
public class ReplyListVO {

    // コメントリストに関するプロパティ
    private int gdsNum; // 商品番号
    private int repNum; // コメント番号
    private String userId; // コメントを作成したユーザーID
    private String repCon; // コメント内容
    private String userName; // コメントを作成したユーザー名
    private Date repDate; // コメントが作成された日時

    // 以下はプロパティにアクセスするためのgetterおよびsetterメソッド

    public int getGdsNum() { // 商品番号を取得
        return gdsNum;
    }
    public void setGdsNum(int gdsNum) { // 商品番号を設定
        this.gdsNum = gdsNum;
    }
    public int getRepNum() { // コメント番号を取得
        return repNum;
    }
    public void setRepNum(int repNum) { // コメント番号を設定
        this.repNum = repNum;
    }
    public String getUserId() { // ユーザーIDを取得
        return userId;
    }
    public void setUserId(String userId) { // ユーザーIDを設定
        this.userId = userId;
    }
    public String getRepCon() { // コメント内容を取得
        return repCon;
    }
    public void setRepCon(String repCon) { // コメント内容を設定
        this.repCon = repCon;
    }
    public String getUserName() { // ユーザー名を取得
        return userName;
    }
    public void setUserName(String userName) { // ユーザー名を設定
        this.userName = userName;
    }
    public Date getRepDate() { // コメント作成日時を取得
        return repDate;
    }
    public void setRepDate(Date repDate) { // コメント作成日時を設定
        this.repDate = repDate;
    }
}