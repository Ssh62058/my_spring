package com.my.shop.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.shop.service.MemberService;
import com.my.shop.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject
	MemberService service; // 実際のビジネスロジックを処理するサービスを呼び出す
	
	// セキュリティのため、管理者にも分からないようにパスワードエンコーダーを使用
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@Bean
	BCryptPasswordEncoder passEncoder() {
		return new BCryptPasswordEncoder();
	}

	// 開発者視点でページにアクセスした際、ターミナルにメッセージが表示される
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@GetMapping("/signup") // member/signup
	public void getSignup() throws Exception{
		logger.info("サインアップ画面へ");
	}
	
	@PostMapping("/signup")
	public String postSignup(MemberVO vo) throws Exception {
		logger.info("会員登録機能");
		
		// パスワードを暗号化
		String inputPass = vo.getUserPass();
		String pass = passEncoder.encode(inputPass);
		vo.setUserPass(pass);
		
		String inputPass2 = vo.getUserPassRe();
		String pass2 = passEncoder.encode(inputPass2);
		vo.setUserPassRe(pass2);
		
		service.signup(vo);
		return "redirect:/";
	}
	
	@GetMapping("/signin") // member/signin
	public void getSignin() throws Exception {
		logger.info("ログイン画面へ");
	}
	
	// ログイン処理 (POST)
	@PostMapping("/signin")
	public String postSignin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("ポスト サインイン");
		System.out.println("vo : " + vo);
		
		MemberVO login = service.signin(vo); // ログイン処理のためのサービス呼び出し
		// signin(vo) はユーザー入力に一致する会員情報をDBから取得する役割をする
		HttpSession session = req.getSession();
		// HttpSessionオブジェクトで現在のHTTPセッション（ユーザーごとの状態情報）を取得
		// ログインされたユーザー情報をセッションに保存するために使用

		boolean passMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());
		// DBのパスワードと入力されたパスワードを比較
		System.out.println("login : " + login);
		
		if (login != null && passMatch) { // ユーザーIDが存在し、パスワードも一致する場合
			// メンバーセッションにログイン情報をセット
			session.setAttribute("member", login);	
		} else { // ユーザーIDが存在せず、パスワードが間違っている場合
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false); // rttr はリダイレクト時に1回限りのデータを渡すために使用
			// "msg"属性にfalseを渡す
			return "redirect:/member/signin"; // ログイン画面へリダイレクト
		}
		return "redirect:/"; // ログイン成功時トップへリダイレクト
		
		/*
			postSigninメソッドが呼ばれると、ログイン情報(MemberVO vo)、HTTPリクエスト(HttpServletRequest req)、リダイレクト属性(RedirectAttributes rttr)
			をパラメータとして受け取ります。throws Exception は例外を外部に投げる意味です。
		*/
	}
	
	// ユーザーがIDやパスワードを入力する際、どちらかでも間違っていればログインを防止、両方正しい場合のみログイン
	
	// ログアウト処理
	@GetMapping("/signout")
	public String signout(HttpSession session) throws Exception {
		logger.info("ログアウト");
		service.signout(session);
		return "redirect:/";
	}
}