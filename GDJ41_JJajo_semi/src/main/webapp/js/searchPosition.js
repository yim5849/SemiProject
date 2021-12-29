

let infoList=[];
let lat;
let lng;

let pos = navigator.geolocation.watchPosition(position=>{
    lat = position.coords.latitude;
    lng = position.coords.longitude;
});


$(()=>{
    //$("#boxContainer>a").css({display:"none"});

		// 마커가 표시될 위치입니다 

	
	// 마커가 지도 위에 표시되도록 설정합니다
	



    let markers=[];
    
    var infowindow = new kakao.maps.InfoWindow({zIndex:1});
    
    let container = document.getElementById("map");
    let options = {
        center: new kakao.maps.LatLng(lat, lng),
        level: 3
    };
    
    

    let map = new kakao.maps.Map(container, options);
    
    map.relayout();

    // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
    //let mapTypeControl = new kakao.maps.MapTypeControl();

    // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
    // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
    //map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
    let zoomControl = new kakao.maps.ZoomControl();
    map.addControl(zoomControl, kakao.maps.ControlPosition.BOTTOMRIGHT);
    
    
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
         let selectedRadius = $("#selectRadius").val();
         console.log("반경 ",selectedRadius);
         ps.keywordSearch(keyword, placesSearchCB, {location:new kakao.maps.LatLng(map.getCenter().getLat(),map.getCenter().getLng()),radius:selectedRadius*1000}); 
     });
     
      //------------------------------------------ 	
     
     
     $("#goHomeBtn").click(e=>{
        console.log("clicke");
        console.log(lat,lng);
        map.setLevel(3);
        map.panTo(new kakao.maps.LatLng(lat,lng));  
        console.log(map.getLevel());
     });
     
    
    function placesSearchCB (data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
           
            infoList = data;    // data list get
            console.log(data.length);

          



           
            for(let i=0; i<markers.length;i++){
                markers[i].setMap(null);
            }
            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            var bounds = new kakao.maps.LatLngBounds();
            $("#listRoot").empty();
            for (var i=0; i<data.length; i++) {
                displayMarker(data[i]);    
                bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
               
                setInfoList(data[i]);
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
    

    const setInfoList = (data)=>{
       
        console.log("set ");
        const infoBox = $("#boxContainer>a").clone();
        console.log(infoBox);
        //$(infoBox).css({display:"block"});
        $(infoBox).children().first().find("h5").css("font-weight","bolder").html(data.place_name);
        $(infoBox).find("p").html(data.road_address_name);
        $(infoBox).children().first().find("small").html(data.phone);

        $(infoBox).click(e=>{
            window.open("https://map.kakao.com/link/map/"+data.id);
        });
        
        let ployLine = new kakao.maps.Polyline({
                                map:map, 
                                path:[new kakao.maps.LatLng(map.getCenter().getLat(),map.getCenter().getLng()),new kakao.maps.LatLng(data.y,data.x)],
                                strokeWeight: 3, // 선의 두께입니다 
                                strokeColor: '#db4040', // 선의 색깔입니다
                                strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
                                strokeStyle: 'solid' // 선의 스타일입니다
                            
                            });
        
        $(infoBox).find("span").addClass("badge bg-info").css("height","24px").html(calDistance(ployLine.getLength()));
        ployLine.setMap(null);   //거리계산 라인 삭제 



        $("#listRoot").append(infoBox);
    
    };

    function calDistance(meter){
        if(!meter) return 0+" m";

        let dis = Math.round(meter);
        if(dis>=1000){
            let km = dis/1000;
            return km.toFixed(1)+" Km";
        }else{
            return dis+" m";
        }
    }



    map.relayout();

   
    

});



 