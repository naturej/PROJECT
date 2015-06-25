<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, maximum-scale=1">
<title>Homepage</title>
<link rel="icon" href="favicon.png" type="image/png">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/linecons.css" rel="stylesheet" type="text/css">
<link href="css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="css/responsive.css" rel="stylesheet" type="text/css">
<link href="css/animate.css" rel="stylesheet" type="text/css">

<link href='http://fonts.googleapis.com/css?family=Lato:400,900,700,700italic,400italic,300italic,300,100italic,100,900italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Dosis:400,500,700,800,600,300,200' rel='stylesheet' type='text/css'>

<!--[if IE]><style type="text/css">.pie {behavior:url(PIE.htc);}</style><![endif]-->

<script type="text/javascript" src="js/jquery.1.8.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/jquery-scrolltofixed.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/jquery.isotope.js"></script>
<script type="text/javascript" src="js/wow.js"></script>
<script type="text/javascript" src="js/classie.js"></script>

<!--[if lt IE 9]>
    <script src="js/respond-1.1.0.min.js"></script>
    <script src="js/html5shiv.js"></script>
    <script src="js/html5element.js"></script>
<![endif]-->

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
</head>
<body>

<!--new_portfolio--> 

<!-- Portfolio -->
<section id="Portfolio" class="content"> 
  
  <!-- Container -->
  <div class="container portfolio-title"> 
    
    <!-- Section Title -->
    <div class="section-title">
      <h2>Portfolio</h2>
    </div>
    <!--/Section Title --> 
    
  </div>
  <!-- Container -->
  
  <div class="portfolio-top"></div>
  
  <!-- Portfolio Plus Filters -->
  <div class="portfolio"> 
    
    <!-- Portfolio Filters -->
    <div id="filters" class="sixteen columns">
      <ul class="clearfix">
        <li><a id="all" href="#" data-filter="*" class="active">
          <h5>All</h5>
          </a></li>
        <li><a class="" href="#" data-filter=".branding">
          <h5>Branding</h5>
          </a></li>
        <li><a class="" href="#" data-filter=".design">
          <h5>Design</h5>
          </a></li>
        <li><a class="" href="#" data-filter=".photography">
          <h5>Photography</h5>
          </a></li>
        <li><a class="" href="#" data-filter=".videography">
          <h5>Videography</h5>
          </a></li>
        <li><a class="" href="#" data-filter=".web">
          <h5>Web</h5>
          </a></li>
      </ul>
    </div>
    <!--/Portfolio Filters --> 
    
    <!-- Portfolio Wrap -->
    <div class="isotope" style="position: relative; overflow: hidden; height: 480px;" id="portfolio-wrap"> 
      
      <!-- Portfolio Item With PrettyPhoto  -->
      <div style="position: absolute; left: 0px; top: 0px; transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1); width: 337px; opacity: 1;" class="portfolio-item one-four   videography isotope-item">
        <div class="portfolio-image"> <img src="img/portfolio_pic1.jpg"  alt="Portfolio 1"> </div>
        <a title="Starbucks Coffee" rel="prettyPhoto[galname]" href="http://clapat.ro/themes/newave/images/portfolio/portfolio2.jpg">
        <div class="project-overlay">
          <div class="project-info">
            <div class="zoom-icon"></div>
            <h4 class="project-name">Leica Camera</h4>
            <p class="project-categories">Videography</p>
          </div>
        </div>
        </a> </div>
      <!--/Portfolio Item With PrettyPhoto  --> 
      
      <!-- Portfolio Item Video Expander  -->
      <div style="position: absolute; left: 0px; top: 0px; transform: translate3d(337px, 0px, 0px) scale3d(1, 1, 1); width: 337px; opacity: 1;" class="portfolio-item one-four  design isotope-item">
        <div class="portfolio-image"> <img src="img/portfolio_pic2.jpg" alt="Portfolio 1"> </div>
        <div class="project-overlay">
          <div class="open-project-link"> <a class="open-project" href="http://clapat.ro/themes/newave/project-video-expander.html" title="Open Project"></a> </div>
          <div class="project-info">
            <div class="zoom-icon"></div>
            <h4 class="project-name">Foto Template</h4>
            <p class="project-categories">Design</p>
          </div>
        </div>
      </div>
      <!--/Portfolio Item Video Expander  --> 
      
      <!-- Portfolio Item Normal Expander -->
      <div style="position: absolute; left: 0px; top: 0px; transform: translate3d(674px, 0px, 0px) scale3d(1, 1, 1); width: 337px; opacity: 1;" class="portfolio-item one-four  design  isotope-item">
        <div class="portfolio-image"> <img src="img/portfolio_pic3.jpg" alt="Portfolio 1"> </div>
        <div class="project-overlay">
          <div class="open-project-link"> <a class="open-project" href="http://clapat.ro/themes/newave/project-normal-expander-1.html" title="Open Project"></a> </div>
          <div class="project-info">
            <div class="zoom-icon"></div>
            <h4 class="project-name">Sony Phone</h4>
            <p class="project-categories">Design</p>
          </div>
        </div>
      </div>
      <!--/Portfolio Item Normal Expander --> 
      
      <!-- Portfolio Item FullScreen Expander -->
      <div style="position: absolute; left: 0px; top: 0px; transform: translate3d(1011px, 0px, 0px) scale3d(1, 1, 1); width: 337px; opacity: 1;" class="portfolio-item one-four  photography  branding web isotope-item">
        <div class="portfolio-image"> <img src="img/portfolio_pic4.jpg" alt="Portfolio 1"> </div>
        <div class="project-overlay">
          <div class="open-project-link"> <a class="open-project" href="http://clapat.ro/themes/newave/project-fullscreen-expander-1.html" title="Open Project"></a> </div>
          <div class="project-info">
            <div class="zoom-icon"></div>
            <h4 class="project-name">Nike Shoes</h4>
            <p class="project-categories">Photography, Web, Branding</p>
          </div>
        </div>
      </div>
      <!-- Portfolio Item FullScreen Expander --> 
      
      <!-- Portfolio Item FullScreen Expander -->
      <div style="position: absolute; left: 0px; top: 0px; transform: translate3d(0px, 240px, 0px) scale3d(1, 1, 1); width: 337px; opacity: 1;" class="portfolio-item one-four  design isotope-item">
        <div class="portfolio-image"> <img src="img/portfolio_pic5.jpg" alt="Portfolio 1"> </div>
        <div class="project-overlay">
          <div class="open-project-link"> <a class="open-project" href="http://clapat.ro/themes/newave/project-fullscreen-expander-2.html" title="Open Project"></a> </div>
          <div class="project-info">
            <div class="zoom-icon"></div>
            <h4 class="project-name">Vinyl Record</h4>
            <p class="project-categories">Design</p>
          </div>
        </div>
      </div>
      <!--/Portfolio Item FullScreen Expander --> 
      
      <!-- Portfolio Item Normal Expander -->
      <div style="position: absolute; left: 0px; top: 0px; transform: translate3d(337px, 240px, 0px) scale3d(1, 1, 1); width: 337px; opacity: 1;" class="portfolio-item one-four  web isotope-item">
        <div class="portfolio-image"> <img src="img/portfolio_pic6.jpg" alt="Portfolio 1"> </div>
        <div class="project-overlay">
          <div class="open-project-link"> <a class="open-project" href="http://clapat.ro/themes/newave/project-normal-expander-2.html" title="Open Project"></a> </div>
          <div class="project-info">
            <div class="zoom-icon"></div>
            <h4 class="project-name">iPhone</h4>
            <p class="project-categories">Web</p>
          </div>
        </div>
      </div>
      <!--/Portfolio Item Normal Expander --> 
      
      <!-- Portfolio Item External Project  -->
      <div style="position: absolute; left: 0px; top: 0px; transform: translate3d(674px, 240px, 0px) scale3d(1, 1, 1); width: 337px; opacity: 1;" class="portfolio-item one-four  design web isotope-item">
        <div class="portfolio-image"> <img src="img/portfolio_pic7.jpg" alt="Portfolio 1"> </div>
        <a href="http://clapat.ro/themes/newave/project-external-1.html" class="external">
        <div class="project-overlay">
          <div class="project-info">
            <div class="zoom-icon"></div>
            <h4 class="project-name">Nexus Phone</h4>
            <p class="project-categories">Design, Web</p>
          </div>
        </div>
        </a> </div>
      <!--/Portfolio Item External Project  --> 
      
      <!-- Portfolio Item With PrettyPhoto  -->
      <div style="position: absolute; left: 0px; top: 0px; transform: translate3d(1011px, 240px, 0px) scale3d(1, 1, 1); width: 337px; opacity: 1;" class="portfolio-item one-four   photography isotope-item">
        <div class="portfolio-image"> <img src="img/portfolio_pic8.jpg" alt="Portfolio 1"> </div>
        <a title="Stereo Headphones" rel="prettyPhoto[galname]" href="http://clapat.ro/themes/newave/images/portfolio/portfolio8.jpg">
        <div class="project-overlay">
          <div class="project-info">
            <div class="zoom-icon"></div>
            <h4 class="project-name">Art Frame</h4>
            <p class="project-categories">Photography</p>
          </div>
        </div>
        </a> </div>
      <!--/Portfolio Item With PrettyPhoto  --> 
      
    </div>
    <!--/Portfolio Wrap --> 
    
  </div>
  <!--/Portfolio Plus Filters -->
  
  <div class="portfolio-bottom"></div>
  
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
<script>
    wow = new WOW(
      {
        animateClass: 'animated',
        offset:       100
      }
    );
    wow.init();
    document.getElementById('').onclick = function() {
      var section = document.createElement('section');
      section.className = 'wow fadeInDown';
	  section.className = 'wow shake';
	  section.className = 'wow zoomIn';
	  section.className = 'wow lightSpeedIn';
      this.parentNode.insertBefore(section, this);
    };
  </script> 
<script type="text/javascript">
	$(window).load(function(){
		
		$('a').bind('click',function(event){
			var $anchor = $(this);
			
			$('html, body').stop().animate({
				scrollTop: $($anchor.attr('href')).offset().top - 91
			}, 1500,'easeInOutExpo');
			/*
			if you don't want to use the easing effects:
			$('html, body').stop().animate({
				scrollTop: $($anchor.attr('href')).offset().top
			}, 1000);
			*/
			event.preventDefault();
		});
	})
</script> 

<!--<script type="text/javascript">

$(window).load(function(){
  
  
  var $container = $('.portfolioContainer'),
      $body = $('body'),
      colW = 350,
      columns = null;

  
  $container.isotope({
    // disable window resizing
    resizable: true,
    masonry: {
      columnWidth: colW
    }
  });
  
  $(window).smartresize(function(){
    // check if columns has changed
    var currentColumns = Math.floor( ( $body.width() -30 ) / colW );
    if ( currentColumns !== columns ) {
      // set new column count
      columns = currentColumns;
      // apply width to container manually, then trigger relayout
      $container.width( columns * colW )
        .isotope('reLayout');
    }
    
  }).smartresize(); // trigger resize to set container width
  $('.portfolioFilter a').click(function(){
        $('.portfolioFilter .current').removeClass('current');
        $(this).addClass('current');
 
        var selector = $(this).attr('data-filter');
        $container.isotope({
			
            filter: selector,
         });
         return false;
    });
  
});

</script>


--> 

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
</body>
</html>


<%-- <table>
<tr>
				<th class="IDX">번호</th>
				<th class="SUBJECT">제목</th>
				<th class="USER_ID">작성자</th>
				<th class="WRITEDATE">작성일</th>
				<th class="COUNT">사진</th>
</tr>
<c:forEach items="${list}" var="n">
				
				<tr>
					<td class="IDX">${n.mar_id}</td>
					<td class="SUBJECT"><a href="detailmarket.five?mar_id=${n.mar_id}">${n.mar_subject}</a></td>
					<td class="USER_ID">관리자</td>
					<td class="WRITEDATE">${n.writedate}</td>
					<td class="COUNT">${n.mar_photo}</td>
				</tr>
</c:forEach>
</table> --%>