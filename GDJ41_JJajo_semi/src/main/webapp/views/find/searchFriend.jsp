<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%
	String memberNo = (String)request.getAttribute("memberNo");
%>
<section class="container-fluid">
    <div class="row" style="height:80vh">
        <div class="col-1"></div>
        <div class="col-3" style="height: 100%;">
        	<div id="friendInfoContainer"  style= "width:100%; height: 100%;">
        		 <div class="bg-white" style="width:100%; height: 100%;">
				    <img id="friendImg" src="<%=request.getContextPath()%>/images/blankimg.png" alt="Card image" style="width:100%; height: 200px">
				    <div style="padding: 10px 10px;">
				      	<h4 id="friendName">이름</h4>
                        <small id="friendGender">성별 / 나이</small>
				      	<p id="friendIntro">
                            Some example text some example text. John Doe is an architect and engineer
                            Some example text some example text. John Doe is an architect and engineer
                            Some example text some example text. John Doe is an architect and engineer
                        </p>
				      
				    </div>
                 </div>
        	</div>        
        </div>
        <div class="col-7" style="height: 80vh;">
            <div class="row" style="height: 45%;">
                <div class="col-12" style="height: 100%;">
                    <div id="mapContainer" style="width: 100%; height:100%">
                        
                    </div>
                </div>
            </div>
            <div class="row" style="height: 10%;">
                <div class="col-12" >
                    <h4 id="friendTitle">친구목록</h2>
                </div>
            </div>
            <div class="row" style="height: 45%;">
                <div class="col-12" style="height: 100%;">
                    <div id="friendListContainer" class="list-group list-group-flush" style="height:100%; overflow: auto">
                    </div>
                </div>
            </div>
           
            
        </div>
        <div class="col-1"></div>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6229e7a2275e6c61112a0024bf9a0842&libraries=services,clusterer,drawing"></script>
	<script>
      
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
                    setIntroBox(data[0]);
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
                                content: '<div style="width:150px;text-align:center;padding:6px 0;">'+e['memberId']+'</div>'
                            });
                            infowindow.open(map, marker);
                            
                            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                            map.setCenter(coords);
                        }
                    } );
                    
                })
                
            }

         

            console.log("뭐지");
            
            $("#friendTitle").click(e=>{
                console.log("클릭");
                map.relayout();
            });
           

          
             
            
            
        })


      

        function scrollSetting(list){
            if(!list) return;

            list.forEach(element => {
                let box = $("<div>").addClass("list-group-item");
                let memberNoHidden = $('<input type="hidden">').val(element["memberNo"]);
                box.append(memberNoHidden);

                let div1=$("<div>").addClass("d-flex justify-content-between");
                
                let d1=$("<div>").addClass("d-flex");
                
                
                let name = $("<h4>").addClass("").html(element['memberId']);
                let gender =$('<small style="margin-left: 50px">').html((element["gender"]=='M'?'남':'여')+"/"+calAge(element["birthday"]));
                d1.append(name).append(gender);
                let detailBtn = $('<button type="button" class="btn btn-primary">').html("상세보기").click((e)=>{
                    // $(e.target).parent().prev().val()
                   setIntroBox(element);
                })
                div1.append(d1).append(detailBtn);

                let div2=$("<div>").addClass("d-flex justify-content-between");
                let intro;
                if(!element["myInfo"]){
                    intro=$("<span>").html("안녕하세요~^^");
                }else{
                    intro=$("<span>").addClass("d-inline-block text-truncate").css({"max-width":"200px"}).html(element["myInfo"]);
                }

               
                let dis = $("<span>").html("  ");
               
                div2.append(intro).append(dis);

                box.append(div1).append(div2);
                $("#friendListContainer").append(box);
            });
        }

        function calAge(str){
            const today = new Date();
            let ageDate = new Date(str);

            let age = today.getFullYear() - ageDate.getFullYear() + 1;
            return age;
        }

        function setIntroBox(info){
            let imgPath;
            if(!info["filePath"]){
                imgPath = "<%=request.getContextPath()%>/images/blankimg.png";
            }else{
                imgPath = "<%=request.getContextPath()%>/upload/blog/"+info["filePath"];
            }

            $("#friendImg").attr({src:imgPath});
            $("#friendName").html(info["memberId"]);
            $("#friendGender").html((info["gender"]=='M'?'남':'여')+"/"+calAge(info["birthday"]));
            $("#friendIntro").html(info["myInfo"]);
        }

    </script>
</section>
<%@ include file="/views/common/footer.jsp" %>