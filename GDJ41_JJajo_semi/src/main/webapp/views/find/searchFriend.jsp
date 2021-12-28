<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%
	String memberNo = (String)request.getAttribute("memberNo");
%>
<section class="container-fluid">
    <div class="row">
        <div class="col-xl-1"></div>
        <div class="col-xl-3">
        	<div id="friendInfoContainer">
        		 <div class="bg-white" style="width:100%; height: 500px;">
				    <img class="" src="" alt="Card image" style="width:100%; height: 200px;">
				    <div class="">
				      	<h4 class="">John Doe</h4>
                        <small>age/gender</small>
				      	<p class="">Some example text some example text. John Doe is an architect and engineer</p>
				      
				    </div>
                 </div>
        	</div>        
        </div>
        <div class="col-xl-7">
            <div class="row">
                <div class="col-xl-12">
                    <div id="mapContainer" style="width: 100%; height:300px">
                        
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12">
                    <h4>친구목록</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12">
                    <div id="friendListContainer" class="list-group list-group-flush" style="height:250px; overflow: auto">
                        <div class="list-group-item ">
                            <div class="d-flex">
                                <h5>이름</h5>
                                <small style="margin-left: 50px;">성별/나이</small>
                            </div>
                            <div class="d-flex justify-content-between">
                                <span class="d-inline-block text-truncate" style="max-width: 200px;">자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개 </span>
                                <span>거리</span>
                            </div>
                        </div>
                 
                    </div>
                </div>
            </div>
           
            
        </div>
        <div class="col-xl-1"></div>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6229e7a2275e6c61112a0024bf9a0842&libraries=services,clusterer,drawing"></script>
	<script>
        let infoList;
        let lat;
        let lng;

        let pos = navigator.geolocation.watchPosition(position=>{
            lat = position.coords.latitude;
            lng = position.coords.longitude;
        });


        $(()=>{
            $.ajax({
                url:"<%=request.getContextPath()%>/find/findFriendsList.do",
                data:{memberNo:"<%=memberNo%>"},
                success:(data)=>{
                    console.log(data);
                    markerSetting(data);
                    scrollSetting(data);
                }
            });

            let options = {
                center: new kakao.maps.LatLng(lat, lng),
                level: 3
            };
            
            let container = document.getElementById("mapContainer");
            
            let map = new kakao.maps.Map(container, options);
            

            //주소-좌표 변환 객체 

            function markerSetting(list){
                list.forEach(e=>{

                    let geocoder = new kakao.maps.services.Geocoder();
                    
                    geocoder.addressSearch(e['address'], (result, status)=>{
                        if(status===kakao.maps.services.Status.OK){
                            
                            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                            
                            var marker = new kakao.maps.Marker({
                                map: map,
                                position: coords
                            });
                            
                            var infowindow = new kakao.maps.InfoWindow({
                                content: '<div style="width:150px;text-align:center;padding:6px 0;">'+e['memberName']+'</div>'
                            });
                            infowindow.open(map, marker);
                            
                            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                            map.setCenter(coords);
                        }
                    } );
                    
                })
                
            }

         

            console.log("뭐지");
            
            map.relayout();

        })

        function scrollSetting(list){
            if(!list) return;

            list.forEach(element => {
                let box = $("<div>").addClass("list-group-item");
                
                let div1=$("<div>").addClass("d-flex");
                let name = $("<h4>").addClass("").html(element['memberName']);
                let gender =$("<small>").html(element["gender"]+"/"+element["birthday"]);
                div1.append(name).append(gender);

                let div2=$("<div>").addClass("d-flex justify-content-between");
                let intro=$("<span>").addClass("d-inline-block text-truncate").css({"max-width":"200px"}).html(element[""]);
                let dis = $("<span>").html("거리");
               
                div2.append(intro).append(dis);

                box.append(div1).append(div2);
                $("#friendListContainer").append(box);
            });
        }






    </script>
</section>
<%@ include file="/views/common/footer.jsp" %>