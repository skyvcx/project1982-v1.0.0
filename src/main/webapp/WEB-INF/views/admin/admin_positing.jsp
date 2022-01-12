<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin_positing.jsp</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/FortAwesome/Font-Awesome@5.14.0/css/all.min.css">
	<link type="text/css" href="/project1982/resources/style/style2.css" rel="stylesheet"/>
    <link type="text/css" href="/project1982/resources/style/main.css" rel="stylesheet"/>
<script src="/project1982/resources/js/Chart.min.js"></script>
</head>
<script src='../resources/js/reply.js' type="text/javascript"></script>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="/project1982/admin/admin_positing.do?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<body>
 

        <!--메뉴바  ------------------------------------------------->

        <header class="header" >
            <!-- 로고-->
            <div>
                <a href="userMain.do" class="logo">
                    <h1>1982</h1>
                </a>
                </div>
               <!--메뉴-->   
               <ul class="menu">
                <li class="left_nav_text"><a href="adminPage.do">블랙리스트 현황</a></li>
                <li class="left_nav_text"><a href="adminPage2.do">구독권 현황</a></li>
                <li class="left_nav_text"><a href="admin_shopInfo.do">사업자 매장정보</a></li>
                <li class="left_nav_text"><a href="admin_positing.do">구인자용</a></li>
                <li class="left_nav_text"><a href="admin_storeClose.do">구직자용</a></li>
                <li class="left_nav_text"><a href="Board.do">고객센터</a></li>
                <li class="left_nav_text"><a href="/project1982/index.jsp">로그아웃</a></li>
               </ul>
               <!-- 오른쪽 메뉴-->
               <div class="right-menu">

               </div>
   
           </header>

    <!-- 메인 ---------------------------------------------------------------->
        <main>
            <div class="body_container"> <!-- 페이지 컨테이너 시작-->
                <div class="body_container_center"> <!-- 중간 메뉴바 시작-->
                    <div class="body_container_center_services">
                     <div class="title">구인게시판 현황</div>
                     
                     <div>
                     <div class="divTable minimalistBlack">
                            <div class="divTableHeading">
                            <div class="divTableRow">
                            <div class="divTableHead">매장명</div>
                            <div class="divTableHead">구인 상태</div>
                            <div class="divTableHead">등록일</div>
                            <div class="divTableHead">근무 시간</div>
                            <div class="divTableHead">구인 인원</div>
                            <div class="divTableHead">알바 소게</div>    
                            <div class="divTableHead">근무일</div> 
                            <div class="divTableHead">급여</div> 
                            <div class="divTableHead">주소</div>  
                    </div>
                    </div>
                           <c:forEach items="${board_ownerList}" var="board_ownerList">
                            <div class="divTableBody">
                            <div class="divTableRow">
                            <div class="divTableCell"><input type='hidden' name="shopname" value='${board_ownerList.shopname}'>${board_ownerList.shopname}</div>
                            <div class="divTableCell"><input type='hidden' name="normal_emergency" value='${board_ownerList.normal_emergency}'>${board_ownerList.normal_emergency}</div>
                            <div class="divTableCell"><input type='hidden' name="jobDate" value='${board_ownerList.jobDate}'>${board_ownerList.jobDate}</div>
                            <div class="divTableCell"><input type='hidden' name="workTime" value='${board_ownerList.jobTime_start} ~ ${board_ownerList.jobTime_end}'>${board_ownerList.jobTime_start} ~ ${board_ownerList.jobTime_end}</div>
                            <div class="divTableCell"><input type='hidden' name="need_Num" value='${board_ownerList.need_Num}'>${board_ownerList.need_Num}</div>
                            <div class="divTableCell"><input type='hidden' name="content" value='${board_ownerList.content}'>${board_ownerList.content}</div>
                            <div class="divTableCell"><input type='hidden' name="regDate" value='${board_ownerList.regDate}'>${board_ownerList.regDate}</div>
                            <div class="divTableCell"><input type='hidden' name="shoppay" value='${board_ownerList.shoppay}'>${board_ownerList.shoppay}</div>
                            <div class="divTableCell"><input type='hidden' name="shopaddr" value='${board_ownerList.shopaddr}'>${board_ownerList.shopaddr}</div>
                          </div>
                          </div>
                         </c:forEach>
                         
                       
						
                        </div>
                        <!-- 페이징 시작 -->
                         <div class="pageing">		
							<c:if test="${paging.startPage != 1 }">
								<a href="/project1982/admin/admin_positing.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
							</c:if>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<b>${p }</b>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<a href="/project1982/admin/admin_positing.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage}">
								<a href="/project1982/admin/admin_positing.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
							</c:if>
						</div>
                        
                        </div>
                </div><!--중간 메뉴바 종료-->
               
            
            </div><!-- 페이지 컨테이너 종료--> 
        </main>
<!-- footer --------------------------------------------------------------------->
    <footer>
        <div id="footer">
            <div class="wrap_inner">
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
                            <a>

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