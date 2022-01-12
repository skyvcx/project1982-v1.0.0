package com.javassem.controller;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javassem.domain.ShopVO;
import com.javassem.service.OwnerService;
import com.javassem.service.ShopService;


@Controller
@RequestMapping({"user"})
public class ShopController {

	
	@Autowired
	private ShopService shopService;
	
	@Autowired
	private OwnerService ownerService;
	  
	@Autowired
	  private SqlSessionTemplate mybatis;	
	
	// 일자리 찾기 업체 가져오기.
	@RequestMapping(value="storeCloseget.do", method=RequestMethod.GET)
	public String select(ShopVO vo, Model m,String searchCondition, String searchKeyword ){
		
		HashMap map = new HashMap();
		map.put("searchCondition", searchCondition);
		map.put("searchKeyword", searchKeyword);
		
		List<ShopVO> list = shopService.getShopList(map);
		m.addAttribute("ShopList", list);
		return "user/storeClose" ;
	}
	

	@RequestMapping(value = {"userSupport.do"}, method=RequestMethod.GET)
	public void getShop(@RequestParam int board_owner_seq, ShopVO vo, Model m){
		
		vo.setBoard_owner_seq(board_owner_seq);
		
		
		ShopVO result = shopService.getShop(vo);
		
		
		m.addAttribute("shop", result);
	
		
	}
	
	@RequestMapping(value = {"support.do"}, method=RequestMethod.POST)
	public String getShop2(
			
			@RequestParam int board_owner_seq,
			@RequestParam String shopname,
			@RequestParam String normal_emergency,
			@RequestParam String shopaddr,
			@RequestParam String shoppay,
			@RequestParam String jobDate,
			@RequestParam String startTime,
			@RequestParam String endTime,
			@RequestParam String userid,
			
			ShopVO vo, Model m) {
			
			vo.setBoard_owner_seq(board_owner_seq);
			vo.setShopname(shopname);
			vo.setNormal_emergency(normal_emergency);
			vo.setShopaddr(shopaddr);
			vo.setShoppay(shoppay);
			vo.setJobDate(jobDate);
			vo.setJobTime_start(startTime);
			vo.setJobTime_end(endTime);
			vo.setUserid(userid);
			
			
			ShopVO y = mybatis.selectOne("ShopDAO.getSupport", vo);
			
			if(y != null){
				return "redirect:storeClose.do";
							
			}else{
				
				mybatis.insert("ShopDAO.getShop2", vo);
				return "redirect:storeClose.do";
			}
		

	}



	// 일자리 찾기 버튼 클릭시 동작하는 코드
    @RequestMapping({"storeClose.do"})
    public void select(ShopVO vo, Model m) {
    	
        List<ShopVO> list = shopService.ShopList(vo);
        m.addAttribute("ShopList", list);
     
        
    }
}
