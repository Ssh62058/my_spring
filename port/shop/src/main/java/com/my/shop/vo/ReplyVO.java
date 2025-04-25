package com.my.shop.vo;

import java.util.Date;

// 商品に対するコメント情報を格納するためのVOクラス
public class ReplyVO {

    // コメント情報に関するプロパティ
    private int gdsNum; // 商品番号
    private int repNum; // コメント番号
    private String userId; // コメントを作成したユーザーID
    private String repCon; // コメント内容
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
    public String getUserId() { // コメントを作成したユーザーIDを取得
        return userId;
    }
    public void setUserId(String userId) { // コメントを作成したユーザーIDを設定
        this.userId = userId;
    }
    public String getRepCon() { // コメント内容を取得
        return repCon;
    }
    public void setRepCon(String repCon) { // コメント内容を設定
        this.repCon = repCon;
    }
    public Date getRepDate() { // コメント作成日時を取得
        return repDate;
    }
    public void setRepDate(Date repDate) { // コメント作成日時を設定
        this.repDate = repDate;
    }
}