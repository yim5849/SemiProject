<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>


<section class="container-fluid">
	<div class="row">
		<div class="col-xl-1"></div>
		<div class="col-xl-10">
			
			<div id="map-container" >
				<div id="map" style="width:100%;height:400px;" class="mx-auto">
					<div class="" style="position:absolute; z-index:10; ">
						<div id="searchBtnBox" class="btn-group-vertical" >
							<button  type="button" class="btn btn-primary" value="휘트니스">휘트니스</button>
							<button  type="button" class="btn btn-primary" value="요가">요가</button>
							<button  type="button" class="btn btn-primary" value="필라테스">필라테스</button>
							<button  type="button" class="btn btn-primary" value="공원">공원</button>
						</div>
						<div>
							<button id="goHomeBtn" class="btn btn-warning">내위치로</button>
							<select id="selectRadius" class="form-select" >
								<option value="5">5KM</option>
								<option value="10">10KM</option>
							</select>		
							<!-- <a href="javascript:fn_explainPopover();"><img src="<%=request.getContextPath() %>/images/info.png" width="24px" height="24px"></a>	 -->
							
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
						<div class="d-flex justify-content-between" >
							<p class="mb-1">주소 </p>
							<span>거리</span>
						</div>
					</a>
				</div>
				
			</div>
		<div class="col-xl-1"></div>	
			
	</div>
	<div class="row">
		<div class="col-xl-1"></div>
		<div class="col-xl-10">
			<span>    *검색반경 : 5(기본) , 10 km</span>
		</div>
		<div class="col-xl-1"></div>
	</div>
	<div class="row">
		<div class="col-xl-1"></div>
		<div class="col-xl-10">
			<div id="listRoot" class="list-group list-group-flush" style="height: 300px; overflow: auto">			
			</div>
		</div>
		<div class="col-xl-1"></div>
	</div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6229e7a2275e6c61112a0024bf9a0842&libraries=services,clusterer,drawing"></script>
		<script src="<%=request.getContextPath() %>/js/searchPosition.js"></script>
</section>
<%@ include file="/views/common/footer.jsp" %>