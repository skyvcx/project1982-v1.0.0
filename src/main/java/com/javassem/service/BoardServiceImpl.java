package com.javassem.service;

import com.javassem.dao.BoardDAOImpl;
import com.javassem.domain.BoardVO;
import com.javassem.util.PagingVO;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
  @Autowired
  private BoardDAOImpl boardDAO;
  
  // 게시판 서비스
  public void insertBoard(BoardVO vo) {
    this.boardDAO.insertBoard(vo);
  }
  
  public void updateBoard(BoardVO vo) {
    this.boardDAO.updateBoard(vo);
  }
  
  public void updatecount(BoardVO vo){
	this.boardDAO.updatecount(vo);
  }
    
  public void deleteBoard(BoardVO vo) {
    this.boardDAO.deleteBoard(vo);
  }
  
  public BoardVO getBoard(BoardVO vo) {
    return this.boardDAO.getBoard(vo);
  }
  
  // 게시판 검색기능 / 페이징처리
  public List<BoardVO> getBoardList(HashMap map) {
    return this.boardDAO.getBoardList(map);
  }
  
  public int countBoard() {
    return this.boardDAO.countBoard();
  }
  
  public List<BoardVO> selectBoard(PagingVO vo) {
    return this.boardDAO.selectBoard(vo);
  }
}
