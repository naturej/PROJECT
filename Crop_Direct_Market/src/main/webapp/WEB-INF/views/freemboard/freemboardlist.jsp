<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
	
<c:set var="nowpage" value="${requestScope.page}" />
<c:set var="maxpage" value="${requestScope.maxpage}" />
<c:set var="startpage" value="${requestScope.startpage}" />
<c:set var="endpage" value="${requestScope.endpage}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<link rel="icon" href="favicon.png" type="image/png">
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/linecons.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/responsive.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/animate.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.1.8.3.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-scrolltofixed.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.isotope.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/classie.js"></script>

<script type="text/javascript">
	$(document).ready(function(e) {
        $('.res-nav_click').click(function(){
		$('ul.toggle').slideToggle(600)	
			});	
			
	$(document).ready(function() {
$(window).bind('scroll', function() {
         if ($(window).scrollTop() > 0) {
             $('#header_outer').addClass('fixed');
         }
         else {
             $('#header_outer').removeClass('fixed');
         }
    });
	
	  });
	  

		    });	
function resizeText() {
	var preferredWidth = 767;
	var displayWidth = window.innerWidth;
	var percentage = displayWidth / preferredWidth;
	var fontsizetitle = 25;
	var newFontSizeTitle = Math.floor(fontsizetitle * percentage);
	$(".divclass").css("font-size", newFontSizeTitle)
}
</script>
<!--new_portfolio--> 
<!-- Portfolio -->

<section id="Portfolio" class="content">
	<section id="service" class="home-section text-center"  style="position: static">	
	<div class="heading-about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow bounceInDown" data-wow-delay="0.4s">
						<div class="section-heading">
							<h2>무료 나눔</h2>
							<i class="fa fa-2x fa-angle-down"></i>
							<p>무료 나눔 정보</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- Container -->
  	<div class="portfolio"> 
    <!-- Portfolio Filters -->
    <div id="filters" class="sixteen columns">
      	<ul class="clearfix">
        	<li><a id="all" href="" data-filter="*" class="active">
          		<h5>All</h5>
          	</a></li>
        	<li><a class="" href="" data-filter=".서울">
          		<h5>서울시</h5>
          	</a></li>
        	<li><a class="" href="" data-filter=".경기">
          		<h5>경기도</h5>
          	</a></li>
        	<li><a class="" href="" data-filter=".경상">
          		<h5>경상도</h5>
          	</a></li>
        	<li><a class="" href="" data-filter=".전라">
          		<h5>전라도</h5>
          	</a></li>
        	<li><a class="" href="" data-filter=".강원">
          		<h5>강원도</h5>
          	</a></li>
          	<li><a class="" href="" data-filter=".제주">
          		<h5>제주도</h5>
          	</a></li>
      	</ul>
    </div>
    <!--/Portfolio Filters --> 
    
    <!-- Portfolio Wrap -->
    <div class="isotope" style="position: relative; overflow: hidden; height: 480px;" id="portfolio-wrap"> 
     	<c:forEach items="${list}" var="n">
 		<div style="position:absolute; left: 0px; top: 0px; transform: translate3d(1101px, 240px, 0px) scale3d(1, 1, 1) ; width: 337px; opacity: 1; " class="portfolio-item one-four 제주 isotope-item">
        		<div class="portfolio-image"> ${n.fm_date}-${n.fm_end}<img src="<%=request.getContextPath()%>/upload/${n.fm_photo}"></div>
        		<a title="Stereo Headphones" rel="prettyPhoto[galname]" href="freemboarddetail.five?fm_id=${n.fm_id}">
        		<div class="project-overlay">
          			<div class="project-info">
          				 ${n.fm_date}-${n.fm_end}
            			<div class="zoom-icon"></div>
            			<h4 class="project-name">${n.fm_subject}</h4>
            			<p class="project-categories">${n.fm_time}</p>
          			</div>
        		</div>
        		</a>
        		</div>
		</c:forEach>
	</div>
    <!--/Portfolio Wrap --> 
  	</div>
  	<!--/Portfolio Plus Filters -->
  	<div class="portfolio-bottom" align="center">
  		<br>
  		<br>
	   	<c:choose>
			<c:when test="${nowpage<=1}">
				[이전]&nbsp;
			</c:when>
			<c:otherwise>
				<a href="<%=request.getContextPath()%>/freemboard/freemboardlist.five?pg=${nowpage-1}">[이전]</a>&nbsp;
			</c:otherwise>
		</c:choose>
		<c:forEach var="i"  begin="${startpage}" end="${endpage}" step="1">
			<c:choose>
				<c:when test="${i==nowpage}">
					[${i}]
				</c:when>
				<c:otherwise>
					<a href="<%=request.getContextPath()%>/freemboard/freemboardlist.five?pg=${i}">[${i}]</a>&nbsp;
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
					<c:when test="${nowpage>=maxpage}">
					[다음]
					</c:when>
					<c:otherwise>
						<a href="<%=request.getContextPath()%>/freemboard/freemboardlist.five?pg=${nowpage+1}">[다음]</a>&nbsp;
					</c:otherwise>
				</c:choose>
				<se:authorize ifAllGranted="ROLE_SELLER">
				<a href="<%=request.getContextPath()%>/freemboard/freemboardwrite.five">글쓰기</a>
				</se:authorize>
	</div>
	<!-- Project Page Holder-->
  	<div id="project-page-holder">
    	<div class="clear"></div>
    	<div id="project-page-data"></div>
  	</div>
  	<!--/Project Page Holder--> 
</section>
<!--/Portfolio --> 
<!--new_portfolio--> 

<script type="text/javascript">
    $(document).ready(function(e) {
        $('#header_outer').scrollToFixed();
        $('.res-nav_click').click(function(){
            $('.main-nav').slideToggle();
            return false    
        });
    });
</script> 

<script type="text/javascript">

$(window).load(function(){
  
  var $container = $('.portfolioContainer'),
      $body = $('body'),
      colW = 350,
      columns = null;
});

</script>

<script type="text/javascript">
jQuery(document).ready(function($){     
// Portfolio Isotope
	var container = $('#portfolio-wrap');	
	container.isotope({
		animationEngine : 'best-available',
	  	animationOptions: {
	     	duration: 200,
	     	queue: false
	   	},
		layoutMode: 'fitRows'
	});	

	$('#filters a').click(function(){
		$('#filters a').removeClass('active');
		$(this).addClass('active');
		var selector = $(this).attr('data-filter');
	  	container.isotope({ filter: selector });
        setProjects();		
	  	return false;
	});
		
		function splitColumns() { 
			var winWidth = $(window).width(), 
				columnNumb = 1;
			
			if (winWidth > 1024) {
				columnNumb = 4;
			} else if (winWidth > 900) {
				columnNumb = 2;
			} else if (winWidth > 479) {
				columnNumb = 2;
			} else if (winWidth < 479) {
				columnNumb = 1;
			}
			
			return columnNumb;
		}		
		
		function setColumns() { 
			var winWidth = $(window).width(), 
				columnNumb = splitColumns(), 
				postWidth = Math.floor(winWidth / columnNumb);
			
			container.find('.portfolio-item').each(function () { 
				$(this).css( { 
					width : postWidth + 'px' 
				});
			});
		}		
		
		function setProjects() { 
			setColumns();
			container.isotope('reLayout');
		}		
		
		container.imagesLoaded(function () { 
			setColumns();
		});
		
	
		$(window).bind('resize', function () { 
			setProjects();			
		});

});
$( window ).load(function() {
	jQuery('#all').click();
	return false;
});
</script>
</html>