package com.my.shop.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.my.shop.persistence.MemberDAO;
import com.my.shop.vo.MemberVO;

@Service // ビジネスロジックを処理するクラスに使用するビジネス層
public class MemberServiceImpl implements MemberService {

    @Inject
    private MemberDAO dao;

    @Override
    public void signup(MemberVO vo) throws Exception {
        dao.signup(vo);
    }

    // ログイン
    @Override
    public MemberVO signin(MemberVO vo) throws Exception {
        return dao.signin(vo);
    }

    // ログアウト
    @Override
    public void signout(HttpSession session) throws Exception {
        session.invalidate(); // セッション情報を削除する
    }
}