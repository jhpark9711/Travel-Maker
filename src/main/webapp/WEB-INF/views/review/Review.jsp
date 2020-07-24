<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<style>
.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}
#reviewBack {
	text-align: center;
}

#reviewBackImage {
	background-image: url("<c:url value='/images/reviewBackLarge.jpg'/>");
	height: 1041px;
	background-repeat: no-repeat;
	background-position: center center;
}
.review {
	max-height: 100%;
	max-width: 100%;
	background-color: white;
	border-radius: 20px;
}

.reviewTitle {
	width: 96%;
	color: black;
	margin-left: 20px;	
}
.reviewText {
	width: 96%;
	color: black;
}

.reviewTextTittle {
	text-align: center;
	font-weight:bold;
}

.reviewPlaceInfomation {
	font-weight: bold;
	color: #389dff;
}

.reviewText p {
	color: #777777;
	font-size: 1.4em;
}

.reviewMapOrImage {
	padding: 15px;
	text-align: center;
}

.reviewMapOrImage img {
	max-height: 80%;
	max-width: 100%;
	border-radius: 20px;
}

.reviewFooterUtil {
	text-align: center;
	color: #3EB489;
	font-size: 1.5em;
	font-weight: bold;
}

.reviewFooterUtil img {
	border-radius: 20px;
}

.reviewFooterUtil span {
	color: #3EB489;
}
.home_search_content{
	background-color:white;
	border-radius:20px;
}
</style>
</head>
<!-- Search -->
<div class="home_search">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="home_search_container">
					<div class="home_search_title">리뷰</div>
					<div class="home_search_content" >
						<div class="review">
							<div class="reviewTitle">
								<br>
								<h4 class="reviewTextTittle">${record.review_title}</h4>
								
									<h5 class="reviewPlaceInfomation"></h5>
							</div>
							<div class="reviewMapOrImage">
								<img src="<c:url value='/resources/ReviewUpload/${record.review_file} '/>"
									alt="리뷰지도/사진">
							</div>
							<span class="reviewText" style="font-size: 1.6em; margin-bottom: 40px;">${record.review_content}</span>
							
							<fmt:formatDate value="${record.review_date}"
								pattern="yyyy년 MM월 dd일 EEEE a HH:mm:ss" var="postdate" />
						
							<div class="reviewFooterUtil">
						
							<img src="<c:url value='/images/reviewLikes.png'/>"
									alt="좋아요"> <br> <span>${record.review_no+1}</span> <span>명</span>
									<div style="" class="starRev">
									  <span class="starR1 on">별1_왼쪽</span>
									  <span class="starR2">별1_오른쪽</span>
									  <span class="starR1">별2_왼쪽</span>
									  <span class="starR2">별2_오른쪽</span>
									  <span class="starR1">별3_왼쪽</span>
									  <span class="starR2">별3_오른쪽</span>
									  <span class="starR1">별4_왼쪽</span>
									  <span class="starR2">별4_오른쪽</span>
									  <span class="starR1">별5_왼쪽</span>
									  <span class="starR2">별5_오른쪽</span>
									</div>
							<p style="text-align: right; font-weight: bold; font-size:0.8em; color:sandybrown; margin-right:10px;">작성일시 : ${postdate}</p>
							<p style="text-align: right; font-weight: bold; font-size:0.8em; color:sandybrown; margin-right:10px;">작성자 : ${record.user_id} </p>
							</div>
						</div>
						<div class="reviewFooterUtil">
							<br> 
							<c:if test="${user_id == 'ADMIN' or user_id == record.user_id}">
							<a
								href="<c:url value='/TravelMaker/ReviewEdit.kosmo?review_no=${record.review_no}'/>">
								<img src="<c:url value='/images/reviewEdit.png'/>" alt="수정하기">
							</a>
							
							<span>&nbsp&nbsp&nbsp&nbsp</span><a href="javascript:isDelete();">
								<img src="<c:url value='/images/reviewDelete.png'/>" alt="삭제하기">
							</a><span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
							</c:if>
							<a
								href="<c:url value='/TravelMaker/ReviewSearch.kosmo'/>"> <img
								src="<c:url value='/images/reviewBack.png'/>" alt="목록보기">
							</a> <br> 
							<c:if test="${user_id == 'ADMIN' or user_id == record.user_id}">
							<a
								href="<c:url value='/TravelMaker/ReviewEdit.kosmo?review_no=${record.review_no}'/>">
								<span>수정하기</span>						
							</a>
							
							<span> &nbsp&nbsp </span> 
							
							<a	href="<c:url value='/TravelMaker/ReviewDelete.kosmo?review_no=${record.review_no}'/>">
						
								<span>삭제하기</span>
							</a>
							</c:if>
							<span> &nbsp&nbsp </span> <a href="<c:url value='/TravelMaker/ReviewSearch.kosmo'/>"><span>목록보기</span></a>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id=reviewBack>
	<div id="reviewBackImage"></div>
</div>
<script>

	function isDelete() {
		if (confirm("정말로 삭제 하시겠습니까?"))
			location.replace("<c:url value='/TravelMaker/ReviewDelete.kosmo?review_no=${record.review_no}'/>");
	}
</script>
<script>
$('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  return false;
	});
</script>