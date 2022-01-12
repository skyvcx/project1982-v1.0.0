package com.javassem.service;


import java.util.HashMap;
import java.util.List;

import com.javassem.domain.ShopInfoVO;
import com.javassem.domain.SupportVO;
import com.javassem.domain.UserVO;

public interface UserService {
	
  // 구직자 회원가입 로그인 서비스
  UserVO idCheck_Login(UserVO paramUserVO);
  
  int userInsert(UserVO paramUserVO);
  
  List<UserVO> findId(UserVO paramUserVO);
  
  // 구직자 마이페이지 서비스
  void insertUserInfoView(UserVO paramUserVO);
  
  void updateUserInfoView(UserVO paramUserVO);
  
  void updateInfoView(UserVO paramUserVO);

  void deleteUserInfoView(UserVO paramUserVO);
  
  UserVO getUserInfoView(UserVO paramUserVO);
  
  List<SupportVO> getSupportView(HashMap map);
  
  ShopInfoVO getShopView(ShopInfoVO paramShopInfoVO);
}
