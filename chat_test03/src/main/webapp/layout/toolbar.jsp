<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
function history(){
	popWin = window.open("/history.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
}
</script>
<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-inverse navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar 를 다양하게 사용하면.... -->
	             <ul class="nav navbar-nav">
	             <c:if test="${ !empty user }">
		              <!--  회원관리 DrowDown -->
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >회원관리</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">개인정보조회</a></li>
		                         
		                         <c:if test="${sessionScope.user.role == 'admin'}">
		                         	<li><a href="#">회원정보조회</a></li>
		                         </c:if>
		                         
		                         <li class="divider"></li>
		                         <li><a href="#">etc...</a></li>
		                     </ul>
		                 </li>
		                 
		              <!-- 판매상품관리 DrowDown  -->
		               <c:if test="${sessionScope.user.role == 'admin'}">
			              <li class="dropdown">
			                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
			                         <span >판매상품관리</span>
			                         <span class="caret"></span>
			                     </a>
			                     <ul class="dropdown-menu">
			                         <li><a href="#">판매상품등록</a></li>
			                         <li><a href="#">판매상품관리</a></li>
			                         <li class="divider"></li>
			                         <li><a href="#">etc..</a></li>
			                     </ul>
			                </li>
		                 </c:if>
		                 
		              <!-- 구매관리 DrowDown -->
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >상품구매</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">상 품 검 색</a></li>
		                         
		                         <c:if test="${sessionScope.user.role == 'user'}">
		                           <li><a href="#">구매이력조회</a></li>
		                         </c:if>
		                         
		                         <li><a href="javascript:history()">최근본상품</a></li>
		                         <li class="divider"></li>
		                         <li><a href="#">etc..</a></li>
		                     </ul>
		                 </li>
	                 </c:if>
	                 
	             </ul>
	             
	             <ul class="nav navbar-nav navbar-right">
	             	<c:if test="${ !empty user }">
	             		<li><a>${user.userName}님 환영합니다.</a></li>
	                	<li><a href="#">Sign out</a></li>
	             	</c:if>
	             	<c:if test="${ empty user }">
	             		<li><a href="#">Sign in</a></li>
	             		<li><a href="#">Sign up</a></li>
	             	</c:if>
	            </ul>
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
	
		//============= logout Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('Sign out')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 
		
		//============= 회원정보조회 Event  처리 =============	
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('회원정보조회')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		
		//=============  개인정보조회회 Event  처리 =============	
		 	$( "a:contains('개인정보조회')" ).on("click" , function() {
		 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
			});
		
		 	$( "a:contains('구매이력조회')" ).on("click" , function() {
		 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$(self.location).attr("href","/purchase/listPurchase");
			});
		 	
		 	$( "a:contains('상 품 검 색')" ).on("click" , function() {
		 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$(self.location).attr("href","/product/listProduct?menu=search");
			});
		 	
		 	$( "a:contains('판매상품관리')" ).on("click" , function() {
		 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$(self.location).attr("href","/product/listProduct?menu=manage");
			});
		 	
		 	$( "a:contains('판매상품등록')" ).on("click" , function() {
		 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$(self.location).attr("href","/product/addProduct");
			});
		 	$("a[href='#' ]:contains('Sign up')").on("click" , function() {
				self.location = "/user/addUser"
			});
		 	$("a[href='#' ]:contains('Sign in')").on("click" , function() {
				self.location = "/user/login"
			});
		 });
		
	</script>  