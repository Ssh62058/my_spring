package com.my.shop.service;

import javax.servlet.http.HttpSession;

import com.my.shop.vo.MemberVO;

public interface MemberService {
    
    // 会員登録
    public void signup(MemberVO vo) throws Exception;
    
    // ログイン
    public MemberVO signin(MemberVO vo) throws Exception;
    
    // ログアウト
    public void signout(HttpSession session) throws Exception;

}