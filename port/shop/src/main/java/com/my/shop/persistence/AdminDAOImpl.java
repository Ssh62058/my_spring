package com.my.shop.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.my.shop.vo.CategoryVO;
import com.my.shop.vo.GoodsVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.MemberVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;

// DAOの実装クラス - データベース操作を実行する
@Repository
public class AdminDAOImpl implements AdminDAO {
    
    @Inject
    private SqlSession sql; // MyBatisのSQLセッションを利用してデータベース操作を行う
    
    // MyBatisマッパーの名前空間を指定
    private static String namespace = "com.my.shop.mappers.adminMapper";
    
    // カテゴリー情報を取得する
    @Override
    public List<CategoryVO> category() throws Exception {
        return sql.selectList(namespace + ".category");
    }

    // 商品情報をデータベースに登録する
    @Override
    public void register(GoodsVO vo) throws Exception {
        sql.insert(namespace + ".register", vo);
    }

    // 商品リストを取得する
    @Override
    public List<GoodsViewVO> goodslist() throws Exception {
        return sql.selectList(namespace + ".goodslist");
    }

    // 商品詳細を取得する
    @Override
    public GoodsViewVO goodsView(int gdsNum) throws Exception {
        return sql.selectOne(namespace + ".goodsView", gdsNum);
    }

    // 商品情報を更新（修正）する
    @Override
    public void goodsModify(GoodsVO vo) throws Exception {
        sql.update(namespace + ".goodsModify", vo);
    }

    // 商品を削除する
    @Override
    public void goodsDelete(int gdsNum) throws Exception {
        sql.delete(namespace + ".goodsDelete", gdsNum);
    }

    // 注文リストを取得する
    @Override
    public List<OrderVO> orderList() throws Exception {
        return sql.selectList(namespace + ".orderList");
    }

    // 注文詳細を取得する
    @Override
    public List<OrderListVO> orderView(OrderVO order) throws Exception {
        return sql.selectList(namespace + ".orderView", order);
    }

    // 配送ステータスを更新する
    @Override
    public void delivery(OrderVO order) throws Exception {
        sql.update(namespace + ".delivery", order);
    }

    // 商品の在庫数を更新する
    @Override
    public void changeStock(GoodsVO goods) throws Exception {
        sql.update(namespace + ".changeStock", goods);
    }

    // 全てのコメント（レビュー）を取得する
    @Override
    public List<ReplyListVO> allReply() throws Exception {
        return sql.selectList(namespace + ".allReply");
    }

    // コメント（レビュー）を削除する
    @Override
    public void deleteReply(int repNum) throws Exception {
        sql.delete(namespace + ".deleteReply", repNum);
    }

    // 会員リストを取得する
    @Override
    public List<MemberVO> memberList() throws Exception {
        return sql.selectList(namespace + ".memberList");
    }

}