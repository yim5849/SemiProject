<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.db.main.model.vo.MainBoard,java.util.List"%>

<style>

.mainbox {
	font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto,
		Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
	font-weight: bolder;
	background-color: white;
	width: 300px;
	height: 400px;
	border-radius: 10px;
	margin-bottom: 20px;
    overflow: hidden;
}

.mainbox:hover {
	box-shadow: 0px 0px 10px rgba(143, 140, 140, 0.5);
}


.mainbox small {
	opacity: 0.5;
}

.contentContainer{
    padding: 10px 10px;
}

.contentContainer>span{
    display:flex;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}

.contentContainer>div>p{
    height:70px;
    white-space: normal;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	overflow: hidden;
	font-weight: normal;
}

.writerContainer{
    display: flex;
    justify-content: space-between;
}
.additionalContainer{
    display: flex;
}
</style>



<section class="container">
	<%if(loginMember!=null){ %>
    <div class="fixed-bottom" style="left:90vw">
        <img onclick="openChat();" src="<%=request.getContextPath()%>/images/chat.png" width="100px" height="100px">
    </div>
    <%} %>
    <div id="mainContainer" class="row">
		<div class="col-xl-12 d-flex flex-wrap justify-content-around">
        </div>
    </div>
   
</section>






    <script>
        function openChat(){
            window.open('<%=request.getContextPath()%>/chat/chat.do?memberId=<%=loginMember!=null?loginMember.getMemberId():""%>',"_blank","width=450px; height=550px");
        }



        let listCount =2;
		let flag = true;



    	(()=>{
            let cPage=1;
    		requestMainBox(cPage);
          
    	})();

        function requestMainBox(cPage){
            $.ajax({
                url:'<%=request.getContextPath()%>/main/mainView.do?cPage='+cPage ,
                dataType:"json",
                success:data=>{
                    console.log(data);
                    for(let i=0; i<data.length;i++){
                        let info =data[i];
                        $("#mainContainer>div").append(addbox(info));
                    }
                    infinityScroll();
                }
            });
        }
    
    

        function infinityScroll(){
            const root = $("#mainContainer>div");
            let lastBox = $("#mainContainer>div>div:eq(10)");
            console.log(root);
            console.log(lastBox);
            const io = new IntersectionObserver((entry,observer)=>{
                const ioTarget = entry[0].target;

                if(entry[0].isIntersecting&&flag){
                    console.log('현재 보이는 타켓', ioTarget);
                    io.unobserve(lastBox[0]);
					flag=false;

                    console.log("요청"+ listCount);
					$.ajax({
                        url:'<%=request.getContextPath()%>/main/mainView.do?cPage='+listCount ,
                        dataType:"json",
                        success:data=>{
                         console.log(data);
                        for(let i=0; i<data.length;i++){
                            let info =data[i];
                            $("#mainContainer>div").append(addbox(info));
                        }
                        listCount++;
                        flag=true;

                        }
					});
                
                    lastBox = $("div.mainbox:last");
                   io.observe(lastBox[0]);
                }
            },{
                threshold:0.5
            });
            io.observe(lastBox[0]);
        }


        
        function addbox(info){
            let mainbox = $("<div>").addClass("mainbox");
            
            let boardNo = info["boardNo"];

            let imgList = info["attachedFileList"];
            let mainImgName="";
            for(let i=0; i<imgList.length;i++){
                if(imgList[i]["imgNo"]==1){
                    mainImgName = imgList[i]["imgName"];
                    break;
                }
            }

         
            if(mainImgName.length<=0){
                mainImgName = "ex1.png";
            }

            let mainImg = $("<img>").attr({src: "<%=request.getContextPath()%>/upload/attachedimg/"+mainImgName ,width:"300px",height:"180px"});
             mainbox.append(mainImg);

         
          
            let contentContainer = $("<div>").addClass("contentContainer");
            let title= $("<span>").append($("<strong>").html(info["boardTitle"]));
            let tag =$("<span>").html("#태그");
            let content= $("<div>").append($("<p>").html(info["boardContent"]));
            content.append($("<hr>"));
         
            contentContainer.append(title).append(tag).append(content);
        
            let footerContainer = $("<div>").addClass("footerContainer");
            let additionalContainer=$("<div>").addClass("additionalContainer");
            let day =$("<small>").html(info["boardDate"]);
            let comment = $("<small>").html(info["comment"]+"개의 댓글");

            additionalContainer.append(day).append(comment);
            footerContainer.append(additionalContainer);

            let writerContainer=$("<div>").addClass("writerContainer");
            let wFirstDiv =$("<div>");

            let profileImgName = info["profileImgName"];
                
            let writerImg = $("<img>").attr({src:"",width:"30px",height:"30px"});
            let by =$("<small>").html("by");
            let writer=$("<span>").html(info["memberName"]);
            wFirstDiv.append(writerImg).append(by).append(writer);

            let wSecondDiv=$("<div>");
            let heartImg = $("<img>").attr({src: "<%=request.getContextPath()%>/images/heart.png", width:"24px", height:"24px"});    
            let read=$("<small>").html(0);
            wSecondDiv.append(heartImg).append(read);
            writerContainer.append(wFirstDiv).append(wSecondDiv);
            footerContainer.append(writerContainer);
            contentContainer.append(footerContainer);
            mainbox.append(contentContainer);

            return mainbox;
        }

	




    </script>



<%@ include file="/views/common/footer.jsp"%>