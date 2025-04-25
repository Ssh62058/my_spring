package com.my.shop.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.my.shop.vo.CartListVO;
import com.my.shop.vo.CartVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.OrderDetailVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;
import com.my.shop.vo.ReplyVO;

@Repository
public class ShopDAOImpl implements ShopDAO {

    @Inject
    private SqlSession sql; // SQLセッションを注入。SQLクエリを実行するために使用。

    // ネームスペースの定義: データマッパーとの接続のためのパスを設定。
    private static String namespace = "com.my.shop.mappers.shopMapper";

    @Override
    // 特定のカテゴリコードと参照コードを使用して商品リストを取得。
    public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception {
        HashMap<String, Object> map = new HashMap<>();
        // カテゴリ情報をマップに追加。
        map.put("cateCode", cateCode);
        map.put("cateCodeRef", cateCodeRef);
        
        return sql.selectList(namespace + ".list_1", map);
    }

    @Override
    // 単一カテゴリコードを使用して商品リストを取得。
    public List<GoodsViewVO> list(int cateCode) throws Exception {
        return sql.selectList(namespace + ".list_2", cateCode);
    }

    @Override
    // 特定の商品番号を使用して商品ビューのデータを取得。
    public GoodsViewVO goodsView(int gdsNum) throws Exception {
        return sql.selectOne("com.my.shop.mappers.adminMapper" + ".goodsView", gdsNum);
    }

    // コメント登録処理。
    @Override
    public void registReply(ReplyVO reply) throws Exception {
        sql.insert(namespace + ".registReply", reply);
    }

    @Override
    // 特定の商品番号に対するコメントリストを返す。
    public List<ReplyListVO> replyList(int gdsNum) throws Exception {
        return sql.selectList(namespace + ".replyList", gdsNum);
    }

    // コメント削除処理。
    @Override
    public void deleteReply(ReplyVO reply) throws Exception {
        sql.delete(namespace + ".deleteReply", reply);
    }

    @Override
    // コメント作成者のユーザーID確認。
    public String idCheck(int repNum) throws Exception {
        return sql.selectOne(namespace + ".replyUserIdCheck", repNum);
    }

    // コメント修正処理。
    @Override
    public void modifyReply(ReplyVO reply) throws Exception {
        sql.update(namespace + ".modifyReply", reply);
    }
    // SQLと連携するデータアクセス層(Dao)、DaoImplは設定の役割。

    @Override
    // カート項目を追加。
    public void addCart(CartVO cart) throws Exception {
        sql.insert(namespace + ".addCart", cart);
    }

    @Override
    // 特定のユーザーIDに関するカートリストを返す。
    public List<CartListVO> cartList(String userId) throws Exception {
        return sql.selectList(namespace + ".cartList", userId);
    }

    @Override
    // カート削除。
    public void deleteCart(CartVO cart) throws Exception {
        sql.delete(namespace + ".deleteCart", cart);
    }

    /*
    注文リストSQLコマンドを含むレイヤー。
    1) カートから注文リストを生成する必要がある(セッションと商品と注文者のためにjoinを使用)。
    2) 変更可能な注文(注文を部分的に削除、全部注文、または注文しない場合)。
    */
    @Override // 注文情報
    public void orderInfo(OrderVO order) throws Exception {
        sql.insert(namespace + ".orderInfo", order);
    }

    @Override // 注文詳細情報
    public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
        sql.insert(namespace + ".orderInfo_Details", orderDetail);        
    }

    @Override // カート全削除
    public void cartAllDelete(String userId) throws Exception {
        sql.delete(namespace + ".cartAllDelete", userId);        
    }

    @Override // リスト
    public List<OrderVO> orderList(OrderVO order) throws Exception {
        return sql.selectList(namespace + ".orderList", order);
    }

    @Override // ビュー
    public List<OrderListVO> orderView(OrderVO order) throws Exception {
        return sql.selectList(namespace + ".orderView", order);
    }

}