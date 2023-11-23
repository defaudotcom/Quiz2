<!DOCTYPE html>
<html lang="en">
	<head>
 		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>Login</title>
				
		<!-- Main css -->
		<link rel="stylesheet" href="login.css">
	</head>
	<body>
		<header id="header">
		    <nav class="navbar navbar-expand-lg">
		        <a class="navbar-brand">
		        	<h2>
		        		<img src="./images/paw.png" alt="logo"> pet kingdom
		        	</h2>
		        </a>
			</nav>
		</header>		
		
    	<input type="hidden" id="status" value="<% request.getAttribute("status"); %>">
		
		<div class="main">
	
			<!-- Sing in  Form -->
			<section class="sign-in">
				<div class="container">
					<div class="signin-content">
						<div class="signin-image">
							<figure>
								<img id=kimmi src="images/kuya.jpg" alt="sing up image">
							</figure>
							<a href="register.jsp" class="signup-image-link">Create an
								account</a>
						</div>
	
						<div class="signin-form">
							<h2 class="form-title">Login Page</h2>
							<form method="post" action="signinservlet" class="register-form"
								id="login-form">
								<div class="form-group">
									<label for="username"><i
										class="ptkgdm ptkgdm-account material-icons-name"></i></label> <input
										type="text" name="username" id="username"
										placeholder="Your Name" />
								</div>
								<div class="form-group">
									<label for="password"><i class="ptkgdm ptkgdm-lock"></i></label> <input
										type="password" name="password" id="password"
										placeholder="Password" />
								</div>
								<div class="form-group">
									<input type="checkbox" name="remember-me" id="remember-me"
										class="agree-term" /> <label for="remember-me"
										class="label-agree-term"><span><span></span></span>Remember
										me</label>
								</div>
							</form>
							
							<div class="form-group form-button">
   		 						<a href="index.jsp" id="signin" class="form-submit">Log in</a>
							</div>
							
							
							<div class="social-login">
								<span class="social-label">Or login with</span>
								<ul class="socials">
									<li><a href="#"><i
											class="display-flex-center ptkgdm ptkgdm-facebook"></i></a></li>
									<li><a href="#"><i
											class="display-flex-center ptkgdm ptkgdm-twitter"></i></a></li>
									<li><a href="#"><i
											class="display-flex-center ptkgdm ptkgdm-google"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</section>
	
		</div>
	
		<!-- JS -->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="js/main.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"> </script>
		<link rel="stylesheet" href="alert/dist/sweetalert.css"> 
		
		<script type="text/javascript">
			var status = document.getElementbyid("status").value;
			
			if (status == "failed") {
				swal("sorry", "wrong password/username", "failed");
			}
		</script>	
		
	</body>
</html>