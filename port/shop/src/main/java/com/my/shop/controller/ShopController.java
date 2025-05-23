package com.my.shop.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.shop.service.ShopService;
import com.my.shop.vo.CartListVO;
import com.my.shop.vo.CartVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.MemberVO;
import com.my.shop.vo.OrderDetailVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;
import com.my.shop.vo.ReplyVO;

@Controller
@RequestMapping("/shop/*") // ショップ関連のURLを管理
public class ShopController {
    
    private static final Logger logger = LoggerFactory.getLogger(ShopController.class);

    @Inject
    ShopService service; // ビジネスロジックを処理するサービス

    // カテゴリー別の商品リストを取得して表示
    @GetMapping("/list")
    public void getList(@RequestParam("c") int cateCode, @RequestParam("l") int level, Model model) throws Exception {
        logger.info("カテゴリー別ページに入る");
        List<GoodsViewVO> list = service.list(cateCode, level); // カテゴリー情報を取得
        model.addAttribute("list", list); // ビューにリストを渡す
    }
    
    // 商品詳細を取得して表示
    @GetMapping("/view")
    public void getView(@RequestParam("n") int gdsNum, Model model) throws Exception {
        logger.info("商品ビューを取得する");
        GoodsViewVO view = service.goodsView(gdsNum); // 商品詳細情報を取得
        model.addAttribute("view", view); // ビューに詳細情報を渡す
    }
    
    // コメント登録
    @ResponseBody
    @PostMapping(value="/view/registReply")
    public void registReply(ReplyVO reply, HttpSession session) throws Exception {
        logger.info("コメントを登録する");
        MemberVO member = (MemberVO) session.getAttribute("member"); // ユーザー情報をセッションから取得
        reply.setUserId(member.getUserId()); // ユーザーIDを設定
        service.registReply(reply); // コメント登録
    }

    // コメントリストを取得
    @ResponseBody
    @GetMapping(value="/view/replyList")
    public List<ReplyListVO> getReplyList(@RequestParam("n") int gdsNum) throws Exception {
        logger.info("コメントリストを取得する");
        return service.replyList(gdsNum); // 該当商品のコメントリストを返す
    }
    
    // コメント削除
    @ResponseBody
    @PostMapping(value="/view/deleteReply")
    public int deleteReply(ReplyVO reply, HttpSession session) throws Exception {
        int result = 0; 
        MemberVO member = (MemberVO) session.getAttribute("member"); // ログインユーザー情報を取得
        String userId = service.idCheck(reply.getRepNum()); // コメント作成者のユーザーIDを取得

        if (member.getUserId().equals(userId)) { // ログインIDと一致する場合
            service.deleteReply(reply); // コメントを削除
            result = 1; // 成功
        }
        return result; 
    }
    
    // コメント修正
    @ResponseBody
    @PostMapping(value="/view/modifyReply")
    public int modifyReply(ReplyVO reply, HttpSession session) throws Exception {
        int result = 0;
        MemberVO member = (MemberVO) session.getAttribute("member"); // ログインユーザー情報を取得
        String userId = service.idCheck(reply.getRepNum()); // コメント作成者のユーザーIDを取得

        if (member.getUserId().equals(userId)) { // ログインIDと一致する場合
            service.modifyReply(reply); // コメントを修正
            result = 1; // 成功
        }
        return result;          
    }
    
    // カートに商品を追加
    @ResponseBody
    @PostMapping("/view/addCart")
    public void addCart(CartVO cart, HttpSession session) throws Exception {
        MemberVO member = (MemberVO) session.getAttribute("member"); // ログインユーザー情報を取得
        cart.setUserId(member.getUserId()); // ユーザーIDを設定
        service.addCart(cart); // カートに追加
    }
    
    // カートリストの取得
    @GetMapping("/cartList")
    public void getCartList(HttpSession session, Model model) throws Exception {
        MemberVO member = (MemberVO) session.getAttribute("member"); // ログインユーザー情報を取得
        List<CartListVO> cartList = service.cartList(member.getUserId()); // カート情報を取得
        model.addAttribute("cartList", cartList); // ビューにカートリストを渡す
    }
    
    // カートの項目を削除
    @ResponseBody
    @PostMapping(value = "/deleteCart")
    public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) throws Exception {
        logger.info("カートを削除する");
        MemberVO member = (MemberVO) session.getAttribute("member"); // ログインユーザー情報を取得
        int result = 0;

        if (member != null) {
            cart.setUserId(member.getUserId()); // ユーザーIDを設定
            
            for (String i : chArr) { // 選択されたカート項目を削除
                cart.setCartNum(Integer.parseInt(i)); 
                service.deleteCart(cart); 
            }            
            result = 1; // 成功
        }
        return result;          
    }
    
    // 注文処理
    @PostMapping(value="/cartList")
    public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {
        logger.info("注文を処理する");
        MemberVO member = (MemberVO) session.getAttribute("member"); // ログインユーザー情報を取得
        String userId = member.getUserId();
        
        Calendar cal = Calendar.getInstance();
        String ymd = new DecimalFormat("0000").format(cal.get(Calendar.YEAR)) + 
                     new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1) + 
                     new DecimalFormat("00").format(cal.get(Calendar.DATE));
        String subNum = ""; 
        
        for (int i = 0; i < 6; i++) { // ランダムな番号を生成
            subNum += (int)(Math.random() * 10);
        }
        
        String orderId = ymd + "_" + subNum; // 一意な注文IDを生成
        order.setOrderId(orderId);
        order.setUserId(userId);
        
        service.orderInfo(order); // 注文情報を保存
        orderDetail.setOrderId(orderId);
        service.orderInfo_Details(orderDetail); // 注文詳細を保存
        service.cartAllDelete(userId); // カート情報を全削除
        
        return "redirect:/shop/orderList"; // 注文リスト画面にリダイレクト
    }
    
    // 注文リストを表示
    @GetMapping(value="/orderList")
    public void getOrderList(HttpSession session, OrderVO order, Model model) throws Exception {
        logger.info("注文リストを取得する");
        MemberVO member = (MemberVO) session.getAttribute("member"); // ログインユーザー情報を取得
        order.setUserId(member.getUserId());
        List<OrderVO> orderList = service.orderList(order); // 注文リストを取得
        model.addAttribute("orderList", orderList); // ビューにリストを渡す
    }
    
    // 注文詳細情報を表示
    @GetMapping(value="/orderView")
    public void getOrderView(HttpSession session, @RequestParam("n") String orderId, OrderVO order, Model model) throws Exception {
        logger.info("注文詳細を取得する");
        MemberVO member = (MemberVO) session.getAttribute("member"); // ログインユーザー情報を取得
        order.setUserId(member.getUserId());
        order.setOrderId(orderId);
        List<OrderListVO> orderView = service.orderView(order); // 注文詳細を取得
        model.addAttribute("orderView", orderView); // ビューに詳細情報を渡す
    }
}