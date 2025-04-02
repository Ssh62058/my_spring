package com.my.shop.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.my.shop.vo.CartListVO;
import com.my.shop.vo.CartVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.OrderDetailVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;
import com.my.shop.vo.ReplyVO;

@Repository
public class ShopDAOImpl implements ShopDAO {
	
	@Inject
	private SqlSession sql;//sql紐낅졊臾� 以�寃껋쓣 �떞�븘�빞 �빐�꽌 
	
	//留ㅽ븨�빐以섏빞 �릺�뒗 留덉씠諛뷀떚�뒪紐낆쓣 �몴湲�
	private static String namespace ="com.my.shop.mappers.shopMapper";

	@Override//援곗쑝濡� 遺꾨쪟�븯湲� �쐞�빐�꽌 �빐�떆留� �궗�슜
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception {
		
		HashMap<String, Object> map = new HashMap<>();
		//�뼱�젅�씠 由ъ뒪�듃 異붽��븷�븣�뒗 �빐�떆留듭� put
		map.put("cateCode", cateCode);//map.put(null, map)
		map.put("cateCodeRef", cateCodeRef);//map.put(null, map)
		
		return sql.selectList(namespace + ".list_1", map);
	}
	
	@Override
	public List<GoodsViewVO> list(int cateCode) throws Exception {
		return sql.selectList(namespace + ".list_2", cateCode);
	}

	@Override//�긽�뭹 view page �븳媛쒖쓽�뻾�씠 �엳�뒗吏� 寃��궗�븯�뒗 ���젆�듃�썝(�븯�굹�씠�긽 �씪�븣 �닾留ㅻ땲 �씡�뀎�뀡�쓣 諛쒖깮)
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return sql.selectOne("com.my.shop.mappers.adminMapper"+".goodsView",gdsNum);
	}
	//�뙎湲��벐湲�
	@Override
	public void registReply(ReplyVO reply) throws Exception {
sql.insert(namespace + ".registReply", reply);		
	}
	//�뙎湲�由ъ뒪�듃
	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception {
		return sql.selectList(namespace + ".replyList", gdsNum);
	}
	//�뙎湲��궘�젣
	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
sql.delete(namespace + ".deleteReply", reply);	
	}
	//�븘�씠�뵒 泥댄겕
	@Override
	public String idCheck(int repNum) throws Exception {
		return sql.selectOne(namespace + ".replyUserIdCheck", repNum);
	}
	//�뙎湲��닔�젙
	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		sql.update(namespace + ".modifyReply", reply);		
	}
	//sql怨� 媛숈� layer dao[�씤�꽣�럹�씠�뒪], daoImpl[�솗�옣]

	@Override//移댄듃�떞湲�
	public void addCart(CartVO cart) throws Exception {
		sql.insert(namespace + ".addCart", cart);
	}

	@Override//移댄듃由ъ뒪�듃
	public List<CartListVO> cartList(String userId) throws Exception {
		return sql.selectList(namespace + ".cartList",userId);
	}
	
	// 移댄듃 �궘�젣
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		sql.delete(namespace + ".deleteCart", cart);
	}
	/*
	주문리스트 sql 명령을 담아준 레이어
	1) 장바구니에서 주문한거 리스트로 생성되어 있어야함(세션과 제품과 주문자 이것들 때문에  join사용)
	2) 변심으로 (주문했던거 부분적으로 삭제하거나 다 주문하거나 다주문하지 않거나)
	*/
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		sql.insert(namespace + ".orderInfo", order);
	}

	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		sql.insert(namespace + ".orderInfo_Details", orderDetail);		
	}

	@Override
	public void cartAllDelete(String userId) throws Exception {
		sql.delete(namespace + ".cartAllDelete", userId);		
	}
	

	@Override//리스트
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderList", order);
	}

	@Override//view
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderView", order);
	}


	
	
	
	
	
	
	

}
