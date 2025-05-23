package com.my.shop.vo;

// 商品カテゴリ情報を格納するためのVOクラス
public class CategoryVO {

    // 商品カテゴリに関するプロパティ
    private String cateName; // カテゴリ名
    private String cateCode; // カテゴリコード
    private String cateCodeRef; // 親カテゴリコード（参照用）
    private int level; // カテゴリ階層のレベル（1次カテゴリ、2次カテゴリなど）

    // 以下はプロパティにアクセスするためのgetterメソッド

    public String getCateName() { // カテゴリ名を取得
        return cateName;
    }
    public String getCateCode() { // カテゴリコードを取得
        return cateCode;
    }
    public String getCateCodeRef() { // 親カテゴリコードを取得
        return cateCodeRef;
    }
    public int getLevel() { // カテゴリ階層のレベルを取得
        return level;
    }

    // 以下はプロパティを設定するためのsetterメソッド

    public void setCateName(String cateName) { // カテゴリ名を設定
        this.cateName = cateName;
    }
    public void setCateCode(String cateCode) { // カテゴリコードを設定
        this.cateCode = cateCode;
    }
    public void setCateCodeRef(String cateCodeRef) { // 親カテゴリコードを設定
        this.cateCodeRef = cateCodeRef;
    }
    public void setLevel(int level) { // カテゴリ階層のレベルを設定
        this.level = level;
    }

}