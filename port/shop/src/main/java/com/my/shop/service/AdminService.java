package com.my.shop.service;

import java.util.List;

import com.my.shop.vo.CategoryVO;
import com.my.shop.vo.GoodsVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.MemberVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;

// DAOを呼び出すサービスを生成します
public interface AdminService {

    // カテゴリー
    public List<CategoryVO> category() throws Exception;

    // 商品登録
    public void register(GoodsVO vo) throws Exception;

    // 商品リスト
    public List<GoodsViewVO> goodslist() throws Exception;

    // 商品の詳細
    public GoodsViewVO goodsView(int gdsNum) throws Exception;

    // 商品修正
    public void goodsModify(GoodsVO vo) throws Exception;

    // 商品削除
    public void goodsDelete(int gdsNum) throws Exception;

    // 注文リスト
    public List<OrderVO> orderList() throws Exception;

    // 特定の注文リスト
    public List<OrderListVO> orderView(OrderVO order) throws Exception;

    // 配送状態
    public void delivery(OrderVO order) throws Exception;

    // 商品数量調整
    public void changeStock(GoodsVO goods) throws Exception;

    // コメントリスト
    public List<ReplyListVO> allReply() throws Exception;

    // コメント削除
    public void deleteReply(int repNum) throws Exception;

    // ユーザーリスト
    public List<MemberVO> memberList() throws Exception;
}