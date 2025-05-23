package com.my.shop.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.my.shop.vo.MemberVO;

@Repository // データアクセス層のクラスに使用するアノテーション
// データベースとのやり取りを担当するクラス
public class MemberDAOImpl implements MemberDAO {

    @Inject
    private SqlSession sql; // MyBatisのSQLセッションを利用してデータベース操作を行う

    // マッパーの名前空間設定
    private static String namespace = "com.my.shop.mappers.memberMapper";

    // 会員登録処理
    @Override
    public void signup(MemberVO vo) throws Exception {
        sql.insert(namespace + ".signup", vo); // ユーザー情報をDBに登録
    }

    // ログイン処理
    @Override
    public MemberVO signin(MemberVO vo) throws Exception {
        return sql.selectOne(namespace + ".signin", vo); // 入力情報に一致するユーザー情報を取得
    }
}