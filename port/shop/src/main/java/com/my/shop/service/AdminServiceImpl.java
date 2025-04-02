package com.my.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.my.shop.persistence.AdminDAO;
import com.my.shop.vo.CategoryVO;
import com.my.shop.vo.GoodsVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminDAO dao;

	//카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return dao.category();
	}

	//상품등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		dao.register(vo);
	}

	//상품리스트
	@Override
	public List<GoodsViewVO> goodslist() throws Exception {
		return dao.goodslist();
	}
//view
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return dao.goodsView(gdsNum);
	}

	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
	dao.goodsModify(vo);		
	}

	@Override
	public void goodsDelete(int gdsNum) throws Exception {
		dao.goodsDelete(gdsNum);
		
	}

	@Override
	public List<OrderVO> orderList() throws Exception {
		// TODO Auto-generated method stub
		return dao.orderList();
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderView(order);
	}

	@Override
	public void delivery(OrderVO order) throws Exception {
		// TODO Auto-generated method stub
		dao.delivery(order);
	}

	@Override
	public void changeStock(GoodsVO goods) throws Exception {
		// TODO Auto-generated method stub
		dao.changeStock(goods);
	}

	@Override
	public List<ReplyListVO> allReply() throws Exception {
		// TODO Auto-generated method stub
		return dao.allReply();
	}

	@Override
	public void deleteReply(int repNum) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteReply(repNum);
	}

}
