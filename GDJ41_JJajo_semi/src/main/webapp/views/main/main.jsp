<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.db.main.model.vo.MainBoard,java.util.List"%>
<%
List<MainBoard> mbList = (List) request.getAttribute("mainBoardList");
%>

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
}

.mainbox>div {
	padding: 5px 10px;
}

.mainbox p {
	white-space: normal;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	overflow: hidden;
	font-weight: normal;
}

.mainbox small {
	opacity: 0.5;
}
</style>


<section class="container">
	<div id="mainContainer" class="row">
		<div class="col-xl-12 d-flex flex-wrap justify-content-around  ">
			<%
			if (mbList != null && mbList.size() > 0) {
				for (MainBoard mb : mbList) {
			%>
			<div class="mainbox">
				<img src="images/info.png" width="100%" height="150px" />
				<div>
					<span><strong><%=mb.getBoardTitle() %></strong></span><br> <span>#태그#태그#태그#태그#태그</span>
					<div style="height: 100px;">
						<p><%=mb.getBoardContent() %></p>
					</div>
					<small>6일전*</small><small>17개의 댓글</small>
					<hr>
					<div class="d-flex justify-content-between">
						<div>
							<img src="" width="30px" height="30px"> <small>by</small> <span><%=mb.getMemberNo() %></span>
						</div>
						<div>
							<img src="images/heart.png" width="24px" height="24px"> <small>82</small>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>



			<%
			} else {
			%>
			error!!!
			<%
			}
			%>
		</div>
	</div>

    <script>
        (()=>{
            const root = $("#mainContainer>div");
           
            let lastBox = $("div.mainbox:last");
            console.log(root);
           // console.log(mainbox);
            console.log(lastBox[0]);
            const io = new IntersectionObserver((entry,observer)=>{
                const ioTarget = entry[0].target;

                if(entry[0].isIntersecting){
                    console.log('현재 보이는 타켓', ioTarget);
                    io.unobserve(lastBox[0]);
                    for(let i=0; i<20;i++){
                        const mainbox=$("#mainContainer div.mainbox:first").clone();
                        root.append(mainbox);
                        console.log("추가");
                    }
                    lastBox = $("div.mainbox:last");
                   io.observe(lastBox[0]);
                }
            },{
                threshold:0.5
            });
            io.observe(lastBox[0]);
        })();


    </script>
</section>


<%@ include file="/views/common/footer.jsp"%>