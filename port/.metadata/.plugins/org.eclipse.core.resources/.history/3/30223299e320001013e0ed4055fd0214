package com.my.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.my.shop.persistence.ShopDAO;
import com.my.shop.vo.CartListVO;
import com.my.shop.vo.CartVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.OrderDetailVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;
import com.my.shop.vo.ReplyVO;

@Service // 実際のサービスクラスとして機能するクラスに付与されるアノテーション
public class ShopServiceImpl implements ShopService {

    @Inject
    private ShopDAO dao;

    @Override
    // カテゴリコードとレベル値を基に商品リストを返す
    public List<GoodsViewVO> list(int cateCode, int level) throws Exception {
        int cateCodeRef = 0; // カテゴリ参照コードの初期化

        /* 1次カテゴリの場合、参照コードを設定 */
        if (level == 1) { // 1次カテゴリ
            cateCodeRef = cateCode;
            return dao.list(cateCode, cateCodeRef);
        } else { // 2次カテゴリ
            return dao.list(cateCode);
        }
    }

    @Override
    // 商品詳細情報の取得
    public GoodsViewVO goodsView(int gdsNum) throws Exception {
        return dao.goodsView(gdsNum);
    }

    @Override
    // コメント登録
    public void registReply(ReplyVO reply) throws Exception {
        dao.registReply(reply);
    }

    @Override
    // コメントリストの取得
    public List<ReplyListVO> replyList(int gdsNum) throws Exception {
        return dao.replyList(gdsNum);
    }

    @Override
    // コメント削除
    public void deleteReply(ReplyVO reply) throws Exception {
        dao.deleteReply(reply);
    }

    @Override
    // コメント作成者のユーザーIDを検証
    public String idCheck(int repNum) throws Exception {
        return dao.idCheck(repNum);
    }

    @Override
    // コメント修正
    public void modifyReply(ReplyVO reply) throws Exception {
        dao.modifyReply(reply);
    }

    @Override
    // カート項目追加
    public void addCart(CartVO cart) throws Exception {
        dao.addCart(cart);
    }

    @Override
    // カートリストの取得
    public List<CartListVO> cartList(String userId) throws Exception {
        return dao.cartList(userId);
    }

    // カート削除
    @Override
    public void deleteCart(CartVO cart) throws Exception {
        dao.deleteCart(cart);
    }

    @Override // 注文情報入力
    public void orderInfo(OrderVO order) throws Exception {
        dao.orderInfo(order);
    }

    @Override // 注文詳細情報入力
    public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
        dao.orderInfo_Details(orderDetail);
    }

    @Override // カートリスト全削除
    public void cartAllDelete(String userId) throws Exception {
        dao.cartAllDelete(userId);
    }

    @Override // 注文リスト
    public List<OrderVO> orderList(OrderVO order) throws Exception {
        return dao.orderList(order);
    }

    @Override // 注文情報確認
    public List<OrderListVO> orderView(OrderVO order) throws Exception {
        return dao.orderView(order);
    }
}