<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
	<!-- Section: contact -->
    <section id="contact" class="home-section text-center" style="position: static">
    	<div class="boxed-grey">
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
					<!-- Email 입력 --> 
					<div class="input-group">
					<span class="input-group-addon">&nbsp;&nbsp;Email&nbsp;&nbsp;</span>
					<input type="text" class="form-control" name="email" id="email" value="${user.email}" readonly="readonly"/>
					</div>
					<!-- 우편번호 입력 --> 
					<div class="input-group">
					<span class="input-group-addon">우편번호</span>
					<input type="text" class="form-control" name="add_code" value="${user.add_code}" readonly="readonly"/>
					</div>
					<!-- 지역주소 -->
					<div class="input-group">
					<span class="input-group-addon">지역주소</span>
					<input type="text" class="form-control" name="addr" value="${user.addr}" readonly="readonly"/>
					</div>
					<!-- 세부주소 -->
					<div class="input-group">
					<span class="input-group-addon">세부주소</span>
					<input type="text" class="form-control" name="addd" value="${user.addd}" readonly="readonly"/>
					</div>
					<!-- 전화번호 -->
					<div class="input-group">
					<span class="input-group-addon">전화번호</span>
					<input type="text" class="form-control" name="cell_phone" value="${user.cell_phone}" readonly="readonly"/>
					</div>
					<!-- 유저사진등록 -->
					<div class="input-group">
					<span class="input-group-addon">&nbsp;&nbsp;사 &nbsp;진&nbsp;&nbsp;</span>
					<input type="text" class="form-control" name="file" value="${user.photo}" readonly="readonly"/>
					</div>
					<hr>
					<se:authorize ifAllGranted="ROLE_SELLER">
						<!-- 농장 이름 입력 --> 
						<div class="input-group">
						<span class="input-group-addon">&nbsp;&nbsp;농장 &nbsp;이름&nbsp;&nbsp;</span>
						<input type="text" class="form-control" name="farminfo" value="${farm.farminfo}" readonly="readonly"/>
						</div>
						<!-- 농장지역 -->
						<div class="input-group">
						<span class="input-group-addon">&nbsp;&nbsp;농장 &nbsp;지역&nbsp;&nbsp;</span>
						<input type="text" class="form-control" name="farm_add" value="${farm.farm_add}" readonly="readonly"/>
						</div>
						<!-- 세부주소 -->
						<div class="input-group">
						<span class="input-group-addon">농장 세부주소</span>
						<input type="text" class="form-control" name="farm_add_de" value="${farm.farm_add_de}" readonly="readonly"/>
						</div>
						<!-- 농장 주요작물 -->
						<div class="input-group">
						<span class="input-group-addon">농장 주요작물</span>
						<input type="text" class="form-control" name="pro_name" value="${farm.pro_name}" readonly="readonly">
						</div>
						<!-- 농장 전화번호 -->
						<div class="input-group">
						<span class="input-group-addon">농장 전화번호</span>
						<input type="text" class="form-control" name="farm_phon" value="${farm.farm_phon}" readonly="readonly"/>
						</div>
						<!-- 농장소개 -->
						<div class="input-group">
						<span class="input-group-addon" >&nbsp;&nbsp;농장 &nbsp;소개&nbsp;&nbsp;</span>
						<textarea class="form-control" name="farm_comment" readonly="readonly">${farm.farm_comment}</textarea>
						</div>
						<hr>
						<!-- 계좌 등록 -->
						<div class="input-group">
						<span class="input-group-addon">은 행</span>
						<input type="text" class="form-control" name="bank" placeholder="Bank" value="${account.bank}" readonly="readonly"/>
						</div>
						<!-- 계좌 등록 -->
						<div class="input-group">
						<span class="input-group-addon">계 좌</span>
						<input type="text" class="form-control" name="accountnum" placeholder="Account" value="${account.accountnum}" readonly="readonly"/>
						</div>
					</se:authorize>
					
				</div>
			</div>
			<div class="col-md-4 col-lg-4">
				<a href="../index.five"><button type="button" class="btn btn-skin pull-center">확 인</button></a>
				<a href="userInfoUpdate.five"><button type="button" class="btn btn-skin pull-center">수 정</button></a>
			</div>
		</div>
    </section>