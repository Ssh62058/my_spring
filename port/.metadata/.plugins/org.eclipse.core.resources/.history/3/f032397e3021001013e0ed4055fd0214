package com.my.shop.service;

import java.util.List;

import com.my.shop.vo.CartListVO;
import com.my.shop.vo.CartVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.OrderDetailVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;
import com.my.shop.vo.ReplyVO;

public interface ShopService {

    // カテゴリー別商品リストの取得
    public List<GoodsViewVO> list(int cateCode, int level) throws Exception;

    // 商品詳細の取得
    public GoodsViewVO goodsView(int gdsNum) throws Exception;

    // コメント登録
    public void registReply(ReplyVO reply) throws Exception;

    // コメントリストの取得
    public List<ReplyListVO> replyList(int gdsNum) throws Exception;

    // コメント削除
    public void deleteReply(ReplyVO reply) throws Exception;

    // ユーザーID確認
    public String idCheck(int repNum) throws Exception;

    // コメント修正
    public void modifyReply(ReplyVO reply) throws Exception;

    // カート項目追加
    public void addCart(CartVO cart) throws Exception;

    // カートリストの取得
    public List<CartListVO> cartList(String userId) throws Exception;

    // カート削除
    public void deleteCart(CartVO cart) throws Exception;

    // 注文情報
    public void orderInfo(OrderVO order) throws Exception;

    // 注文詳細情報
    public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;

    // カート全削除
    public void cartAllDelete(String userId) throws Exception;

    // 注文リスト
    public List<OrderVO> orderList(OrderVO order) throws Exception;

    // 注文ビュー
    public List<OrderListVO> orderView(OrderVO order) throws Exception;

}