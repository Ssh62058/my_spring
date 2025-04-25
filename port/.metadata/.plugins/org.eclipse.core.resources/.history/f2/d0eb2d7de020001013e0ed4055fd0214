package com.my.shop.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.my.shop.vo.MemberVO;

@Repository // データアクセス層のクラスに使用
// Persistence Layerに関連するクラスで主に使用される[データベースとのやり取りを担当するクラス]
public class MemberDAOImpl implements MemberDAO {

    @Inject
    private SqlSession sql; // SQLコマンドを取得

    // マッパー設定
    private static String namespace = "com.my.shop.mappers.memberMapper";

    // 会員登録
    @Override
    public void signup(MemberVO vo) throws Exception {
        sql.insert(namespace + ".signup", vo);
    }

    // ログイン
    @Override
    public MemberVO signin(MemberVO vo) throws Exception {
        return sql.selectOne(namespace + ".signin", vo);
    }
}