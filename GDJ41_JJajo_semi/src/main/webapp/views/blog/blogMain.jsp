<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.db.main.model.vo.MainBoard" %>
<%@ include file="/views/common/header.jsp"%>
<%
	List<MainBoard> mbList = (List) request.getAttribute("mainBoardList");
%>



<!-- The Modal -->
<div class="modal fade" id="myModal">

<!-- Modal Header -->


	<div class="modal-dialog modal-xl modal-dialog-centered">
		<div class="modal-content" style="height:800px;">
		  	<!-- Modal header -->
			<div style="text-align: right;">
				<button type="button" class="btn-close" data-bs-dismiss="modal" style="margin:20px;"></button>
			</div>
	 
		      <!-- Modal body -->
	      	<div class="modal-body">
		        <div class="row">
		            <div class="col-6">
		                <div class="row">
	                    	<div class="col">
		                    
								                        <!-- Carousel -->
								<div id="demo" class="carousel slide" data-interval="false">
	 
								  		<!-- Indicators/dots -->
							  		<div class="carousel-indicators">
									    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
									    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
									    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
									</div>
								  
								  			<!-- The slideshow/carousel -->
									<div class="carousel-inner" style="height:500px;">
										<div class="carousel-item active" >
										  <img src="https://hddesktopwallpapers.in/wp-content/uploads/2015/09/picture-seal.jpg" alt="Los Angeles" class="d-block mx-auto">
										</div>
										<div class="carousel-item" style="height:500px">
										  <img src="https://images.pexels.com/photos/4588031/pexels-photo-4588031.jpeg" alt="Chicago" class="d-block mx-auto">
										</div>
										<div class="carousel-item">
										  <img src="https://hddesktopwallpapers.in/wp-content/uploads/2015/09/ocelot-picture.jpg" alt="New York" class="d-block mx-auto">
									 	</div>
	 								</div>
									  
									<!-- Left and right controls/icons -->
									<button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
									  <span class="carousel-control-prev-icon"></span>
									</button>
									<button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
									  <span class="carousel-control-next-icon"></span>
									</button>
								</div>
							</div>
	        		 	</div>
						<div class="row">
		                	<div class="col">
		                        title
		                    </div>
		                    <div class="col">
		                        like btn
		                    </div>
						</div>
		                <div class="row">
		                    <div class="col">
		                        #tags
		                    </div>
		                </div>
		            </div>
		            <div class="col-6">
	                	<div class="row">
	                		<div class="col">
	                			<div class="row" style="text-align:left;">
									<div class="col-sm-auto" style="float:left;">
										<img class="rounded-circle" style="height: 80px; width: 80px; object-fit: cover;" src="https://images.pexels.com/photos/4588031/pexels-photo-4588031.jpeg" alt="프로필사진">	
									</div>
									<div class="col-md" style="margin:auto">
										<p>user_name</p>
									</div>
			                    	<div class="col-sm" style="text-align:right;">
										<div class="btn-group">
										  <button type="button" class="btn btn-outline-dark btn-sm">Edit</button>
										  <button type="button" class="btn btn-outline-dark btn-sm">Delete</button>
										</div> 
				                    </div>
								</div>
		                	</div>
	                		<div class="row">
			                    <div class="col">
			                        description
			                    </div>
			                </div>
	                		<div class="row">
			                    <div class="col">
			                        comment feed
			                        comment feed
			                        comment feed
			                    </div>
	                		</div>
		               		<div class="row">
			                    <div class="col">
		                        comment input
		                    	</div>
			                    <div class="col">
			                        <buttontype="button"class="btn">Send</button>
			                    </div>
			                </div>
			            </div>
					</div>
				</div>
			</div>	 
		</div>
	</div>
</div>






<section class="center">
	<div class="container">
		<div class="row">
			<div class="col-6" style="text-align: right;">
				<img class="rounded-circle" style="height: 200px; width: 200px; object-fit: cover;" src="https://images.pexels.com/photos/4588031/pexels-photo-4588031.jpeg" alt="프로필사진">		
			</div>
			<div class="col-6">
				<div class="row row-cols-auto">
					<div class="col-md-auto">
						<h2>user_name</h2>
					</div>
					<div class="col-md-auto">
						<img src="<%=request.getContextPath()%>/images/blog/pencil.png"  width="30px" height="30px"
						 onclick="location.assign('<%=request.getContextPath()%>/blog/modifymyinfo.do')">
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
 <%if(mbList!=null&&mbList.isEmpty()){ %>
		<tr>
			<td colspan="5">등록된 게시물이 없습니다.</td>
		</tr>
	<%}else{ 
		for(MainBoard mb : mbList){%>  
				
	<div class="main">	
		<!-- Portfolio Gallery Grid -->	
 		<div class="row">
 		
		  <div class="column">
		    <div class="content">
		      <img src="https://hddesktopwallpapers.in/wp-content/uploads/2015/09/picture-seal.jpg" alt="1" style="width:100%">
		      <h3><%=mb.getBoardTitle() %></h3>
		      <p class="tag">#해쉬태그</p>
		      <p><%=mb.getBoardContent() %></p>
		    </div>
		  </div>
		  
<!--  		  <div class="column">
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
		  </div> -->
		  
		  
		</div>
	</div>
	
 	<%}
		 }%> 
		 
</section>






<div class="container mt-3">
  <h3>Fading Modal Example</h3>
  <p>Click on the button to open the modal.</p>
  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
  	Open modal
  </button>
</div>
 

 
 






<script>
	$("#target").click(e=>{
		$("input[name=upFile]").click();
	})
	
	


</script>

<%@ include file="/views/common/footer.jsp"%>