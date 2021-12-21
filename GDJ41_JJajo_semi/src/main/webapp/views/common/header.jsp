<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<%@ page import="com.jj.member.model.vo.Member" %>
    
<%
	Member loginMember = (Member)session.getAttribute("loginMember");


%>   
   
    
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

	 <script>
      var myModal = document.getElementById('myModal');
      var myInput = document.getElementById('myInput');
        
      if(myModal!=null && myInput!=null){
        myModal.addEventListener('shown.bs.modal', function () {
        myInput.focus();
        })
      } 
    </script>

	

	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<title>Hello, MVC 프로젝트!</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/challengers.css">
	</head>
	<body>
	
	<header>
	
	<br>
      <!------------------------------------------------ 최상단 타이틀 --------------------------------------------->
      <div class="container" id="container-head">
        <div class="row">
          <div class="col" id="header-side">

          </div>
          <div class="col" id="header-middle-side">

          </div>
          <div class="col" id="header-title">
            GOODEE HEALTH
          </div>
          <div class="col" id="header-middle-side">

          </div>
          <div class="col" id="header-side">
            
          </div>
        </div>
      </div>
      <br>
      <br>

  
      <!------------------------------------------------ 메뉴 및 로그인바 --------------------------------------------->
      <div class="container">
      <%if(loginMember==null){ %>
        <form id="loginForm"  name="loginSubmit" action="<%=request.getContextPath() %>/login.do" method="post">
        <div class="row">
          <div class="col-6" >
            <ul class="nav nav-pills">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link disabled" href="#">MY-BLOG</a>
              </li>
              <li class="nav-item">
                <a class="nav-link disabled" href="#">헬스장찾기</a>
              </li>
              <li class="nav-item">
                <a class="nav-link disabled">주변친구찾기</a>
              </li>
              <li class="nav-item">
                <a class="nav-link disabled">Challengers</a>
              </li>
              <li class="nav-item">
                <a class="nav-link disabled">중고거래</a>
              </li>
            </ul>
          </div>
      
          <div class="col">
            <input type="text" class="form-control" placeholder="아이디" name="memberId">
          </div>

          <div class="col" style="padding-left:0px">
            <input type="password" class="form-control" placeholder="비밀번호" name="memberPwd">
          </div>

          <div class="col-1">
            <button type="button" class="btn btn-outline-warning" onclick="loginDo()">로그인</button>
          </div>
      
        </div>
      </form>
      
      <%}else{ %>
      
        <div class="row" >
          <div class="col-6" style="padding-top:15px">
            <ul class="nav nav-pills">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/blog/blogmain.do">MY-BLOG</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/find/findPosition.do">헬스장찾기</a>
              </li>
              <li class="nav-item">
                <a class="nav-link">주변친구찾기</a>
              </li>
              <li class="nav-item">
                <a class="nav-link"  href="<%=request.getContextPath()%>/challengers/main.do">Challengers</a>
              </li>
              <li class="nav-item">
                <a class="nav-link">중고거래</a>
              </li>
            </ul>
          </div>
          
          	<div class="col-1" >

     		</div>
     		
     		<div class="col-1"  style="text-align:center; ">
     			     <img class="home_avatar" src="https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/sbsnoriter/20210525064846663ctyu.jpg"/> 
     		</div>
     		
     		<div class="col-2"  style="padding-top:20px; padding-left:0px; padding-right:0px">
     			<span style="color:#01DFA5">HELLO. <%=loginMember.getMemberName()%>님</span> 
     			    
     		</div>
     		
     		<div class="col"  style="padding-left:0px; padding-right:0px; padding-top:12px ">
	     		<button type="button" class="btn btn-outline-success">내정보 보기</button>
	     		<button type="button" class="btn btn-outline-danger">로그아웃</button>
     		</div>
     		
 
          
        </div>
      
      <%} %>
      
      </div>
      
      
	

      <!------------------------------------------------ 회원가입 및 아이디 비밀번호 찾기 바 --------------------------------------------->
	<%if(loginMember==null){ %>
      <div class="container">
        <div class="row">
          <div class="col-2" style="padding-top:7px; color:#FA5882;" id="banbok" >
			※ 로그인 후, 이용해주세요 ※
          </div>
         <div class="col-4" >
		
          </div>
          <div class="col-6">
              <button type="button" class="btn btn-outline-success" > 회원가입 </button>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <button type="button" class="btn btn-outline-success">ID / PW 찾기</button>
              &nbsp;
              <input type="checkbox" class="btn-check" id="btn-check-outlined" autocomplete="off">
              <label class="btn btn-outline-primary" for="btn-check-outlined">아이디 저장</label>
            </div>
        </div>
      </div>
	<%} %>

    <!------------------------------------------------ 헤더부분과 섹션부분 구분선--------------------------------------------->
    <div class="container">   
      <p class="placeholder-glow">
        <span class="placeholder col-12 placeholder-xs bg-info"></span>
      </p>
    </div>
	
	
	
</header>