<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6229e7a2275e6c61112a0024bf9a0842&libraries=services,clusterer,drawing"></script>

<section class="container">
    <div class="row">
        <div class="col-xl-4">
        	<div id="friendInfoContainer">
        		 <div class="card" style="width:100%">
				    <img class="card-img-top" src="https://www.w3schools.com/bootstrap4/img_avatar1.png" alt="Card image" style="width:100%">
				    <div class="card-body">
				      	<h4 class="card-title">John Doe</h4>
                        <small>age/gender</small>
				      	<p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
				      	<a href="#" class="btn btn-primary">See Profile</a>
				    </div>
                 </div>
        	</div>        
        </div>
        <div class="col-xl-8">
            <div id="mapContainer">
                <div style="width: 100%; height: 300px; border:1px solid red">맵자리</div>
            </div>
            <div id="friendListContainer" class="list-group list-group-flush" style="height:250px; overflow: auto">
                <a href="#" class="list-group-item" >
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1">이름</h5>
                        <small>성별</small>
                    </div>
                    <div class="d-flex justify-content-between">
                        <p class="mb-1">.... </p>
                        <span>거리</span>
                        <button type="button" class="btn btn-primary">채팅하기</button>
                    </div>
                </a>
                <a href="#" class="list-group-item" >
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1">이름</h5>
                        <small>성별</small>
                    </div>
                    <div class="d-flex justify-content-between">
                        <p class="mb-1">.... </p>
                        <span>거리</span>
                        <button type="button" class="btn btn-primary">채팅하기</button>
                    </div>
                </a>
                <a href="#" class="list-group-item" >
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1">이름</h5>
                        <small>성별</small>
                    </div>
                    <div class="d-flex justify-content-between">
                        <p class="mb-1">.... </p>
                        <span>거리</span>
                        <button type="button" class="btn btn-primary">채팅하기</button>
                    </div>
                </a>
                <a href="#" class="list-group-item" >
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1">이름</h5>
                        <small>성별</small>
                    </div>
                    <div class="d-flex justify-content-between">
                        <p class="mb-1">.... </p>
                        <span>거리</span>
                        <button type="button" class="btn btn-primary">채팅하기</button>
                    </div>
                </a>
            </div>
            
            
        </div>
    </div>
	<script src="<%=request.getContextPath() %>/js/searchFriend.js"></script>
</section>
<%@ include file="/views/common/footer.jsp" %>