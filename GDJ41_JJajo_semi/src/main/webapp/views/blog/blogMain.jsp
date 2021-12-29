<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.db.main.model.vo.MainBoard" %>
<%@ include file="/views/common/header.jsp"%>
<%
	List<MainBoard> ubList=(List)request.getAttribute("userBoardList");
	List<String> allTags = (List)request.getAttribute("allTags");
	String myInfo=(String)request.getAttribute("myInfo");
%>

<style>



</style>

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
							  	<%-- 	<div class="carousel-indicators">
									  	<%for(int i=1;i<ubList;i++) {%>	
										    <button type="button" data-bs-target="#demo" data-bs-slide-to="<%=i %>" class="active"></button>
										<%} %>	
									</div> --%>
								  
								  			<!-- The slideshow/carousel -->
									<div class="carousel-inner" style="height:500px;">
										
									
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
		                	<div class="col" id="modal_board_title">
		                        title
		                    </div>
		                    <div class="col">
		                        like btn
		                    </div>
						</div>
		                <div class="row">
		                    <div class="col" id="modal_board_tag">
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
									<div class="col-md" style="margin:auto" id="modal_board_userName">
										<p>user_name</p>
									</div>
			                    	<div class="col-sm" style="text-align:right;">
										<div class="btn-group">
										  <button type="button" class="btn btn-outline-dark btn-sm" >Edit</button>
										  <button type="button" id="board_del_btn" class="btn btn-outline-dark btn-sm" data-deno="" data-bs-toggle="modal" data-bs-target="#blog_delete_check" >Delete</button>
										</div>
									</div> 
			                    	</div>
								</div>
		                	</div>
	                		<div class="row">
			                    <div class="col" id="modal_board_content">
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
			                        <button type="button" class="btn">Send</button>
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
						<h2><%=loginMember.getMemberName()%></h2>
					</div>
					<div class="col-md-auto">
						<img src="<%=request.getContextPath()%>/images/blog/pencil.png"  width="30px" height="30px"
						 onclick="location.assign('<%=request.getContextPath()%>/blog/modifymyinfo.do')">
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<p>게시물 <%=ubList.size() %></p>
					</div>
				<!-- 	<div class="col-4">
						팔로워
					</div>
					<div class="col-4">
						팔로잉
					</div> -->
				</div>
				<div class="row">
					<div class="col">
						<h2><%=myInfo %></h2>
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
		  <%
		  if(ubList!=null&&!(ubList.isEmpty())){ 
		  	for(MainBoard mb : ubList){   %>		
			   <div class="column">
			    <div class="content" id="board_click_modal" data-bs-toggle="modal" data-bs-target="#myModal" 
			    data-username="<%=mb.getMemberName() %>"
			    data-title="<%=mb.getBoardTitle() %>" 
			    data-content="<%=mb.getBoardContent() %>" 
			   <%--  data-tag="<%=mb.getTag() %>" --%>
			    data-boardno="<%=mb.getBoardNo()%>">
			    
					<img alt="사진" style="width:100%" 
					src="<%=request.getContextPath()%>/upload/blog/
					<%=mb.getAttachedFileList().isEmpty()?"default.png":mb.getAttachedFileList().get(0).getImgName()%>">
					<h3><%=mb.getBoardTitle() %></h3>
					
					<%if(mb.getTag()!=null&&!(mb.getTag().isEmpty())){ 
					for(String s:mb.getTag()){ %>
					<h3><%=s %></h3>
					<%}
		 			 }else{ System.out.println("tagList is empty");
		 			 }%>
					<%-- <p class="tag"><%=mb.getTag() %></p> --%>
					<p><%=mb.getBoardContent() %></p>
			    </div>
			  </div> 
			<%}
		 		}else{ %>
				<div>
					<p>등록된 게시물이 없습니다.</p>
				</div>
				 <%
			 	}%>
		  
  		
		  
		</div>
		
		
	</div>
	

	
	



<!-- Modal -->
<div class="modal fade" id="blog_delete_check" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">게시글 삭제 확인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       	게시글을 삭제하시겠습니까?
       	<form id="deleteBoardFrm" name="delete_form" action="<%=request.getContextPath() %>/blog/postdelete.do">
			<input type="hidden" id="delete_post" name="delete_post" >
			<input type="hidden" id="delete_post" name="delete_post_userNo" value="<%=loginMember.getMemberNo()%>" >			
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" onclick="$('#deleteBoardFrm').submit()">삭제</button>
      </div>
    </div>
  </div>
</div>	
	
	
	
	
		 
</section>










<!-- <div class="container mt-3">

  <h3>Fading Modal Example</h3>
  <p>Click on the button to open the modal.</p>
  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
  	Open modal
  </button>

</div>  -->
 





 
 






<script>
	$("#target").click(e=>{
		$("input[name=upFile]").click();
	})
	

 	//게시물 클릭시 해당 모달 보여줌
	$(document).on("click","#board_click_modal", function(){
		let imageList;
		//new Promise(resolve=>{
			<%-- $.get("<%=request.getContextPath()%>/주소",data=>{
				imageList=data;
				resolve(data);
			}); --%>
		//}).then(d=>{
			
			let boardNo=$(this).data('boardno');
			console.log(boardNo);
			$.ajax({
				async:false,
				url:"<%=request.getContextPath()%>/blog/blogImgList.do",
				data:{"boardNo":boardNo},
				success:data=>{
					$("div.carousel-inner").html("");
					data.forEach((v,i)=>{
						let div=i==0?$("<div>").addClass("carousel-item active"):$("<div>").addClass("carousel-item");
						let img=$("<img>").addClass("d-block mx-auto").attr({
								"alt":(i+1),
								"src":"<%=request.getContextPath()%>/upload/blog/"+v['imgName']
								});
						div.append(img);
						$("div.carousel-inner").append(div);
					})
				},
			});
			let userName=$(this).data('username');
			let title=$(this).data('title');
			let content=$(this).data('content');
			let tag=$(this).data('tag');
			
			
			//for(let i=0;i<)
			let image=$(this).data('image'); //리스트
			console.log(image);
			console.log($(this).data('tag'));
			console.log($(this).data('title'));
			
		
			
			$("#modal_board_userName").text(userName);
			$("#modal_board_title").text(title);
			$("#modal_board_content").text(content);
			$("#modal_board_tag").text(tag);
			<%-- $(".carousel-inner").attr('src','<%=request.getContextPath()%>/upload/blog/image.get(0).getAttachedFileList()'); --%>
			
			
			// 삭제 모달로 데이터 넘기기
			let bono=$(this).data('boardno');
			console.log(bono);
			
			// 우선 게시글을 클릭했을때 그 게시글의 삭제 버튼에 데이터- 속성을 사용하여 값을 저장한다 => 즉, 삭제버튼마다 그 게시글의 고유의 넘버값이 저장된다 
			$("#board_del_btn").data('deno',bono);
	}); 
	
		
		
	$(document).on("click","#board_del_btn", function(){	
		
		// 삭제 버튼을 클릭했을 때 그 삭제 버튼에 저장되어 있는 고유의 보드 넘버값을 삭제여부확인 모달안에 있는 인풋 벨류값으로 넘긴다 
		let bonum = $(this).data('deno');
		
		console.log('나의 넘버는 : '+bonum);
		
		$('#delete_post').val(bonum);
		
		
		
	}); 

	
	<%-- 
	//게시물 클릭시 해당 모달 보여줌
	$(document).on("click","#board_click_modal",function(){
		
		
		let userName=$(this).data('userName');
		let title=$(this).data('title');
		let content=$(this).data('content');
		/* let tag=$(this).data('tag'); */
		for(let i=0;i<)
		let image=$(this).data('image'); //리스트
		console.log(image);
	/* 	console.log($(this).data('tag')); */
		console.log($(this).data('title'));
		
		console.log('<%=request.getContextPath()%>/upload/blog/'+image.get(0).getImageName());
		
		$("#modal_board_userName").text(userName);
		$("#modal_board_title").text(title);
		$("#modal_board_content").text(content);
		/* $("#modal_board_tag").text(tag); */
		$(".carousel-inner").attr('src','<%=request.getContextPath()%>/upload/blog/image.get(0).getAttachedFileList()');
		
	}); --%>

	
	
	
	
	


</script>

<%@ include file="/views/common/footer.jsp"%>