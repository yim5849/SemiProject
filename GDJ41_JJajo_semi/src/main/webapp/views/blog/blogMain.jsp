<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<section class="center">
	<div class="container">
		<div class="row">
			<div class="col-6" style="text-align: right;">
				<img class="rounded-circle" style="height: 200px; width: 200px; object-fit: cover;" src="https://images.pexels.com/photos/4588031/pexels-photo-4588031.jpeg" alt="프로필사진">		
			</div>
			<div class="col-6">
				<div class="row">
					<div class="col">
						<h2>user_name</h2>
					</div>
					<div class="col">
						<button type="button" class="btn btn-primary" onclick="location.assign('<%=request.getContextPath()%>/blog/modifymyinfo.do')">자기소개수정</button>
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						게시물
					</div>
					<div class="col-4">
						팔로워
					</div>
					<div class="col-4">
						팔로잉
					</div>
				</div>
				<div class="row">
					<div class="col">
						자기소개
					</div>
				</div>	
			</div>
		</div>
	</div>
</section>
<section>
	<div class="main" id="move_upload_btn">
		<button type="button" class="btn btn-primary"  onclick="location.assign('<%=request.getContextPath()%>/blog/uploadpost.do')">게시물등록</button>
		<hr class="line_break">
	</div>
</section>


<section>
	<div class="main">
	<!-- Portfolio Gallery Grid -->
	
	<div class="row">
	  <div class="column">
	    <div class="content">
	      <img src="https://hddesktopwallpapers.in/wp-content/uploads/2015/09/picture-seal.jpg" alt="1" style="width:100%">
	      <h3>title</h3>
	      <p class="tag">#해쉬태그</p>
	      <p>Lorem ipsum dolor sit amet, tempor prodesset eos no. Temporibus necessitatibus sea ei, at tantas oporteat nam. Lorem ipsum dolor sit amet, tempor prodesset eos no
	      만약 내가 더 길게쓰면 박스를 넘어가나요.</p>
	    </div>
	  </div>
	  <div class="column">
	    <div class="content">
	    <img src="https://hddesktopwallpapers.in/wp-content/uploads/2015/09/ocelot-picture.jpg" alt="2" style="width:100%">
	      <h3>title</h3>
	      <p class="tag">#해쉬태그</p>
	      <p>Lorem ipsum dolor sit amet, tempor prodesset eos no. Temporibus necessitatibus sea ei, at tantas oporteat nam. Lorem ipsum dolor sit amet, tempor prodesset eos no.</p>
	    </div>
	  </div>
	  <div class="column">
	    <div class="content">
	    <img src="https://hddesktopwallpapers.in/wp-content/uploads/2015/09/goat-picture.jpg" alt="3" style="width:100%">
	      <h3>title</h3>
	      <p class="tag">#해쉬태그</p>
	      <p>Lorem ipsum dolor sit amet, tempor prodesset eos no. Temporibus necessitatibus sea ei, at tantas oporteat nam. Lorem ipsum dolor sit amet, tempor prodesset eos no.</p>
	    </div>
	  </div>
	  <div class="column">
	    <div class="content">
	    <img src="https://hddesktopwallpapers.in/wp-content/uploads/2015/09/lynx-picture.jpg" alt="4" style="width:100%">
	      <h3>title</h3>
	      <p class="tag">#해쉬태그</p>
	      <p>Lorem ipsum dolor sit amet, tempor prodesset eos no. Temporibus necessitatibus sea ei, at tantas oporteat nam. Lorem ipsum dolor sit amet, tempor prodesset eos no.</p>
	    </div>
	  </div>
	</div>
	</div>
</section>
<%@ include file="/views/common/footer.jsp"%>