<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6229e7a2275e6c61112a0024bf9a0842&libraries=services,clusterer,drawing"></script>

<section>
	<div id="map-container">
		<div id="map" style="width:800px;height:400px;">
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
	<script>
		let infoList=[];
		let lat;
		let lng;
		
		let pos = navigator.geolocation.watchPosition(position=>{
			lat = position.coords.latitude;
			lng = position.coords.longitude;
		});

		$(()=>{
			let markers=[];
			
			var infowindow = new kakao.maps.InfoWindow({zIndex:1});
			
			let container = document.getElementById("map");
			let options = {
				center: new kakao.maps.LatLng(lat, lng),
				level: 3
			};
			
			

			let map = new kakao.maps.Map(container, options);
			
			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			//let mapTypeControl = new kakao.maps.MapTypeControl();

			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			//map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			let zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
			
			//지도 클릭이벤트 
			kakao.maps.event.addListener(map, "click", function(mouseEvent) {        
			    
			    // 클릭한 위도, 경도 정보를 가져옵니다 
			    let latlng = mouseEvent.latLng;
			    
			    console.log(lat, lng);
			    // 이동할 위도 경도 위치를 생성합니다 
			    let moveLatLon = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng());
			    
			    // 지도 중심을 부드럽게 이동시킵니다
			    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			    map.panTo(moveLatLon);        
			    
			});
			
			
			let ps = new kakao.maps.services.Places(); 
			
		 	$("#gymBtn").click(e=>{
				// 키워드로 장소를 검색합니다
				
				ps.keywordSearch("헬스장", placesSearchCB, {location:new kakao.maps.LatLng(map.getCenter().getLat(),map.getCenter().getLng()),radius:5000}); 
			}); 
		 	
		 //------------------------------------------
		 	
		 	$("#searchBtnBox>button").click(e=>{
		 		const keyword = $(e.target).val();
		 		ps.keywordSearch(keyword, placesSearchCB, {location:new kakao.maps.LatLng(map.getCenter().getLat(),map.getCenter().getLng()),radius:5000}); 
		 	});
		 	
		 	 //------------------------------------------ 	
		 	
		 	
		 	$("#goHomeBtn").click(e=>{
		 		console.log("clicke");
		 		console.log(lat,lng);
		 		 map.panTo(new kakao.maps.LatLng(lat,lng));  
		 	});
		 	
			
			function placesSearchCB (data, status, pagination) {
			    if (status === kakao.maps.services.Status.OK) {
                   
                    infoList = data;    // data list get
                   
                    for(let i=0; i<markers.length;i++){
						markers[i].setMap(null);
					}
			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        var bounds = new kakao.maps.LatLngBounds();

			        for (var i=0; i<data.length; i++) {
			            displayMarker(data[i]);    
			            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
			        }       

			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			        map.setBounds(bounds);
			    } 
			}
			
			function displayMarker(place) {
			    
			    // 마커를 생성하고 지도에 표시합니다
			    var marker = new kakao.maps.Marker({
			        map: map,
			        position: new kakao.maps.LatLng(place.y, place.x) 
			    });

			    // 마커에 클릭이벤트를 등록합니다
			    kakao.maps.event.addListener(marker, "click", function() {
			        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			        infowindow.setContent("<div style='padding:5px;font-size:12px;'>" + place.place_name +"/ "+place.phone+ "</div>");
			        infowindow.open(map, marker);
			    });
			    
			    markers.push(marker);
			}
			
			
		});
		
		
	 	
	</script>
</section>
<%@ include file="/views/common/footer.jsp" %>