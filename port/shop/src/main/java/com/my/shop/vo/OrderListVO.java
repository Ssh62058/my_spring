package com.my.shop.vo;

import java.sql.Date;

// 注文リスト情報を格納するためのVOクラス
public class OrderListVO {

    // 注文情報に関するプロパティ
    private String orderId; // 注文ID
    private String userId; // ユーザーID
    private String orderRec; // 受取人名
    private String userAddr1; // 配送先住所1
    private String userAddr2; // 配送先住所2
    private String userAddr3; // 配送先住所3
    private String orderPhone; // 受取人の電話番号
    private int amount; // 注文総額
    private Date orderDate; // 注文日時

    // 注文詳細情報に関するプロパティ
    private int orderDetailsNum; // 注文詳細番号
    private int gdsNum; // 商品番号
    private int cartStock; // 注文時のカート内数量

    // 商品情報に関するプロパティ
    private String gdsName; // 商品名
    private String gdsThumbImg; // 商品サムネイル画像パス
    private int gdsPrice; // 商品価格

    // 配送情報に関するプロパティ
    private String delivery; // 配送ステータス

    // 以下はプロパティにアクセスするためのgetterおよびsetterメソッド

    public String getDelivery() { // 配送ステータスを取得
        return delivery;
    }
    public void setDelivery(String delivery) { // 配送ステータスを設定
        this.delivery = delivery;
    }
    public int getGdsPrice() { // 商品価格を取得
        return gdsPrice;
    }
    public void setGdsPrice(int gdsPrice) { // 商品価格を設定
        this.gdsPrice = gdsPrice;
    }
    public String getOrderId() { // 注文IDを取得
        return orderId;
    }
    public void setOrderId(String orderId) { // 注文IDを設定
        this.orderId = orderId; 
    }
    public String getUserId() { // ユーザーIDを取得
        return userId;
    }
    public void setUserId(String userId) { // ユーザーIDを設定
        this.userId = userId;
    }
    public String getOrderRec() { // 受取人名を取得
        return orderRec;
    }
    public void setOrderRec(String orderRec) { // 受取人名を設定
        this.orderRec = orderRec;
    }
    public String getUserAddr1() { // 配送先住所1を取得
        return userAddr1;
    }
    public void setUserAddr1(String userAddr1) { // 配送先住所1を設定
        this.userAddr1 = userAddr1;
    }
    public String getUserAddr2() { // 配送先住所2を取得
        return userAddr2;
    }
    public void setUserAddr2(String userAddr2) { // 配送先住所2を設定
        this.userAddr2 = userAddr2;
    }
    public String getUserAddr3() { // 配送先住所3を取得
        return userAddr3;
    }
    public void setUserAddr3(String userAddr3) { // 配送先住所3を設定
        this.userAddr3 = userAddr3;
    }
    public String getOrderPhone() { // 受取人の電話番号を取得
        return orderPhone;
    }
    public void setOrderPhone(String orderPhone) { // 受取人の電話番号を設定
        this.orderPhone = orderPhone;
    }
    public int getAmount() { // 注文総額を取得
        return amount;
    }
    public void setAmount(int amount) { // 注文総額を設定
        this.amount = amount;
    }
    public Date getOrderDate() { // 注文日時を取得
        return orderDate;
    }
    public void setOrderDate(Date orderDate) { // 注文日時を設定
        this.orderDate = orderDate;
    }
    public int getOrderDetailsNum() { // 注文詳細番号を取得
        return orderDetailsNum;
    }
    public void setOrderDetailsNum(int orderDetailsNum) { // 注文詳細番号を設定
        this.orderDetailsNum = orderDetailsNum;
    }
    public int getGdsNum() { // 商品番号を取得
        return gdsNum;
    }
    public void setGdsNum(int gdsNum) { // 商品番号を設定
        this.gdsNum = gdsNum;
    }
    public int getCartStock() { // 注文時のカート内数量を取得
        return cartStock;
    }
    public void setCartStock(int cartStock) { // 注文時のカート内数量を設定
        this.cartStock = cartStock;
    }
    public String getGdsName() { // 商品名を取得
        return gdsName;
    }
    public void setGdsName(String gdsName) { // 商品名を設定
        this.gdsName = gdsName;
    }
    public String getGdsThumbImg() { // 商品サムネイル画像パスを取得
        return gdsThumbImg;
    }
    public void setGdsThumbImg(String gdsThumbImg) { // 商品サムネイル画像パスを設定
        this.gdsThumbImg = gdsThumbImg;
    }
}