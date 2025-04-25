package com.my.shop.persistence;

import java.util.List;

import com.my.shop.vo.CartListVO;
import com.my.shop.vo.CartVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.OrderDetailVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;
import com.my.shop.vo.ReplyVO;

public interface ShopDAO {
	
	//�긽�뭹由ъ뒪�듃
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception;

	List<GoodsViewVO> list(int cateCode) throws Exception;
	
	//�긽�뭹 view page
	public GoodsViewVO goodsView(int gdsNum)throws Exception;
	
	//�뙎湲��벐湲�
	public void registReply(ReplyVO reply)throws Exception;	
	//�뙎湲�由ъ뒪�듃
	public List<ReplyListVO> replyList(int gdsNum)throws Exception;
	//�뙎湲��궘�젣
	public void deleteReply(ReplyVO reply)throws Exception;	
	//�븘�씠�뵒 泥댄겕
	public String idCheck(int repNum) throws Exception;	
	//�뙎湲��닔�젙
	public void modifyReply(ReplyVO reply)throws Exception;
	
//移댄듃�떞湲�
public void addCart(CartVO cart) throws Exception;
	
//移댄듃由ъ뒪�듃
public List<CartListVO> cartList(String userId) throws Exception;

//移댄듃 �궘�젣
public void deleteCart(CartVO cart) throws Exception;


//오더리스트
public void orderInfo(OrderVO order)throws Exception;

//오더뷰 상세정보 디테일 리드
public void orderInfo_Details(OrderDetailVO orderDetail)throws Exception;

//모두 삭제
public void cartAllDelete(String userId)throws Exception;
	
//특정 오더리스트
public List<OrderVO> orderList(OrderVO order)throws Exception;

//특정 오더뷰
public List<OrderListVO> orderView(OrderVO order)throws Exception;	
	
	

}
