package com.my.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.my.shop.vo.MemberVO;

// 特定条件に一致しない場合、リクエストを横取り
// Springフレームワークで使用されるインターセプタークラスを利用します
// 管理者権限があるユーザーかどうかを判定
public class AdminInterceptor extends HandlerInterceptorAdapter{

    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception{
        // req:リクエスト, res:レスポンス, obj:ハンドラー
        // preHandleメソッドはリクエストが処理される前に実行されます
        // ここでリクエストを横取りし必要な条件をチェックします
        HttpSession session = req.getSession(); // セッションを取得
        MemberVO member = (MemberVO)session.getAttribute("member"); 
        // セッションから"member"属性に保存されたMemberVOオブジェクト(ユーザー情報を保持するオブジェクト)を取得します

        if(member == null) {
            res.sendRedirect("/member/signin"); // サインインページにリダイレクト
            return false; /* JavaScriptでは基本的なイベント伝播を防止
               1) 条件による失敗または否定的な結果 = メソッドが条件を満たさない場合、または失敗した場合
               2) booleanを返すメソッドで特定条件が満たされない場合、falseを返す
               3) 繰り返し処理の終了信号 = 処理がもう必要ないという信号
               4) 有効性チェック = 入力値が有効でない場合、または不正な場合 = チェック失敗を示す
               条件不満足、失敗、または誤った状態を示す
            */
        }

        if(member.getVerify() != 9) {
            res.sendRedirect("/"); // ホームページにリダイレクト
            return false;
        }
        return true;
    }
}