package com.my.shop.vo;

import java.util.Date;

// 商品情報を格納するためのVOクラス
public class GoodsViewVO {

    // 商品に関するプロパティ
    private int gdsNum; // 商品番号
    private int gdsPrice; // 商品価格
    private int gdsStock; // 商品在庫数
    private String gdsName; // 商品名
    private String cateCode; // カテゴリコード
    private String gdsDes; // 商品説明
    private String gdsImg; // 商品画像のパス
    private String cateCodeRef; // 親カテゴリコード
    private String cateName; // カテゴリ名
    private String gdsThumbImg; // 商品サムネイル画像のパス
    private Date gdsDate; // 商品の登録日

    // 以下はプロパティにアクセスするためのgetterおよびsetterメソッド

    public int getGdsNum() { // 商品番号を取得
        return gdsNum;
    }
    public void setGdsNum(int gdsNum) { // 商品番号を設定
        this.gdsNum = gdsNum;
    }
    public int getGdsPrice() { // 商品価格を取得
        return gdsPrice;
    }
    public void setGdsPrice(int gdsPrice) { // 商品価格を設定
        this.gdsPrice = gdsPrice;
    }
    public int getGdsStock() { // 商品在庫数を取得
        return gdsStock;
    }
    public void setGdsStock(int gdsStock) { // 商品在庫数を設定
        this.gdsStock = gdsStock;
    }
    public String getGdsName() { // 商品名を取得
        return gdsName;
    }
    public void setGdsName(String gdsName) { // 商品名を設定
        this.gdsName = gdsName;
    }
    public String getCateCode() { // カテゴリコードを取得
        return cateCode;
    }
    public void setCateCode(String cateCode) { // カテゴリコードを設定
        this.cateCode = cateCode;
    }
    public String getGdsDes() { // 商品説明を取得
        return gdsDes;
    }
    public void setGdsDes(String gdsDes) { // 商品説明を設定
        this.gdsDes = gdsDes;
    }
    public String getGdsImg() { // 商品画像パスを取得
        return gdsImg;
    }
    public void setGdsImg(String gdsImg) { // 商品画像パスを設定
        this.gdsImg = gdsImg;
    }
    public String getCateCodeRef() { // 親カテゴリコードを取得
        return cateCodeRef;
    }
    public void setCateCodeRef(String cateCodeRef) { // 親カテゴリコードを設定
        this.cateCodeRef = cateCodeRef;
    }
    public String getCateName() { // カテゴリ名を取得
        return cateName;
    }
    public void setCateName(String cateName) { // カテゴリ名を設定
        this.cateName = cateName;
    }
    public String getGdsThumbImg() { // 商品サムネイル画像パスを取得
        return gdsThumbImg;
    }
    public void setGdsThumbImg(String gdsThumbImg) { // 商品サムネイル画像パスを設定
        this.gdsThumbImg = gdsThumbImg;
    }
    public Date getGdsDate() { // 商品の登録日を取得
        return gdsDate;
    }
    public void setGdsDate(Date gdsDate) { // 商品の登録日を設定
        this.gdsDate = gdsDate;
    }
}