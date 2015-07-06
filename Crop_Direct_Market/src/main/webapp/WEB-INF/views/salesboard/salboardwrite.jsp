<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<link href="css/table-base/bootstrap.min.css" rel="stylesheet">
<link href="css/AdminLTE.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mintTheme.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mintTheme.structure.min.css"/>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%String user_id = (String)request.getAttribute("user_id");%>
<script type="text/javascript">
$(function(){
     $.ajax({
        url : 'unitlist.five',
        dataType : "html",
        success : function(responseData){
           var options="";
           var unitlist = JSON.parse(responseData);
            $.each(unitlist, function(index,ulist){
                   options += "<option>"+ulist.unit+"</option>";
            });
            $('#unit').append(options);
        },
       error: function (xhr,Options,thrownError) {
       }
    });     
});
</script>
<script type="text/javascript">
      $(function(){
       $.ajax({
           url : 'seplist.five',
         dataType : "html",
         success : function(responseData){
            var options="<option>분류</option>";
            var seplist = JSON.parse(responseData);
             $.each(seplist, function(index,slist){
                    options += "<option>"+slist.pro_sep+"</option>";
             });
             $('#sep').html(options);
         },
           error: function (xhr,Options,thrownError) {}
       });
        $('#sep').on("change",function(){
           console.log($('#sep').val());
            $.ajax({
               url:"prolist.five",
               data:{pro_sep:$('#sep').val()},
               dataType:"html",
               success : function(responseData){
                  var options = "<option>품명</option>";
                      var prolist = JSON.parse(responseData);
                  $.each(prolist,function(index,plist){
                     console.log(plist.pro_name);
                     options += "<option>"+plist.pro_name+"</option>";
                      });
                      $('#pro_name').html(options);
                  },
              error: function (xhr,Options,thrownError) {}
           }); 
       }); 
});
</script>   

   <div id="content">
   <section id="service" class="home-section text-center">
      <div class="heading-about">
         <div class="container">
         <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
               <div class="wow bounceInDown" data-wow-delay="0.4s">
               <div class="section-heading">
               <h2>Sales Board</h2>
               <i class="fa fa-2x fa-angle-down"></i>
               <p>Sales Board Write</p>
               </div>
               </div>   
   
    <!-- Main content -->
                <section class="content">
                            <div class='box box-info'>
                                <div class='box-body pad' align="center">
   
   <form action="" method="post" enctype="multipart/form-data">
   <input type="hidden" id="user_id" name="user_id" value="<%=user_id%>"/>
   <div class="SALES_BOARD">
   <table>
   <tr><td><label>제목</label></td><td colspan="4"><input class="form-control" type="text" name="bo_subject"/></td></tr>
   <tr><td colspan="5">
   <textarea id="editor1" name="editor1" rows="5" cols="80">
      내용을 입력하세요
    </textarea>
   </td></tr>
   <tr><td><label>가격</label></td><td><div class="input-group input-group-sm"><input style="text-align:right; padding-right:1px; width: 150px" class="form-control" type="text" name="bo_price" placeholder="0000"/>원</div></td>
   <td><label>숫자 단위</label></td><td><input  style="text-align:right; padding-right:1px;" class="form-control" type="text" placeholder="0000" name="bo_salnum"/></td><td><select id="unit" name="unit"><option>단위</option>
               </select></td>
   </tr>
   <tr><td><label>품명</label></td><td colspan="4">
   <select id="sep" name="sep"><option>분류</option></select>
   
   <select id="pro_name" name="pro_name"><option>품명</option></select>
   
   </td></tr>
   <tr><td><label>파일</label></td><td colspan="4"><input type="file" name="file"></td></tr>
   <tr><td colspan="5" align="center"><button type="submit" class="btn btn-sm btn-skin" >작성</button></td></tr>
   </table>
   </div>
   
   </form>
      </div>
   </div>
   </section>
   </div>
   </div>
   </div>
   </div>
   </section>
   </div>
   <script src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
        
        <script type="text/javascript">
            $(function() {
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace('editor1');
                //bootstrap WYSIHTML5 - text editor
                $(".textarea").wysihtml5();
            });
        </script>
   