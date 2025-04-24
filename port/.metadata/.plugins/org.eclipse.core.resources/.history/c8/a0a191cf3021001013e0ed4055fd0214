package com.my.shop.persistence;

import java.util.List;

import com.my.shop.vo.CartListVO;
import com.my.shop.vo.CartVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.OrderDetailVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;
import com.my.shop.vo.ReplyVO;

public interface ShopDAO {

    // 商品リスト
    public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception;

    public List<GoodsViewVO> list(int cateCode) throws Exception;

    // 商品のビュー画面
    public GoodsViewVO goodsView(int gdsNum) throws Exception;

    // コメント登録
    public void registReply(ReplyVO reply) throws Exception;

    // コメントリスト
    public List<ReplyListVO> replyList(int gdsNum) throws Exception;

    // コメント削除
    public void deleteReply(ReplyVO reply) throws Exception;

    // ユーザーID確認
    public String idCheck(int repNum) throws Exception;

    // コメント修正
    public void modifyReply(ReplyVO reply) throws Exception;

    // カート追加
    public void addCart(CartVO cart) throws Exception;

    // カートリスト
    public List<CartListVO> cartList(String userId) throws Exception;

    // カート削除
    public void deleteCart(CartVO cart) throws Exception;

    // 注文リスト
    public void orderInfo(OrderVO order) throws Exception;

    // 注文詳細情報取得
    public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;

    // カート全削除
    public void cartAllDelete(String userId) throws Exception;

    // 特定の注文リスト
    public List<OrderVO> orderList(OrderVO order) throws Exception;

    // 特定の注文ビュー
    public List<OrderListVO> orderView(OrderVO order) throws Exception;
}