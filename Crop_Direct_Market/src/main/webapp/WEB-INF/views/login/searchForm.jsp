<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<!-- Section: contact -->
    <section id="contact" class="home-section text-center">
    	<div class="boxed-grey">
			<form method="post" action="">
				<div class="row">
					<div class="col-md-6 col-lg-12">
                        <div class="form-group">
                            <label for="email">EMAIL</label>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span>
                                </span>
                                <input type="text" class="form-control" name="email" placeholder="Enter Email" required /></div>
                        </div>
                    </div>
                    <div class="col-md-6  col-lg-12 form-group">
                        <a href=""><button type="button" class="btn btn-skin pull-right">ID찾기</button></a>
                    </div>
                    <br><hr>
                    <div class="col-md-6 col-lg-12">
                        <div class="form-group">
                            <label for="user_id">ID</label>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span>
                                </span>
                                <input type="text" class="form-control" name="user_id" placeholder="Enter Id" required /></div>
                        </div>
                        <div class="form-group">
                            <label for="email">EMAIL</label>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span>
                                </span>
                                <input type="text" class="form-control" name="email" placeholder="Enter Email" required /></div>
                        </div>
                    </div>
                    <div class="col-md-6  col-lg-12">
                        <a href=""><button type="button" class="btn btn-skin pull-right">ID찾기</button></a>
                    </div>
                </div>
			</form>
		</div>
	</section>