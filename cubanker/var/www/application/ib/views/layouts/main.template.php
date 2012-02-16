<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- Generic Page Timemout
 Client side timeout management for the website.  There must be a serverside timeout to prevent some sorts of devious session theft.
 the $timeout is determined by the application controller so it may vary depending onw ehere one is in the website or it may remain
 set for the whoel website. No timeout applies if $timeout is set to 0.
-->
<script type="text/JavaScript">
function sessionTimeout() {
	glogout = true;
	alert('Session has expired due to inactivity - Please login again.');
	location.href = "<?php echo base_url(); ?>ib/main/login";
}

function timedOut(){
	g = setTimeout('sessionTimeout();', 10000); //if no user response in 20 seconds - force client side session logout
	if (!confirm('Do you wish to remain logged in?')) {
		if (glogout) {// this is work around to ensure second Alert displays before page is reloaded...<shrug>
			sessionTimeout();
		}
		location.href = "<?php echo base_url(); ?>ib/main/login";
	} else { location.reload(true); }
}

function resetTimer() {
	clearTimeout(t);
	var duration = "<?php echo $timeout; ?>"* 1000; //in milliseconds
	if (duration > 0) { 
		t=setTimeout('timedOut();',duration);
	}
}

var t; //global timer variable
var g; //other global timer variable
var glogout;
//link keep-alive events ...
 document.onload = resetTimer;
 document.onkeypress = resetTimer;
 document.onmousemove = resetTimer;
 document.onmouseclick = resetTimer;
</script>


<?php echo $css; ?>

<title><?php echo $title; ?></title>
</head>
<body>

<div id="header-wrap">
	<div id="header-container">
		<img src= <?php echo "'". base_url() . "images/cubanker-clean-banner.jpg'"; ?> height=90 width=250 align="left" />
		<div id="header">
			<h1><?php echo $heading; ?><em>communitybanker.org</em></h1>
			<?php echo $headingnav; ?>
		</div>
	</div>
</div>

<div id="leftsidebar">
	<div id="login"> <?php echo $login; ?> </div>
	<div id="left-nav"> <?php echo $menu; ?> </div>	
</div>

<div id="ie6-container-wrap">
	<div id="container">
		<div id="content"><?php echo $content; ?></div>
		<div id="sidebar"><?php echo $sidebar; ?></div>
	</div>
</div>

<div id="footer-wrap">
	<div id="footer-container"> 
		<div id="footer"><br>
				&copy;2009 <a href="http://www.communitybanker.org">www.communitybanker.org</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;								
				<a align="right" href= "<?php echo base_url(); ?>ib/main/disclaimer">Disclaimer</a>
		</div>
	</div>
</div>
</body>
</html>
