<%@page import="jm_dao.ProductInfoDAO"%>
<%@page import="jm_dto.ProductInfoDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//int price=ProductInfoDAO.getDAO().selectIdPrice("1");
	//String imgNm=ProductInfoDAO.getDAO().selectIdProdNm("1");
	//String imgPath="assets/img/"+imgNm+".PNG";
	
	int price=1000;
	String imgPath="assets/img/disney.PNG";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8" />
       
    </head>
    <body id="page-top">
       

       
        <!-- Shopping Grid-->
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">큰조명</h2>
                    <h3 class="section-subheading text-muted">따뜻한 분위기 조명</h3>
                </div>
                <div class="row">
			
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal1">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="<%=imgPath%>" alt="" />
                            </a>
                            
                       
                             <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">크크크크은조명</div>
                                <div class="portfolio-caption-subheading text-muted">아주 크은 조명</div>
                           
                            </div>
                            
        
                           	
                        </div>
                    </div>
                    			<div class="portfolio-item">
                    			<p>상품 가격 : <%=price%> 원</p>
                    		
                    			상품 수량 :  <select name="select" >
        						<option value="1" selected="selected">1</option>
         						<option value="2" >2</option>
         						<option value="3">3</option>
         						<option value="4">4</option>
        						<option value="5">5</option>
     							</select>
     							
                  				</div>
                  				<button type="button" id="cartBtn"><img src="asset/img/shopping/cart.gif"></button>

            </div>
   
       				
        </section>

       				
       	
      
        <!-- Portfolio Modals-->
        <!-- Modal 1-->
        <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-dismiss="modal"><img src="assets/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project Details Go Here-->
                                    <h2 class="text-uppercase">조명test</h2>
                                    <p class="item-intro text-muted">큰 조명.</p>
                                    <img class="img-fluid d-block mx-auto" src="assets/img/portfolio/01-full.jpg" alt="" />
                                    <p>조오명... </p>
                                    <ul class="list-inline">
                                        <li>회사이름 : 크은조명</li>
                                        <li>전화번호 : 010-1234-5678</li>
                                        <li>Category : 크은 조명</li>
                                    </ul>
                                    <button class="btn btn-primary" data-dismiss="modal" type="button">
                                        <i class="fas fa-times mr-1"></i>
                                        창닫기
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="assets/mail/jqBootstrapValidation.js"></script>
        <script src="assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>

<script type="text/javascript">
	
</script>
