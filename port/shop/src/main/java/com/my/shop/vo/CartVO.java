package com.my.shop.vo;

import java.util.Date;

// カート情報を格納するためのVOクラス
public class CartVO {

    // カートに関するプロパティ
    private int cartNum; // カート番号
    private int gdsNum; // 商品番号
    private int cartStock; // カートに追加された商品の数量
    private String userId; // ユーザーID
    private Date addDate; // カートに追加された日付

    // 以下はプロパティにアクセスするためのgetterおよびsetterメソッド

    public int getCartNum() { // カート番号を取得
        return cartNum;
    }
    public void setCartNum(int cartNum) { // カート番号を設定
        this.cartNum = cartNum;
    }
    public int getGdsNum() { // 商品番号を取得
        return gdsNum;
    }
    public void setGdsNum(int gdsNum) { // 商品番号を設定
        this.gdsNum = gdsNum;
    }
    public int getCartStock() { // カート内の商品の数量を取得
        return cartStock;
    }
    public void setCartStock(int cartStock) { // カート内の商品の数量を設定
        this.cartStock = cartStock;
    }
    public String getUserId() { // ユーザーIDを取得
        return userId;
    }
    public void setUserId(String userId) { // ユーザーIDを設定
        this.userId = userId;
    }
    public Date getAddDate() { // カートに追加された日付を取得
        return addDate;
    }
    public void setAddDate(Date addDate) { // カートに追加された日付を設定
        this.addDate = addDate;
    }
}