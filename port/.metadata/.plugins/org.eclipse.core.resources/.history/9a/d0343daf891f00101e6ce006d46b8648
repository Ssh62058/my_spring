package com.my.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.my.shop.persistence.ShopDAO;
import com.my.shop.vo.CartListVO;
import com.my.shop.vo.CartVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.OrderDetailVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;
import com.my.shop.vo.ReplyVO;

@Service//�떎�젣 鍮꾩쫰�땲�뒪 濡쒖쭅�씠 �쓲瑜대뒗怨�
public class ShopServiceImpl implements ShopService {

	@Inject//
	private ShopDAO dao;
	
	@Override//諛쏆� �뜲�씠�꽣瑜� 湲곗��쑝濡� 遺꾨쪟
	public List<GoodsViewVO> list(int cateCode, int level) throws Exception {
int cateCodeRef = 0;//移댄뀒怨좊━ 李몄“ 肄붾뱶
/*1李� 遺꾨쪟�� 2李⑤텇瑜� 瑜� 留뚯빟 �씠�씪硫�*/	
if(level == 1) {//1李� 遺꾨쪟
	cateCodeRef = cateCode;
	return dao.list(cateCode, cateCodeRef);
}else {//2李� 遺꾨쪟
	return dao.list(cateCode);
}

	}


	@Override//�긽�뭹議고쉶
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return dao.goodsView(gdsNum);
	}


	@Override//�뙎湲��벐湲�
	public void registReply(ReplyVO reply) throws Exception {
		dao.registReply(reply);		
	}


	@Override//�뙎湲�由ъ뒪�듃
	public List<ReplyListVO> replyList(int gdsNum) throws Exception {
		return dao.replyList(gdsNum);
	}


	@Override//�뙎湲��궘�젣
	public void deleteReply(ReplyVO reply) throws Exception {
		dao.deleteReply(reply);		
	}


	@Override//�븘�씠�뵒 泥댄겕
	public String idCheck(int repNum) throws Exception {
		return dao.idCheck(repNum);
	}


	@Override//�뙎湲��닔�젙
	public void modifyReply(ReplyVO reply) throws Exception {
		dao.modifyReply(reply);		
	}


	@Override
	public void addCart(CartVO cart) throws Exception {
		dao.addCart(cart);
		
	}


	@Override//移댄듃 由ъ뒪�듃
	public List<CartListVO> cartList(String userId) throws Exception {
		return dao.cartList(userId);
	}
	
	// 카트 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		dao.deleteCart(cart);
	}


	@Override//주문정보
	public void orderInfo(OrderVO order) throws Exception {
		dao.orderInfo(order);		
	}

	@Override//주문 상세 정보
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		dao.orderInfo_Details(orderDetail);	
	}

	@Override
	public void cartAllDelete(String userId) throws Exception {
	   dao.cartAllDelete(userId);
	}

	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return dao.orderList(order);
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}

	
	
	
	
	
	
	
	
	
	

}
