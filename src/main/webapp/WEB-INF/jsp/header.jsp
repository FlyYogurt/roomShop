<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>头部</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="${pageContext.request.contextPath}/user/css/bootstrap.min.css?" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/user/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/user/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/user/css/simple-line-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/user/css/owl.carousel.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/user/css/owl.transitions.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/user/css/flexslider.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/user/css/cloud-zoom.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/user/css/revolution-slider.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/user/css/jquery-ui.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/user/css/jquery.fancybox.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/user/css/quick_view_popup.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/user/css/blogmate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/user/css/jtv-mobile-menu.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/user/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/user/css/responsive.css" rel="stylesheet">
</head>
<body>

<!-- Header -->
<header>
    <div class="header-container">
        <div class="header-top">
            <div class="container">
                <div class="row">
                    <!-- Header Language -->
                    <div class="col-xs-12 col-sm-6">
                        <div class="welcome-msg hidden-xs" style="color: #c62b26">Welcome to Shaddock mall! </div>

                    </div>
                    <div class="col-xs-6 hidden-xs">
                        <!-- Header Top Links -->
                        <div class="jtv-top-links">
                            <div class="links">
                                <ul>
                                    <c:if test="${existUser.username == null }">

                                        <li> <a title="登录" href="${ pageContext.request.contextPath }/user/toLogin"><span class="hidden-xs">登录</span></a> </li>

                                        <li> <a title="注册" href="${ pageContext.request.contextPath }/user/toRegist"><span class="hidden-xs">注册</span></a> </li>
                                    </c:if>

                                    <c:if test="${existUser.username != null }">

                                        <li><span class="hidden-xs">欢迎您<font color="red"> ${existUser.username}</font></span></li>

                                        <li ><a href="${ pageContext.request.contextPath }/user/quit"><span class="hidden-xs">退出</span></a></li>

                                        <li><a href="${ pageContext.request.contextPath }/user/ToEditPassword.action"><span class="hidden-xs">修改密码</span></a></li>

                                        <li><a href="${ pageContext.request.contextPath }/cartController/myCart.action"><span class="hidden-xs">购物车</span></a>

                                        <li><a href="${ pageContext.request.contextPath }/orderController/findByUid.action?page=1"><span class="hidden-xs">我的订单</span></a></li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                        <!-- End Header Top Links -->
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <div class="jtv-top-cart-box">
                    </div>
                </div>
                <div class="col-lg-6 col-md-4 col-sm-4 col-xs-12 jtv-logo-box">
                    <!-- Header Logo -->
                    <div class="logo"> <a title="logo" href="${pageContext.request.contextPath}/"><img alt="eCommerce" src="${pageContext.request.contextPath}/user/images/logo.png"> </a></div>
                    <!-- End Header Logo -->
                </div>
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12 hidden-xs">
                    <div class="search-box">
                        <form action="${ pageContext.request.contextPath }/findFlowerByCsName.action?page=1" method="POST" id="search_mini_form" name="Categories">
                            <input type="text" placeholder="搜索你想找的楼盘名称/例:别墅.海景房" maxlength="70" name="csname" id="search" value="${csname}">
                            <button type="submit" class="search-btn-bg"><span class="glyphicon glyphicon-search"></span>&nbsp;</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- end header -->

<!-- Navigation -->
<nav>
    <div class="container">
        <div class="mm-toggle-wrap">
            <div class="mm-toggle"><i class="fa fa-align-justify"></i><span class="mm-label">Menu</span> </div>
        </div>
        <div class="nav-inner">
            <!-- BEGIN NAV -->
            <ul id="nav" class="hidden-xs">

                <li class="drop-menu"><a href="${pageContext.request.contextPath}/" class="level-top active"><span>首页</span></a></li>
                <c:forEach items="${cList }" var="c">
                    <li class="drop-menu"><a href=" ${ pageContext.request.contextPath }/flower/findFlowerByCid.action?cid=${c.cid}&page=1"><span>${c.cname }</span></a></li>
                </c:forEach>
                <li class="drop-menu"><a href="${ pageContext.request.contextPath }/help"><span>帮你选花</span></a></li>
                <li class="mega-menu"> <a class="level-top" href="${ pageContext.request.contextPath }/html/family.jsp"><span>浪漫之家</span></a>
                </li>
                <li class="mega-menu"> <a class="level-top" href="${pageContext.request.contextPath}/flower/findFlowerByCid.action?cid=1&page=1"><span>柚子推荐</span></a>

                </li>

                <li class="nav-custom-link mega-menu"> <a href="${pageContext.request.contextPath}/html/about.jsp" class="level-top"> <span>关于我们</span> </a>

                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- end nav -->

</body>
</html>
