<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6229e7a2275e6c61112a0024bf9a0842&libraries=services,clusterer,drawing"></script>

<section class="container">
	<div class="row">
		
		<div class="col-xl-12">
			
				<div id="map-container" >
					<div id="map" style="width:100%;height:400px;" class="mx-auto">
						<div style="position:absolute; z-index:10;">
							<div id="searchBtnBox" class="btn-group" >
							<!-- onclick="clickSearchBtn(this.value);"  -->
								<button  type="button" class="btn btn-primary" value="휘트니스">휘트니스</button>
								<button  type="button" class="btn btn-primary" value="요가">요가</button>
								<button  type="button" class="btn btn-primary" value="필라테스">필라테스</button>
								<button  type="button" class="btn btn-primary" value="공원">공원</button>
							</div>
							<br>
							<div>
								<button id="goHomeBtn" class="btn btn-primary">내위치로</button>			
							</div>
							
						</div>
					</div>
				</div>
				<div id ="boxContainer"style="display:none">
					<a href="#" class="list-group-item" >
						<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1">상호명</h5>
							<small>전화번호</small>
						</div>
						<div class="d-flex justify-content-between">
							<p class="mb-1">주소 </p>
							<span>거리</span>
						</div>
					</a>
				</div>
				<div id="listRoot" class="list-group list-group-flush" style="height: 300px; overflow: auto">			
			</div>
		</div>
		

	</div>
	<script src="<%=request.getContextPath() %>/js/searchPosition.js"></script>
</section>
<%@ include file="/views/common/footer.jsp" %>