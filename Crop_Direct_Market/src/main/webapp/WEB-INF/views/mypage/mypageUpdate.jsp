<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mintTheme.css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mintTheme.structure.min.css"/>
	<script type="text/javascript">
		var parameter = window.location.search.split('=')[1];
		/* 유효성검사 */
		function checkfield() {
			if (document.updateForm.password.value == "") {
				alert("비밀번호를 입력하세요");
				document.updateForm.password.focus();
				exit;

			} else if (document.updateForm.password2.value == "") {
				alert("비밀번호확인을 입력하세요");
				document.updateForm.password2.focus();
				exit;

			} else if (document.updateForm.email.value == "") {
				alert("E-Mail를 입력하세요");
				document.updateForm.email.focus();
				exit;

			} else if (document.updateForm.addr.value == "") {
				alert("지역주소를 입력하세요");
				document.updateForm.addr.focus();
				exit;

			} else if (document.updateForm.addd.value == "") {
				alert("세부주소를 입력하세요");
				document.updateForm.addd.focus();
				exit;

			} else if (document.updateForm.cell_phone.value == "") {
				alert("전화번호를 입력하세요");
				document.updateForm.cell_phone.focus();
				exit;

			} else if (document.updateForm.add_code.value == "") {
				alert("우편번호를 입력하세요");
				document.updateForm.add_code.focus();
				exit;

			}
			
			if (document.updateForm.password.value != document.updateForm.password2.value) {
				//비밀번호와 비밀번호확인의 값이 다를 경우

				alert("입력한 2개의 비밀번호가 일치하지 않습니다.");
				document.updateForm.password.focus();
				exit;

			}

			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

			if (exptext.test(document.updateForm.email.value) == false) {
				//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우

				alert("이 메일형식이 올바르지 않습니다.");
				document.updateForm.email.focus();
				exit;
			}
			$.ajax({
				  type: "POST",
				  url: "../passwordEncoder.five",
				  data: {password:$('#password').val()},
				  success: function(data){
					  $('#password').val(data);
					  document.updateForm.submit();
				  }
			});
			

		}
		
		$(function(){
			/* email 조합 */
			$('#email2').change(function(){
				var email_v = $('#email2').val();
				if (email_v == "1") {
					$('#email3').show();
					$('#email3').val("");
				} else {
					$('#email3').hide();
					$('#email3').val(email_v);
				}
			});
			
			/* 조합한 email 표시 */
			$('#check_email').click(function(){
				var email = $('#email1').val()+'@'+$('#email3').val();
				
				$.ajax({
					  type: "POST",
					  url: "check_email.five",
					  data: {email:email},
					  success: function(data){
						  console.log()
						  if(data.trim()=='사용 가능한 Email입니다.'){
							  $('#dialog').text(data);
							  $('#dialog').dialog();
							  $('#email').val(email);
						  }else{
							  $('#dialog').text(data);
							  $('#dialog').dialog();
							  $('#email').val("");
						  }
					  }
				});
			});
		});
		
		
	</script>
	<!-- Section: contact -->
    <section id="contact" class="home-section text-center" style="position: static">
    	<div class="boxed-grey">
    	<form action="" method="post" name="updateForm" enctype="multipart/form-data" >
	    	<div class="row">
				<div class="col-md-4 col-lg-4">
					<!-- ID --> 
					<div class="input-group">
					<span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;I &nbsp;D&nbsp;&nbsp;&nbsp;</span>
					<input type="text" class="form-control" name="user_id" id="user_id" value="${user.user_id}" readonly="readonly"/>
					</div>
					<!-- 이름 --> 
					<div class="input-group">
					<span class="input-group-addon">&nbsp;&nbsp;이 &nbsp;름&nbsp;&nbsp;</span>
					<input type="text" class="form-control" name="user_name" value="${user.user_name}" readonly="readonly"/>
					</div>
					<!-- 비밀번호 입력 --> 
					<div class="input-group">
					<span class="input-group-addon">비밀번호</span>
					<input type="password" class="form-control" name="password" id="password" value="${user.password}" placeholder="password" required/>
					</div>
					<!-- 비밀번호 입력 --> 
					<div class="input-group">
					<span class="input-group-addon">비번확인</span>
					<input type="password" class="form-control" name="password2" id="password2" value="${user.password}" placeholder="password" required/>
					</div>
					<!-- Email 입력 --> 
					<div class="input-group">
					<span class="input-group-addon">&nbsp;&nbsp;Email&nbsp;&nbsp;</span>
					<input type="text" class="form-control" name="email1" id="email1" placeholder="Email" required />@
					<select name="email2" id="email2" >
						<option value="" selected>이메일선택</option>
						<option value="naver.com">naver.com</option>
						<option value="dreamwiz.com">dreamwiz.com</option>
						<option value="empal.com">empal.com</option>
						<option value="hanmir.com">hanmir.com</option>
						<option value="hanafos.com">hanafos.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="lycos.co.kr">lycos.co.kr</option>
						<option value="nate.com">nate.com</option>
						<option value="paran.com">paran.com</option>
						<option value="netian.com">netian.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
						<option value="kornet.net">kornet.net</option>
						<option value="nownuri.net">nownuri.net</option>
						<option value="unitel.co.kr">unitel.co.kr</option>
						<option value="freechal.com">freechal.com</option>
						<option value="korea.com">korea.com</option>
						<option value="orgio.net">orgio.net</option>
						<option value="chollian.net">chollian.net</option>
						<option value="hitel.net">hitel.net</option>
						<option value="1">직접입력</option>
					</select> 
					<input type="text" class="form-control" name="email3" id="email3" style="display: none">
					<input type="button" value="확인" id="check_email" >
					<input type="text" class="form-control" name="email" id="email" value="${user.email}" readonly="readonly">
					</div>
					<!-- 우편번호 입력 --> 
					<div class="input-group">
					<span class="input-group-addon">우편번호</span>
					<input type="text" class="form-control" name="add_code" value="${user.add_code}" placeholder="AddressCode" required/>
					</div>
					<!-- 지역주소 -->
					<div class="input-group">
					<span class="input-group-addon">지역주소</span>
					<input type="text" class="form-control" name="addr" value="${user.addr}" placeholder="Address" required/>
					</div>
					<!-- 세부주소 -->
					<div class="input-group">
					<span class="input-group-addon">세부주소</span>
					<input type="text" class="form-control" name="addd" value="${user.addd}" placeholder="Address" required/>
					</div>
					<!-- 전화번호 -->
					<div class="input-group">
					<span class="input-group-addon">전화번호</span>
					<input type="text" class="form-control" name="cell_phone" value="${user.cell_phone}" placeholder="phoneNumber" required/>
					</div>
					<!-- 유저사진등록 -->
					<div class="input-group">
					<span class="input-group-addon">&nbsp;&nbsp;사 &nbsp;진&nbsp;&nbsp;</span>
					<input type="file" class="form-control" name="file" placeholder="image" required/>
					</div>
					<hr>
					<se:authorize ifAllGranted="ROLE_SELLER">
						<!-- 농장 이름 입력 --> 
						<div class="input-group">
						<span class="input-group-addon">&nbsp;&nbsp;농장 &nbsp;이름&nbsp;&nbsp;</span>
						<input type="text" class="form-control" name="farminfo" value="${farm.farminfo}" placeholder="FarmID" required/>
						</div>
						<!-- 농장지역 -->
						<div class="input-group">
						<span class="input-group-addon">&nbsp;&nbsp;농장 &nbsp;지역&nbsp;&nbsp;</span>
						<input type="text" class="form-control" name="farm_add" value="${farm.farm_add}" placeholder="FarmAddress" required/>
						</div>
						<!-- 세부주소 -->
						<div class="input-group">
						<span class="input-group-addon">농장 세부주소</span>
						<input type="text" class="form-control" name="farm_add_de" value="${farm.farm_add_de}" placeholder="FarmAddress" required/>
						</div>
						<!-- 농장 주요작물 -->
						<div class="input-group">
						<span class="input-group-addon">농장 주요작물</span>
						<input type="text" class="form-control" name="pro_name" value="${farm.pro_name}" placeholder="Product" required/>
						</div>
						<!-- 농장 전화번호 -->
						<div class="input-group">
						<span class="input-group-addon">농장 전화번호</span>
						<input type="text" class="form-control" name="farm_phon" value="${farm.farm_phon}" placeholder="FarmPhoneNumber" required/>
						</div>
						<!-- 농장소개 -->
						<div class="input-group">
						<span class="input-group-addon">&nbsp;&nbsp;농장 &nbsp;소개&nbsp;&nbsp;</span>
						<textarea class="form-control" name="farm_comment" placeholder="FarmIntroduce" required>${farm.farm_comment}</textarea>
						</div>
					</se:authorize>
				</div>
			</div>
			</form>
			<div class="col-md-4 col-lg-4">
				<button type="button" class="btn btn-skin pull-center"  onclick="checkfield()">확 인</button>
				<a href="#"><button type="reset" class="btn btn-skin pull-center">취 소</button></a>
			</div>
		</div>
    </section>