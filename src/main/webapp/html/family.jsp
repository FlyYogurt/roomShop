<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>浪漫之家</title>

<style>
body {
	overflow: hidden;
	margin: 0 auto;
	background: url('images/16.jpg') no-repeat;
	background-attachment:fixed;
	background-size:cover; 
	-moz-background-size:cover; 
	-webkit-background-size:cover;
}

.snowfall-flakes:before {
	content: "";
	/*绝对定位*/
	position: absolute;
	left: 0px;
	top: 0px;
	width: 10px;
	height: 16px;
	transform: rotate(-45deg);
	background-color: red;
	border-radius: 5px 5px 1px 1px;
}

.snowfall-flakes:after {
	content: ""; /*激活伪元素的必要因素*/
	position: absolute;
	left: 0px;
	top: 0px;
	width: 10px;
	height: 16px;
	transform: translateX(4.3px) rotate(45deg);
	background-color: red;
	border-radius: 5px 5px 1px 1px;
}
</style>
    <audio autoplay="autoplay" loop="loop">
        <source src="music/circulation.ogg" type="audio/ogg" />
    </audio>
</head>

<body>

<div class="wrap"></div>

<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/snowfall.jquery.min.js"></script>
<script type="text/javascript">
    $(document).snowfall({ flakeCount: 100, maxSpeed: 5 });
</script>
</body>
</html>