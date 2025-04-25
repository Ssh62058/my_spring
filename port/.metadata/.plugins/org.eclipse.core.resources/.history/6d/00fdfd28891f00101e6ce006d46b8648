package com.my.shop.service;

import java.util.List;

import com.my.shop.vo.CartListVO;
import com.my.shop.vo.CartVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.OrderDetailVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;
import com.my.shop.vo.ReplyVO;

public interface ShopService {
	
	//移댄뀒怨좊━蹂� �긽�뭹 由ъ뒪�듃
	public List<GoodsViewVO> list(int cateCode, int level) throws Exception;
	
	//�긽�뭹議고쉶
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	//�뙎湲��벐湲�
	public void registReply(ReplyVO reply)throws Exception;
	
	//�뙎湲�由ъ뒪�듃
	public List<ReplyListVO> replyList(int gdsNum) throws Exception;
	
	//�뙎湲��궘�젣
	public void deleteReply(ReplyVO reply)throws Exception;
	
	//�븘�씠�뵒 泥댄겕
	public String idCheck(int repNum) throws Exception;
    
	//�뙎湲��닔�젙
	public void modifyReply(ReplyVO reply)throws Exception;
	
	//移댄듃�떞湲�
	public void addCart(CartVO cart)throws Exception;
	
	//移댄듃由ъ뒪�듃
	public List<CartListVO> cartList(String userId) throws Exception;
	// 카트 삭제
	public void deleteCart(CartVO cart) throws Exception;
	
	//주문정보
	public void orderInfo(OrderVO order) throws Exception;
	
	//주문상세정보
	public void orderInfo_Details(OrderDetailVO orderDetail)throws Exception;
	
	//카트비우기
	public void cartAllDelete(String userId) throws Exception;
	
	//오더리스트
	public List<OrderVO> orderList(OrderVO order)throws Exception;
	
	//오더뷰
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
	
	
	
	
	

}
