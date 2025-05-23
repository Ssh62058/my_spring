package com.my.shop.vo;

// 注文詳細情報を格納するためのVOクラス
public class OrderDetailVO {

    // 注文詳細に関するプロパティ
    private int orderDetailsNum; // 注文詳細番号
    private String orderId; // 注文ID
    private int gdsNum; // 商品番号
    private int cartStock; // 注文時のカート内の数量

    // 以下はプロパティにアクセスするためのgetterおよびsetterメソッド

    public int getOrderDetailsNum() { // 注文詳細番号を取得
        return orderDetailsNum;
    }
    public void setOrderDetailsNum(int orderDetailsNum) { // 注文詳細番号を設定
        this.orderDetailsNum = orderDetailsNum;
    }
    public String getOrderId() { // 注文IDを取得
        return orderId;
    }
    public void setOrderId(String orderId) { // 注文IDを設定
        this.orderId = orderId;
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
}