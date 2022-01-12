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
    <title>adminPage.jsp</title>
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
		location.href="/project1982/admin/adminPage.do?nowPage=${paging.nowPage}&cntPerPage="+sel;
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
                   
                    <div class="title">서비스 이용 지표</div>
                    <div class="body_container_center_services">
                        <div class="service1">        
                            <!-- 매칭성공률 -->
                            <div class="service1_left">
                             <div class="matchPercent"> 매칭성공률 ${matching_success}% </div> 
                             <canvas id="matching"></canvas>
                            </div>                     

      						<!-- 재이용률 -->
                            <div class="service1_right">
                            <div class="reusePercent"> 재이용률 ${reusing_ratio}% </div>
                            <canvas id="reuse"></canvas>
                            </div>

                        </div>
                        <div class="body_container_center_members">
                        <div class="service2">
                            <div class="service2_left">
                            <span class="visit_label">금일 방문자 수: ${visitToday} 명</span>
                            </div>
                            
                            
                       <!-- 방문자 현황 -->     
                            <div class="service2_right">
                       		   <canvas id="lineChart" width="250" height="250"></canvas>
               		  	    </div>
                  	   </div>
                  	   
               <!--  회원가입 현황  -->
                        <div class="member1">
                             <span class="visit_label">금일 신규 가입자 수 : ${joinToday} 명</span>
                        </div>
                        <div class="member2">
                         <canvas id="barChart" width="250" height="250"></canvas>
                        </div>
       				</div>
                    </div>
<!-- 여기2 -->           
                     <div class="visit_label">블랙리스트 현황 (경고 3회시 - 영구정지)</div>
                     
                     <div>
                     <div class="divTable minimalistBlack">
                            <div class="divTableHeading">
                            <div class="divTableRow">
                            <div class="divTableHead">계정명</div>
                            <div class="divTableHead">경고누적 횟수</div>
                            <div class="divTableHead">경고 날짜</div>
                            <div class="divTableHead">구직자 이름</div>
                            <div class="divTableHead">사유</div>
                            <div class="divTableHead">구직자 회원번호</div>
                            <div class="divTableHead">사업자 회원번호</div>
                            <div class="divTableHead">이용 정지</div>    
                    </div>
                    </div>
                           <c:forEach items="${blacklist}" var="blacklist">
                            <div class="divTableBody">
                            <div class="divTableRow">
                            <div class="divTableCell"><form action='../checkCnt.do' method='post'><input type='hidden' name="userId" value='${blacklist.userId}'>${blacklist.userId}</div>
                            <div class="divTableCell"><input type='hidden' name="warnCnt" value='${blacklist.warnCnt}'>${blacklist.warnCnt}</div>
                            <div class="divTableCell"><input type='hidden' name="warnDate" value='${blacklist.warnDate}'>${blacklist.warnDate}</div>
                            <div class="divTableCell"><input type='hidden' name="userName" value='${blacklist.userName}'>${blacklist.userName}</div>
                            <div class="divTableCell"><input type='hidden' name="reason" value='${blacklist.reason}'>${blacklist.reason}</div>
                            <div class="divTableCell"><input type='hidden' name="userNum" value='${blacklist.userNum}'>${blacklist.userNum}</div>
                            <div class="divTableCell"><input type='hidden' name="ownerNum" value='${blacklist.ownerNum}'>${blacklist.ownerNum}</div>
                            <div class="divTableCell"><input class="blackButton" type='Submit' value='영구정지'></div></form>
                          </div>
                          </div>
                          
                         </c:forEach>
                           </div>
                        <!-- 페이징 시작 -->
                         <div class="pageing">		
							<c:if test="${paging.startPage != 1 }">
								<a href="/project1982/admin/adminPage.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
							</c:if>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<b>${p }</b>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<a href="/project1982/admin/adminPage.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage}">
								<a href="/project1982/admin/adminPage.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
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
<script>
    var ctx = document.getElementById('matching').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ['매칭 건수', '매칭 실패 건수'],
            datasets: [{
                label: '매칭' ,
                data: ['${matching}', '${wholeApply}'-'${matching}'],
                backgroundColor: [
                    'rgba(255, 99, 71)'
                 
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)'
                    
                ],
                borderWidth: 1
            }]
        },
        options: {
     	  responsive: false
        }
    });
  
    
    var ctx = document.getElementById('reuse').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ['최근 3개월 간 재이용자', '최근 3개월 간 단기 이용자'],
            datasets: [{
                label: '재이용률',
                data: ['${reusing}', '${whole_use}'-'${reusing}'],
                backgroundColor: [
                    'rgba(10,110,255, 0.8)'
                 
                ],
                borderColor: [
                    'rgba(10,110,255, 0.8)'
                    
                ],
                borderWidth: 1
            }]
        },
        options: {
     	  responsive: false
        }
    });
    
    
    
var ctx = document.getElementById('lineChart').getContext('2d');
    
    var now = new Date();
    var now_month = (now.getMonth() + 1).toString();
    var now_day = now.getDate().toString();
    var now_string = now_month +'월 '+now_day+'일';
    
    now.setDate(now.getDate() - 1);
    var now_month = (now.getMonth() + 1).toString();
    var now_day = now.getDate().toString();
    var now_string1 = now_month +'월 '+now_day+'일';
    
    now.setDate(now.getDate() - 1);
    var now_month = (now.getMonth() + 1).toString();
    var now_day = now.getDate().toString();
    var now_string2 = now_month +'월 '+now_day+'일';
    
    now.setDate(now.getDate() - 1);
    var now_month = (now.getMonth() + 1).toString();
    var now_day = now.getDate().toString();
    var now_string3 = now_month +'월 '+now_day+'일';
    
    now.setDate(now.getDate() - 1);
    var now_month = (now.getMonth() + 1).toString();
    var now_day = now.getDate().toString();
    var now_string4 = now_month +'월 '+now_day+'일';
    
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: [now_string4, now_string3, now_string2, now_string1, now_string],
            datasets: [{
                label: '방문자 추이',
                data: [ '${visitYesterday4}', '${visitYesterday3}', '${visitYesterday2}', '${visitYesterday1}', '${visitToday}'],
                backgroundColor: [
              	  'rgba(255, 117, 232, 1)'
                ],
                borderColor: [
              	  'rgba(255, 117, 232, 1)' 
                ],
                borderWidth: 1,
               fill: false
            }]
        },
        options: {
      	  maintainAspectRatio: false,
      	  cutoutPercentage: 50,
      	  responsive: true,
            scales: {
                xAxes: [{
                    display: true,
                    scaleLabel: {
                        display: true
                      
                    }
                }],
                yAxes: [{
                    display: true,
                    ticks: {
                        suggestedMin: 0,
                    },
                    scaleLabel: {
                        display: false,
                        labelString: '(명)'
                    }
                }]
            }
        }
    });
    
    
    
    
    
    var ctx = document.getElementById('barChart').getContext('2d');
    var myChart = new Chart(ctx, {
  	  type: 'bar',    
  	  data: {
            labels: [now_string4, now_string3, now_string2, now_string1, now_string],
            datasets: [{
          	  
                label: '회원가입자 수',
                data: ['${joinYesterday4}', '${joinYesterday3}', '${joinYesterday2}', '${joinYesterday1}', '${joinToday}'],
                backgroundColor: [
              	  'rgba(0, 204, 102)',
              	  'rgba(0, 204, 102)',
              	  'rgba(0, 204, 102)',
              	  'rgba(0, 204, 102)',
              	  'rgba(0, 204, 102)'
                ],
                borderColor: [
              	  'rgba(0, 204, 102)',
              	  'rgba(0, 204, 102)',
              	  'rgba(0, 204, 102)',
              	  'rgba(0, 204, 102)',
              	  'rgba(0, 204, 102)' 
                ],
                borderWidth: 1,
               fill: false
            } , {
            	type: 'line',
            	label: '회원가입자 수 누적',
            	data: ['${cumulYesterday4}', '${cumulYesterday3}', '${cumulYesterday2}', '${cumulYesterday1}', '${cumulToday}'], 
            	backgroundColor: [
            	  'rgba(76, 0, 153)'
              ],
              borderColor: [
              	'rgba(76, 0, 153)'
              ],
              borderWidth: 1,
             fill: false
            } ]
        },
        options: {
      	  maintainAspectRatio: false,
      	  cutoutPercentage: 50,
      	  responsive: true,
            scales: {
                xAxes: [{
                    display: true,
                    scaleLabel: {
                        display: true
                        
                    }
                }],
                yAxes: [{
                    display: true,
                    ticks: {
                        suggestedMin: 0,
                    },
                    scaleLabel: {
                        display: false,
                        labelString: '(명)'
                    }
                }]
            }
        }
    });
    </script>
</body>
</html>