package com.javassem.dao;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javassem.domain.ShopInfoVO;
import com.javassem.domain.SupportVO;
import com.javassem.domain.UserVO;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO {
	
    @Autowired
    private SqlSessionTemplate mybatis;
  
    public UserVO idCheck(UserVO vo) {
    	System.out.println("===> UserMapper idCheck");
    	return (UserVO)this.mybatis.selectOne("user.idCheck", vo);
    }
  
    public int userInsert(UserVO vo) {
    	System.out.println("===>  MemberMapper userInsert()");
    	return this.mybatis.insert("user.userInsert", vo);
    }
  
    public UserVO userLogin(UserVO vo) {
    	System.out.println("===> UserMapper idCheck");
    	return (UserVO)this.mybatis.selectOne("user.idCheck", vo);
    }
    
    public List<UserVO> findId(UserVO vo){
    	return this.mybatis.selectList("user.findId", vo);
    }
  
    public String userDate(UserVO vo) {
    	return (String)this.mybatis.selectOne("sample.getDate", vo);
    }

	public void insertUserInfoView(UserVO vo) {
		this.mybatis.insert("user.insertUserView", vo);
	}
	
	public void updateUserInfoView(UserVO vo) {
		this.mybatis.update("user.updateUserView", vo);
	}
	
	public void deleteUserInfoView(UserVO vo) {
	    this.mybatis.delete("user.deleteUserView", vo);
	}
	
	public UserVO getUserInfoView(UserVO vo) {
	    return (UserVO)this.mybatis.selectOne("user.getUserView", vo);
	}

	@Override
	public List<SupportVO> getSupportView(HashMap map) {
		return this.mybatis.selectList("user.getSupportView", map);
	}

	@Override
	public ShopInfoVO getShopView(ShopInfoVO vo) {
		return this.mybatis.selectOne("user.getShopView", vo);
	}
	
	@Override
	public void updateInfoView(UserVO vo) {
		this.mybatis.update("user.updateInfoView", vo);
	}
}
