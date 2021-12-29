<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>회원탈퇴</title>
</head>

<body onload="begin()">
    <h1>회원탈퇴 페이지</h1>
    <h2>deleteForm.jsp</h2>
    <form name="deleteform" action="deleteMember.jsp" method="post" onSubmit="return checkIt()">
        <TABLE cellSpacing=1 cellPadding=1 width="260" border=1 align="center" >
        <TR height="30">
            <TD colspan="2" align="middle">
                <font size="+1" ><b>회원 탈퇴</b></font>
            </TD>
        </TR>
       
        <TR height="30">
            <TD width="110" align=center>비밀번호</TD>
            <TD width="150" align=center>
                <INPUT type=password name="pw"  size="15" maxlength="12">
            </TD>
        </TR>
       
        <TR height="30">
            <TD colspan="2" align="middle">
                <input type="submit" value="탈퇴">
                <input type="button" value="취소" onclick="javascript:window.location='main.jsp'">
            </TD>
        </TR>
        </TABLE>
    </form>
</body>

<script language="javascript">
  <!--
    function begin(){
      document.deleteform.pw.focus();
    }

    function checkIt(){
 if(!document.deleteform.pw.value){
        alert("비밀번호를 입력하지 않으셨습니다.");
        document.deleteform.pw.focus();
        return false;
      }
 }  
  -->
</script>
</html>