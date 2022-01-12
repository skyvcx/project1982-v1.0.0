<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/FortAwesome/Font-Awesome@5.14.0/css/all.min.css">
	<link type="text/css" href="/project1982/resources/style/style.css" rel="stylesheet"/>
    <link type="text/css" href="/project1982/resources/style/header.css" rel="stylesheet"/>
</head>
<script src="/project1982/resources/js/chat.js" type="text/javascript"></script>
<body>
<% 
	String ownerid = (String)session.getAttribute("ownerid");
	out.println(ownerid + " 님 환영합니다.");
%>


        < <!--메뉴바  ------------------------------------------------->
        <header class="header" >
            <!-- 로고-->
               <div>
               <a href="#" class="logo">
                   <h1>1982</h1>
               </a>
               </div>
               <!--메뉴--> 
             
               
               <!-- 오른쪽 메뉴-->
               <div class="right-menu">
                   <!--검색 -->
                   <a href="/project1982/owner/job_positing.do" id="s1">
                    구인공고
                   </a>
                   <!--유저 -->
                   <a href="/project1982/owner/ownerList.do" id="s2">
                   마이페이지
                   </a>
                   <!--카트  -->
                   <a href="/project1982/owner/ownerBoard.do" id="s3">
                   고객센터
                       <!--카트 상품-->
                       
                   </a>
                   <a href="/project1982/index.jsp" class="logout">
                    로그아웃
                   </a>
               </div>
    
           </header>
    
    <!-- 메인 ---------------------------------------------------------------->
        <main>
      
        <form action="ownerUpdate.do" method='post' enctype="multipart/form-data"> 
            <ul class="left_nav" id="left_nav1">
                <li class="left_nav_text"><a class="home" href="#"></a></li>
                <li class="left_nav_text"><a href="#">새소식</a></li>
                <li class="left_nav_text"><a href="#">상품</a></li>
                <li class="left_nav_text"><a href="#">회사</a></li>
            </ul>
    
            <div class="body_container"> <!-- 페이지 컨테이너 시작-->
         
                <div class="body_container_center"> <!-- 중간 메뉴바 시작-->
                    <div class="main_title">업체 등록 / 수정</div>

                        <div class="body_container_center_shop_contanier">
                            <div class="body_container_center_shop_contanier_img">
                       
                                    <img class="img_box" src="/project1982/resources/upload/${shopList[0].si_realname }">
					        
                            </div>
                            <div class= "body_container_center_shop_contanier_info">
                                <div class="main_font salary">업체이름 :
                                    <input class="input_box" type="text" value="${shopList[0].shopname }" disabled/>
                                </div>
                                <div class="main_font">업체주소 :
                                    <input class="input_box" type="text" value="${shopList[0].shopaddr }" disabled/>
                                </div>
                                <div class="main_font">전화번호 :
                                    <input class="input_box" type="text" value="${shopList[0].shoppn }" disabled/>
                                </div>          
                                <div class="main_font">업체소개 :
                                    
                                    <textarea name="" id="" cols="30" rows="10" style="resize:none"; disabled>
                                        ${shopList[0].shopcontent }
                                    </textarea>
                                </div>                              
                                
                                <button class="store_button1">수정 </button>
                               
                            </div>
                        </div> 
                     
                          
                            
                    
                    
                    

                    <div class="main_title">업체 등록 현황</div>
                    <div>
                        <div class="divTable minimalistBlack">
                            <div class="divTableHeading">
                            <div class="divTableRow">
                            <div class="divTableHead">번호</div>
                            <div class="divTableHead">업체 이름</div>
                            <div class="divTableHead">매니저 이름</div>
                            <div class="divTableHead">업체 주소</div>
                            <div class="divTableHead">업체 연락처</div>
                            <div class="divTableHead">업체소개</div>
                       
                            </div>
                            </div>
                            
                        <c:forEach items="${shopList }" var="shop">    
                            <div class="divTableBody">
                            <div class="divTableRow">
                                 <div class="divTableCell">${shop.shopnum }</div>
                           		 <div class="divTableCell">${shop.shopname }</div>
                          		 <div class="divTableCell">${shop.ownername}</div>
                            
                           		 <div class="divTableCell">${shop.shopaddr }</div>
                           		 <div class="divTableCell">${shop.shoppn }</div>
                           		 <div class="divTableCell">${shop.shopcontent }</div>
                          </div>
                          </div>
                   
                            
                         </c:forEach>
                    </div>
    				<br>
    				<br>
                    <div class="main_title">구직자 신청 현황</div>

                    


                   
                           
                        <div class="divTable minimalistBlack"><!-- 구직자 신청 현황 시작 -->
                            <div class="divTableHeading">
                            	<div class="divTableRow">
                            		<div class="divTableHead">번호</div>
                          	 		<div class="divTableHead">구직자 이름</div>
                           	 		<div class="divTableHead">근무 예정 일자</div>
                          	 		<div class="divTableHead">이력서 확인</div>
                         	 		<div class="divTableHead">고용 여부</div>
                          			<div class="divTableHead">연락처</div>    
                          			<div class="divTableHead">대화하기</div>   
                        		</div>
                            </div>
                            	 <c:forEach items="${userInfo }" var="info">    
                            	 
                           			 <div class="divTableBody">
                           				 <div class="divTableRow">
                             		   		 <div class="divTableCell">${info.board_owner_seq }</div>
                            				 <div class="divTableCell">${info.userName }</div>
                            				 <div class="divTableCell">${info.jobDate}</div>
                            
                           					 <div class="divTableCell">${info.shopaddr }</div>
                           					 <div class="divTableCell">
                           					 	
                           					 	<button onclick="return false">고용</button>
                           					 	<button onclick="return false">거절</button>
                           					 
                           					 </div>
                          					 
                           					 <div class="divTableCell">${info.userPn }</div>
                           					 <div class="divTableCell">
                           					 	<input type=button value="대화" onclick="javascript:openWin();">  


                           					 </div>
                           					 	
                           					 </div>
                           					 
                         				 </div>
                         			</c:forEach>
                     	 </div> <!-- 구직자 신청 현황 종료 -->
                   
                            <br>
                            <br>
                            
                            <div class="main_title">출근 현황</div>
                    
                        <div class="divTable minimalistBlack"><!-- 출근현황 시작 -->
                            <div class="divTableHeading"><!-- 제목 전체 -->
                           		 <div class="divTableRow"><!-- 제목 내부 -->
                           			 <div class="divTableHead">긴급 / 일일</div>
                          			 <div class="divTableHead">번호</div>
                          			 <div class="divTableHead">구직자 이름</div>
                          			 <div class="divTableHead">근무시간</div>
                          			 <div class="divTableHead">급여</div>
                           			 <div class="divTableHead">차단</div>
                           			 <div class="divTableHead">알바종료</div>
    
                     			 </div><!-- 제목내부 -->
                            </div><!-- 제목 전체 -->
                         <div class="divTableBody">
                            <div class="divTableRow">
                         	 	  <div class="divTableCell">cell1_1</div>
                         	  	 <div class="divTableCell">cell2_1</div>
                          	 	 <div class="divTableCell">cell3_1</div>
                           		 <div class="divTableCell">cell4_1</div>
                          	 	 <div class="divTableCell">근무태만</div>
                          	 	 <div class="divTableCell"><button>차단</button></div>
                          	 	 <div class="divTableCell"><button>알바 종료</button></div>
                           	</div> <!-- 첫행 -->
                            <div class="divTableRow">
                         		   <div class="divTableCell">cell1_2</div>
                         	   <div class="divTableCell">cell2_2</div>
                         	   <div class="divTableCell">cell3_2</div>
                         		   <div class="divTableCell">cell4_2</div>
                         	   <div class="divTableCell">지가사장인줄암</div>
                         	   <div class="divTableCell"><button>차단</button></div>
                         	   <div class="divTableCell"><button>알바 종료</button></div>
                            </div>
                            <div class="divTableRow">
                          	  <div class="divTableCell">cell1_3</div>
                          	  <div class="divTableCell">cell2_3</div>
                         	   <div class="divTableCell">cell3_3</div>
	                            <div class="divTableCell">cell4_3</div>
		                            <div class="divTableCell">잠수</div>
	                      	      <div class="divTableCell"><button>차단</button></div>
                         	   <div class="divTableCell"><button>알바 종료</button></div>
                            </div>
                            <div class="divTableRow">
                          	  <div class="divTableCell">cell1_4</div>
                         	   <div class="divTableCell">cell2_4</div>
                        	    <div class="divTableCell">cell3_4</div>
                         	   <div class="divTableCell">cell4_4</div>
                         		   <div class="divTableCell">싹퉁바가지</div>
                         	   <div class="divTableCell"><button>차단</button></div>
                          	  <div class="divTableCell"><button>알바 종료</button></div>
                            </div>
                            <div class="divTableRow">
                          	  <div class="divTableCell">cell1_5</div>
                          	  <div class="divTableCell">cell2_5</div>
                          	  <div class="divTableCell">cell3_5</div>
                          	  <div class="divTableCell">cell4_5</div>
                          	  <div class="divTableCell">범죄</div>
                           	 <div class="divTableCell"><button>차단</button></div>
                           	 <div class="divTableCell"><button>알바 종료</button></div>
                            </div>
                            
                            </div>
                           
                            </div><!--  출근현황 종료 -->
                
    
                    <div class="main_title">구직자 차단 내역</div>
                    <div>
                        <div class="divTable minimalistBlack">
                            <div class="divTableHeading">
                            <div class="divTableRow">
                            <div class="divTableHead">번호</div>
                            <div class="divTableHead">구직자 이름 / 아이디</div>
                            <div class="divTableHead">차단 일자</div>
                            <div class="divTableHead">차단사유</div>
           
    
                        </div>
                            </div>
                            <div class="divTableBody">
                            <div class="divTableRow">
                            <div class="divTableCell">1</div>
                            <div class="divTableCell">cell2_1</div>
                            <div class="divTableCell">cell3_1</div>
                            <div class="divTableCell">cell4_1</div>
                   
                            </div>
                            <div class="divTableRow">
                            <div class="divTableCell">2</div>
                            <div class="divTableCell">이성대(skyvcx)</div>
                            <div class="divTableCell">2021-12-13</div>
                            <div class="divTableCell">지가 사장인줄 암</div>
               
                            </div>
                            <div class="divTableRow">
                            <div class="divTableCell">cell1_3</div>
                            <div class="divTableCell">cell2_3</div>
                            <div class="divTableCell">cell3_3</div>
                            <div class="divTableCell">cell4_3</div>
               
                            </div>
                            <div class="divTableRow">
                            <div class="divTableCell">cell1_4</div>
                            <div class="divTableCell">cell2_4</div>
                            <div class="divTableCell">cell3_4</div>
                            <div class="divTableCell">cell4_4</div>
                            
                            </div>
                            <div class="divTableRow">
                            <div class="divTableCell">cell1_5</div>
                            <div class="divTableCell">cell2_5</div>
                            <div class="divTableCell">cell3_5</div>
                            <div class="divTableCell">cell4_5</div>
    
                            </div>
                            
                            </div>
                           
                            </div>
                   
                        		
                          </div> <!-- 구직자 차단내역 종료 -->
                          
                          
                          
                          </div>
                            
                            
                         
                        </div>
                        
                        
                     
    				<div>
                     
                   
                </div><!--중간 메뉴바 종료-->
               
            
            </div><!-- 페이지 컨테이너 종료--> 
        </form> <!--  전체폼으로 감싸기 -->
        </main>
        
        
        
        
        
        
        
        
        
        
        
    
    
    
    
    
    
    
    <!-- footer --------------------------------------------------------------------->
    <footer>
        <div id="footer">
            <div class="wrap_inner" id="wrap">
                <div class="left_area">
                    <h4 class="rap_inner_h4">
                        일구하자 1982
                    </h4>
                    <div class="left_text">
                        <div class="left_text_margin">
                            <h5>고객센터</h5>
                            <p class="left_phone">1566-1982</p>
                            <p> 
                                <div>평일 AM 09:00 ~ PM 05:30</div>
                                <div>점심 PM 12:00 ~ PM 01:00</div>
                            </p>
                        </div>
                    </div>
                    <div class="footer_icon">
                        <div><a href="#"><i class="fab fa-facebook-f fa-2x" style="color:rgba(0,0,0,0.5)"></i></a></div>
                        <div><a href="#"><i class="fab fa-twitter fa-2x" style="color:rgba(0,0,0,0.5)"></i></a></div>
                        <div><a href="#"><i class="fab fa-youtube fa-2x" style="color:rgba(0,0,0,0.5)"></i></a></div>
                        <div><a href="#"><i class="fab fa-instagram fa-2x" style="color:rgba(0,0,0,0.5)"></i></a></div>
                    </div>
                </div>
    
    
                <div class="right_area">
                    <div class="right_ul">
                        <p>이용약관 | </p>
                        <p>개인정보처리방침 | </p>
                        <p>일구하자 이용안내 | </p>
                        <p>고객요청</p>
                    </div>
                    <div class="right_address">
                        <p>
                            <span>주식회사 1982 |</span>
                            <a href="#">
    
                                <span>대표이사 : 한세호 |</span>
                            </a>
                                <span>사업자등록번호 : 123-12-12345</span>
                            </p>
                        <p>
                            <span>통신판매업신고 : 2021-서울가산-1982 |</span>
                            <span>WEBMASTER : 한세호</span>
                        </p>
                        <p>
                            <span>주소 : 00000 서울 금천구 벚꽃로 309 </span>
                        </p>
                        <p>
                            <span>TEL : 1566-1982</span>
                            <span>E - mail : 1982@seho.co.kr</span>
                            <span>호스팅제공자 : 코스모(주)</span>
                        </p>
                    </div>
                    <p class="right_copyright">
                        Copyright by
                        <span>일구하자 1982</span>
                        all rights reserved.
                    </p>
                </div>        
            </div>
        </div>
    
    </footer>
    </body>
    </html>