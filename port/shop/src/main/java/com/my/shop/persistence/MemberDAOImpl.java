package com.my.shop.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.my.shop.vo.MemberVO;

@Repository//데이터 엑세스 계층 클래스에 사용
//Persistence Layer와 관련된 클래스에 주로사용[데이터베이스와 상호작용하는 담당하는 클래스]
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sql;//sql에 명령어를 가져옴
	
	//매퍼설정
	private static String namespace="com.my.shop.mappers.memberMapper";

	//회원가입
	@Override
	public void signup(MemberVO vo) throws Exception {
		sql.insert(namespace + ".signup", vo);

	}

	//로그인
	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		return sql.selectOne(namespace + ".signin", vo);
	}
	
	
	
	
	
	
	
	
	

}
