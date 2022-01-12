package com.javassem.controller;

import com.javassem.domain.BoardVO;
import com.javassem.service.BoardService;
import com.javassem.util.PagingVO;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping
public class UserBoardController {
	
  @Autowired
  private BoardService boardService;
  
	
  @RequestMapping({"/user/{step}.do"}) 
  public String test(@PathVariable String step, HttpServletRequest request, Model m){
	HttpSession session = request.getSession();
      m.addAttribute("userId",session.getAttribute("userId"));
      m.addAttribute("userPass",session.getAttribute("userPass"));
      return "/user/" + step;
  }
	 
  
  @RequestMapping("/user/user_login.do")
  public void test() {
	  
  }
  
  @PostMapping({"/user/saveBoard.do"})
  public String insertBoard(BoardVO vo, Model m){
    this.boardService.insertBoard(vo);
    m.addAttribute("msg", "글 등록이 완료되었습니다");
    return "user/saveOK";
  }
  
  
  @RequestMapping(value = {"/user/userBoard.do"}, method = {RequestMethod.GET})
  public String select(String searchCondition, String searchKeyword, Model m, PagingVO vo, @RequestParam(value = "nowPage", required = false) String nowPage, @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
    HashMap<Object, Object> map = new HashMap<>();
    int total = this.boardService.countBoard();
    if (nowPage == null && cntPerPage == null) {
      nowPage = "1";
      cntPerPage = "5";
    } else if (nowPage == null) {
      nowPage = "1";
    } else if (cntPerPage == null) {
      cntPerPage = "5";
    }
    
    vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
    map.put("searchCondition", searchCondition);
    map.put("searchKeyword", searchKeyword);
    map.put("start", vo.getStart());
    map.put("end", vo.getEnd());
    
    List<BoardVO> list = this.boardService.getBoardList(map);
    m.addAttribute("paging", vo);
    m.addAttribute("boardList", list);
    return "user/userBoard";
  }
  
  @RequestMapping({"/user/getBoard.do"})
  public void getBoard(BoardVO vo,  HttpServletRequest request, Model m) {
	this.boardService.updatecount(vo);

	BoardVO result = this.boardService.getBoard(vo);
	HttpSession session = request.getSession();
    m.addAttribute("userId",session.getAttribute("userId"));
    m.addAttribute("userPass",session.getAttribute("userPass"));
    m.addAttribute("board", result);
  }
  
  @DeleteMapping({"/user/deleteBoard.do"})
  public void delectBoard(BoardVO vo) {
    this.boardService.deleteBoard(vo);
  }
  
  @RequestMapping({"/user/updateBoard.do"})
  public void updateBoard(BoardVO vo) {
    this.boardService.updateBoard(vo);
  }
}
