<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   function winclose() {
      window.close();
   }

   function sendmsg() {
      window.close();
   }
</script>
</head>
<body>
   <form action="send_enuriMessage.five">
      <table>
         <tr>
            <td>받는 사람</td>
            <td ><input type="text" value='<%=request.getParameter("user_id")%>' readonly="readonly"></td>
            <!-- 자동 삽입 데이터 -->
         </tr>
         <tr>
            <td>품목</td>
            <td><input type="text" value='<%=request.getParameter("pro_name")%>' readonly="readonly"></td>
            <!-- 자동 삽입 데이터 -->
            </tr>
         <tr>
            <td>수량</td>
            <td><input type="text" name="enu_quan"></td>
         </tr>
         <tr>
            <td>에누리 가격</td>
            <td><input type="text" name="enu_price"></td>
            <!-- 에누리 가격 -->
         </tr>
         <tr>
            <td>보내는 사람</td>
            <td><input type="text" name="user_id" value="gathering11" readonly="readonly">gathering11(고정값)</td>
         </tr>
         <tr>
            <td>내용</td>
            <td><textarea name="enu_content"></textarea></td>
         </tr>
         <tr>
            <td><input type="text" name="bo_num" value="<%=request.getParameter("bo_num")%>" hidden>
            <!-- 테스트용 고정 값 --></td>
         </tr>
         <tr>
            <td colspan="2" align="center"><input type="submit" value="발송"
               onclick="javascript:sendmsg()"> <input type="button"
               value="닫기" onclick="winclose()"></td>
         </tr>
      </table>
   </form>
</body>
</html>