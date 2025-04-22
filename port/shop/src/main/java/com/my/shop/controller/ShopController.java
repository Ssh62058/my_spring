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
@RequestMapping("/shop/*")
public class ShopController {
    
    private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
    
    @Inject
    ShopService service;

    // カテゴリー別商品リスト
    @GetMapping("/list")
    public void getList(@RequestParam("c") int cateCode, @RequestParam("l") int level, Model model)throws Exception{
        logger.info("カテゴリー別ページに入る");
        List<GoodsViewVO> list = null;
        list = service.list(cateCode, level);
        model.addAttribute("list", list);
    }
    
    // 商品詳細の表示
    @GetMapping("/view")
    public void getView(@RequestParam("n") int gdsNum, Model model) throws Exception{
        logger.info("商品ビューを取得する");
        
        GoodsViewVO view = service.goodsView(gdsNum);
        model.addAttribute("view", view);
    }
    
    // コメント登録
    // ユーザーが作成したコメント内容と投稿情報を一緒に渡す
    @ResponseBody
    @PostMapping(value="/view/registReply")
    public void registReply(ReplyVO reply, HttpSession session)throws Exception{
        logger.info("コメントを登録する");
        // ログインセッション(ウェブでユーザー情報を保存するセッションURI)
        MemberVO member = (MemberVO)session.getAttribute("member");
        reply.setUserId(member.getUserId());
        // コントロールサービスロジック
        service.registReply(reply);
    }

    // コメントリストを取得する
    @ResponseBody
    @GetMapping(value="/view/replyList")
    public List<ReplyListVO> getReplyList(@RequestParam("n") int gdsNum) throws Exception{
        logger.info("コメントリストに入る");
        List<ReplyListVO> reply = service.replyList(gdsNum);
        return reply;
    }
    
    // コメント削除はログインしたユーザーIDと作成したIDが一致していない場合処理されません
    @ResponseBody
    @PostMapping(value="/view/deleteReply")
    public int getReplyList(ReplyVO reply, HttpSession session) throws Exception{
        int result = 0; 
        
        MemberVO member = (MemberVO)session.getAttribute("member");
        // コメントを作成したユーザーIDを取得する
        String userId = service.idCheck(reply.getRepNum()); 
        
        if(member.getUserId().equals(userId)) {
            reply.setUserId(member.getUserId());
            service.deleteReply(reply);
            result = 1; // 成功
        }
        return result; 
    }
    
    // ユーザーIDを確認する
    @ResponseBody
    @PostMapping(value="/view/modifyReply")
    public int modifyReply(ReplyVO reply, HttpSession session)throws Exception{
        int result = 0;
        MemberVO member = (MemberVO)session.getAttribute("member");
        String userId = service.idCheck(reply.getRepNum());

        if(member.getUserId().equals(userId)) {
            reply.setUserId(member.getUserId());
            service.modifyReply(reply);
            result = 1; // 成功
        }
        return result;         
    }
    
    // カートを追加する
    @ResponseBody
    @PostMapping("/view/addCart")
    public void addCart(CartVO cart, HttpSession session)throws Exception{
        MemberVO member = (MemberVO)session.getAttribute("member");
        cart.setUserId(member.getUserId());
        
        service.addCart(cart);
    }
    
    // カートリストの取得
    @GetMapping("/cartList")
    public void getCartList(HttpSession session, Model model) throws Exception {
        MemberVO member = (MemberVO)session.getAttribute("member");
        String userId = member.getUserId();
        
        List<CartListVO> cartList = service.cartList(userId);
        model.addAttribute("cartList", cartList);
    }
    
    // カートを削除する
    @ResponseBody
    @PostMapping(value = "/deleteCart")
    public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) throws Exception {
        logger.info("カートを削除する");
        
        MemberVO member = (MemberVO)session.getAttribute("member");
        String userId = member.getUserId();
        
        int result = 0;
        int cartNum = 0;         
        
        if(member != null) {
            cart.setUserId(userId);
            
            for(String i : chArr) {
                cartNum = Integer.parseInt(i); 
                cart.setCartNum(cartNum);
                service.deleteCart(cart);
            }            
            result = 1;
        }            
        return result;         
    }
    
    // 注文処理
    @PostMapping(value="/cartList")
    public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception{
        logger.info("注文を処理する");
        // カレンダーの呼び出し
        MemberVO member = (MemberVO)session.getAttribute("member");
        String userId = member.getUserId();
        
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH+1));
        String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
        String subNum = ""; 
        
        for(int i=1; i<=6;i++) {
            subNum += (int)(Math.random() * 10);
        }
        
        String orderId = ymd + "_" + subNum;
        
        order.setOrderId(orderId);
        order.setUserId(userId);
        
        service.orderInfo(order);
        orderDetail.setOrderId(orderId);
        service.orderInfo_Details(orderDetail);
        
        service.cartAllDelete(userId);
        
        return "redirect:/shop/orderList";
    }
    
    // 注文リスト
    @GetMapping(value="/orderList")
    public void getOrderList(HttpSession session, OrderVO order, Model model) throws Exception{
        logger.info("注文リストを取得する");
        
        MemberVO member = (MemberVO)session.getAttribute("member");
        String userId = member.getUserId();
        
        order.setUserId(userId);
        List<OrderVO> orderList = service.orderList(order);
        model.addAttribute("orderList", orderList);
    }
    
    // 注文詳細情報の取得
    @GetMapping(value="/orderView")
    public void getOrderView(HttpSession session, @RequestParam("n") String orderId, OrderVO order, Model model) throws Exception{
        logger.info("注文ビューを取得する");
        
        MemberVO member = (MemberVO)session.getAttribute("member");
        String userId = member.getUserId();
        
        order.setUserId(userId);
        order.setOrderId(orderId);
        
        List<OrderListVO> orderView = service.orderView(order);
        model.addAttribute("orderView", orderView);
    }
}