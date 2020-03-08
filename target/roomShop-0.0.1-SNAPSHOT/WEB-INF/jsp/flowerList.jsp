<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>柚子房产</title>

</head>
<body class="cms-index-index cms-home-page">

<%--头部--%>
<%@ include file="/WEB-INF/jsp/header.jsp" %>

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <ul>
                    <li class="home"><a href="${pageContext.request.contextPath}/" title="Go to Home Page">首页</a> <span>/</span>
                    </li>
                    <li><strong>楼盘店</strong></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumbs End -->


<!-- Main Container -->
<section class="main-container col2-left-layout">
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-xs-12 col-sm-push-3">
                <div class="category-description std">
                    <div class="slider-items-products">
                        <div id="category-desc-slider" class="product-flexslider hidden-buttons">
                            <div class="slider-items slider-width-col1 owl-carousel owl-theme">
                                <!-- Item -->
                                <div class="item"><a href="#"><img alt=""
                                                                   src="${pageContext.request.contextPath}/user/images/category-img1.jpg"></a>
                                    <div class="cat-img-title cat-bg cat-box">
                                        <div class="small-tag">Flowers 2020</div>
                                        <h2 class="cat-heading">特别的花给特别的你</h2>
                                        <p>感谢选择柚子房产,最好的回馈给您. </p>
                                    </div>
                                </div>
                                <!-- End Item -->
                                <!-- Item -->
                                <div class="item"><a href="#"><img alt=""
                                                                   src="${pageContext.request.contextPath}/user/images/category-img2.jpg"></a>
                                    <div class="cat-img-title cat-bg cat-box">
                                        <div class="small-tag">Flowers 2020</div>
                                        <h2 class="cat-heading">愿这些花</h2>
                                        <p>给您带来开心,带来快乐. </p>
                                    </div>
                                    <!-- End Item -->

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <article class="col-main">
                    <h2 class="page-heading"><span class="page-heading-title">楼盘热销</span></h2>
                    <div class="category-products">
                        <ul class="products-grid">
                            <c:forEach var="p" items="${pageBean.list }">
                                <li class="item col-lg-4 col-md-4 col-sm-4 col-xs-6">
                                    <div class="item-inner">
                                        <div class="item-img">
                                            <div class="item-img-info"><a class="product-image"
                                                                          title="Product Title Here"
                                                                          href="${ pageContext.request.contextPath }/flower/findByPid.action?pid=${p.pid }">
                                                <img
                                                        alt="Product Title Here"
                                                        src="${pageContext.request.contextPath}/${p.image }">
                                            </a>
                                                <div class="jtv-box-hover">
                                                    <ul class="add-to-links">
                                                        <li><a class="link-quickview" href="${ pageContext.request.contextPath }/flower/findByPid.action?pid=${p.pid }"><i
                                                                class="icon-magnifier-add icons"></i><span
                                                                class="hidden">Quick View</span></a>
                                                        </li>
                                                        <li><a class="link-wishlist" href="${ pageContext.request.contextPath }/flower/findByPid.action?pid=${p.pid }"><i
                                                                class="icon-heart icons"></i><span
                                                                class="hidden">Wishlist</span></a></li>
                                                        <li><a class="link-compare" href="${ pageContext.request.contextPath }/flower/findByPid.action?pid=${p.pid }"><i
                                                                class="icon-shuffle icons"></i><span
                                                                class="hidden">Compare</span></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item-info">
                                            <div class="info-inner">
                                                <div class="item-title"><a title="Product Title Here"
                                                                           href="single_product.html">${p.pname }</a>
                                                </div>
                                                <div class="item-content">
                                                    <div class="rating"><i class="fa fa-star-o"></i> <i
                                                            class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
                                                            class="fa fa-star-o"></i> <i class="fa fa-star-o"></i></div>
                                                    <div class="item-price">
                                                        <div class="price-box"><span class="regular-price"> <span
                                                                class="price"> ￥${p.shopPrice }</span> </span></div>
                                                    </div>
                                                    <div class="action">
                                                        <a class="button btn-cart" type="button" title="Add to Cart"
                                                           data-original-title="Add to Cart"
                                                           href="${ pageContext.request.contextPath }/flower/findByPid.action?pid=${p.pid }">
                                                            <span>查看详情</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <form id="productForm" action="${pageContext.request.contextPath}/" method="get">
                        <%--分页--%>
                        <div class="toolbar">
                            <div class="row">
                                <div class="col-sm-6 text-left">
                                    <ul class="pagination">
                                        <li class="active"><span> ${pageBean.page }</span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!--一级分类分页查询  -->
                        <c:if test="${cid != null }">
                            <c:if test="${pageBean.page != 1 }">
                                <a href="${ pageContext.request.contextPath }/flower/findFlowerByCid.action?cid=${cid }&page=1"
                                   class="firstPage">&nbsp;</a>
                                <a href="${ pageContext.request.contextPath }/flower/findFlowerByCid.action?cid=${cid }&page=${pageBean.page-1 }"
                                   class="previousPage">&nbsp;</a>
                            </c:if>
                            <c:forEach items="${pageBean.list }" var="i" begin="1" end="${pageBean.totalPage }">
                                <c:if test="${pageBean.page }!=i">
                                    <a href="${ pageContext.request.contextPath }/flower/findFlowerByCid.action"></a>
                                </c:if>

                                <c:if test="${pageBean.page }==i">
                                    <span class="${pageBean.currentPage }">#i</span>
                                </c:if>
                            </c:forEach>
                            <c:if test="${pageBean.page != pageBean.totalPage}">
                                <a class="nextPage"
                                   href="${ pageContext.request.contextPath }/flower/findFlowerByCid.action?cid=${cid }&page=${pageBean.page+1}">&nbsp;</a>
                                <a class="lastPage"
                                   href="${ pageContext.request.contextPath }/flower/findFlowerByCid?cid=${cid }&page=${pageBean.totalPage}">&nbsp;</a>
                            </c:if>
                        </c:if>
                        <!--二级分类分页查询  -->
                        <c:if test="${csid != null }">
                            <c:if test="${pageBean.page != 1 }">
                                <a href="${ pageContext.request.contextPath }/flower/findFlowerByCsid.action?csid=${csid }&page=1"
                                   class="firstPage">&nbsp;</a>
                                <a href="${ pageContext.request.contextPath }/flower/findFlowerByCsid.action?csid=${csid }&page=${pageBean.page-1 }"
                                   class="previousPage">&nbsp;</a>
                            </c:if>
                            <c:forEach items="${pageBean.list }" var="i" begin="1" end="${pageBean.totalPage }">
                                <c:if test="${pageBean.page }!=i">
                                    <a href="${ pageContext.request.contextPath }/flower/findFlowerByCid.action"></a>
                                </c:if>

                                <c:if test="${pageBean.page }==i">
                                    <span class="${pageBean.currentPage }">#i</span>
                                </c:if>
                            </c:forEach>
                            <c:if test="${pageBean.page != pageBean.totalPage}">
                                <a class="nextPage"
                                   href="${ pageContext.request.contextPath }/flower/findFlowerByCsid.action?csid=${csid }&page=${pageBean.page+1}">&nbsp;</a>
                                <a class="lastPage"
                                   href="${ pageContext.request.contextPath }/flower/findFlowerByCsid?csid=${csid }&page=${pageBean.totalPage}">&nbsp;</a>
                            </c:if>
                        </c:if>
                        <!--搜索框按照名称分类分页查询  -->
                        <c:if test="${csname != null }">
                            <c:if test="${pageBean.page != 1 }">
                                <a href="${ pageContext.request.contextPath }/findFlowerByCsName.action?csname=${csname }&page=1"
                                   class="firstPage">&nbsp;</a>
                                <a href="${ pageContext.request.contextPath }/findFlowerByCsName.action?csname=${csname }&page=${pageBean.page-1 }"
                                   class="previousPage">&nbsp;</a>
                            </c:if>
                            <c:forEach items="${pageBean.list }" var="i" begin="1" end="${pageBean.totalPage }">
                                <c:if test="${pageBean.page }!=i">
                                    <a href="${ pageContext.request.contextPath }/flower/findFlowerByCid.action"></a>
                                </c:if>

                                <c:if test="${pageBean.page }==i">
                                    <span class="${pageBean.currentPage }">#i</span>
                                </c:if>
                            </c:forEach>
                            <c:if test="${pageBean.page != pageBean.totalPage}">
                                <a class="nextPage"
                                   href="${ pageContext.request.contextPath }/findFlowerByCsName.action?csname=${csname }&page=${pageBean.page+1}">&nbsp;</a>
                                <a class="lastPage"
                                   href="${ pageContext.request.contextPath }/findFlowerByCsName?csname=${csname }&page=${pageBean.totalPage}">&nbsp;</a>
                            </c:if>
                        </c:if>
                    </form>
                </article>

            </div>
            <div class="sidebar col-sm-3 col-xs-12 col-sm-pull-9">
                <aside class="sidebar">
                    <div class="block block-cart">
                        <div class="block-title ">购房送花</div>
                        <div class="block-content">
                            <div class="summary">
                                <p class="amount">这里有<a href="#">3 种</a>花为您推荐.</p>
                                <p class="subtotal"><span class="label">总价格:</span> <span class="price">$0</span>
                                </p>
                            </div>
                            <div class="ajax-checkout">
                                <button class="button button-checkout" title="Submit" type="submit">
                                    <span>都是送您的</span></button>
                            </div>
                            <p class="block-subtitle">以下这三种 </p>
                            <ul>
                                <li class="item"><a href="#" title="Product Title Here" class="product-image"><img
                                        src="${pageContext.request.contextPath}/user/images/products/img10.jpg"
                                        alt="Product Title Here"></a>
                                    <div class="product-details">
                                        <div class="access"><a href="#" title="Remove This Item" class="jtv-btn-remove">
                                            <span class="icon"></span> Remove </a></div>
                                        <strong>1</strong> x <span class="price">$0</span>
                                        <p class="product-name"><a href="#">免费的</a></p>
                                    </div>
                                </li>
                                <li class="item"><a href="#" title="Product Title Here" class="product-image"><img
                                        src="${pageContext.request.contextPath}/user/images/products/img01.jpg"
                                        alt="Product Title Here"></a>
                                    <div class="product-details">
                                        <div class="access"><a href="#" title="Remove This Item" class="jtv-btn-remove">
                                            <span class="icon"></span> Remove </a></div>
                                        <strong>1</strong> x <span class="price">$0</span>
                                        <p class="product-name"><a href="#">免费的</a></p>

                                        <!--access clearfix-->
                                    </div>
                                </li>
                                <li class="item"><a href="#" title="Product Title Here" class="product-image"><img
                                        src="${pageContext.request.contextPath}/user/images/products/img05.jpg"
                                        alt="Product Title Here"></a>
                                    <div class="product-details">
                                        <div class="access"><a href="#" title="Remove This Item" class="jtv-btn-remove">
                                            <span class="icon"></span> Remove </a></div>
                                        <strong>1</strong> x <span class="price">$0</span>
                                        <p class="product-name"><a href="#">免费的</a></p>

                                        <!--access clearfix-->
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="custom-slider">
                        <div>
                            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li class="active" data-target="#carousel-example-generic" data-slide-to="0"></li>
                                    <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
                                    <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
                                </ol>
                                <div class="carousel-inner">
                                <div class="item active"><img
                                        src="${pageContext.request.contextPath}/user/images/products/img02.jpg">
                                </div>
                                <div class="item"><img
                                        src="${pageContext.request.contextPath}/user/images/products/img11.jpg">
                                </div>
                                <div class="item"><img
                                        src="${pageContext.request.contextPath}/user/images/products/img18.jpg">
                                </div>
                            </div>

                                <a class="left carousel-control" href="#" data-slide="prev"> <span class="sr-only">Previous</span>
                                </a> <a class="right carousel-control" href="#" data-slide="next"> <span
                                    class="sr-only">Next</span> </a></div>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
    </div>
</section>
<!-- Main Container End -->


<!-- 轮播 Logo -->
<div class="brand-logo">
    <div class="container">
        <div class="slider-items-products">
            <div id="brand-logo-slider" class="product-flexslider hidden-buttons">
                <div class="slider-items slider-width-col6">

                    <!-- Item -->
                    <div class="item"><a href="#"><img src="${pageContext.request.contextPath}/user/images/brand1.png"
                                                       alt="brand logo"> </a></div>
                    <!-- End Item -->

                    <!-- Item -->
                    <div class="item"><a href="#"><img src="${pageContext.request.contextPath}/user/images/brand2.png"
                                                       alt="brand logo"> </a></div>
                    <!-- End Item -->

                    <!-- Item -->
                    <div class="item"><a href="#"><img src="${pageContext.request.contextPath}/user/images/brand3.png"
                                                       alt="Image"> </a></div>
                    <!-- End Item -->

                    <!-- Item -->
                    <div class="item"><a href="#"><img src="${pageContext.request.contextPath}/user/images/brand4.png"
                                                       alt="brand logo"> </a></div>
                    <!-- End Item -->

                    <!-- Item -->
                    <div class="item"><a href="#"><img src="${pageContext.request.contextPath}/user/images/brand5.png"
                                                       alt="brand logo"> </a></div>
                    <!-- End Item -->

                    <!-- Item -->
                    <div class="item"><a href="#"><img src="${pageContext.request.contextPath}/user/images/brand6.png"
                                                       alt="brand logo"> </a></div>
                    <!-- End Item -->

                    <!-- Item -->
                    <div class="item"><a href="#"><img src="${pageContext.request.contextPath}/user/images/brand7.png"
                                                       alt="brand logo"> </a></div>
                    <!-- End Item -->

                    <!-- Item -->
                    <div class="item"><a href="#"><img src="${pageContext.request.contextPath}/user/images/brand8.png"
                                                       alt="brand logo"> </a></div>
                    <!-- End Item -->

                    <!-- Item -->
                    <div class="item"><a href="#"><img src="${pageContext.request.contextPath}/user/images/brand9.png"
                                                       alt="brand logo"> </a></div>
                    <!-- End Item -->

                    <!-- Item -->
                    <div class="item"><a href="#"><img src="${pageContext.request.contextPath}/user/images/brand10.png"
                                                       alt="brand logo"> </a></div>
                    <!-- End Item -->

                </div>
            </div>
        </div>
    </div>
</div>
<%--结束Logo--%>
<!-- 产品特点 -->
<div class="our-features-box">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-xs-12 col-sm-6">
                <div class="feature-box first"><i class="icon-plane icons"></i>
                    <div class="content">
                        <h6>快速当天交货</h6>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-xs-12 col-sm-6">
                <div class="feature-box"><i class="icon-earphones-alt icons"></i>
                    <div class="content">
                        <h6>为客户提供全天候支持</h6>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-xs-12 col-sm-6">
                <div class="feature-box"><i class="icon-like icons"></i>
                    <div class="content">
                        <h6>100%满意保证</h6>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-xs-12 col-sm-6">
                <div class="feature-box last"><i class="icon-tag icons"></i>
                    <div class="content">
                        <h6>每日优惠折扣</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--结束--%>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>