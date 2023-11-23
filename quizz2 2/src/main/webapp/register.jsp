<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>Sign Up</title>
				
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
	
			<!-- Sign up form -->
			<section class="signup">
				<div class="container">
					<div class="signup-content">
						<div class="signup-form">
							<h2 class="form-title">Sign up</h2>
						
							<form method="post" action="registerservlet" class="register-form"
								id="register-form">
								<div class="form-group">
									<label for="name"><i
										class="ptkgdm ptkgdm-account material-icons-name"></i></label> <input
										type="text" name="name" id="name" placeholder="Your Name" />
								</div>
								<div class="form-group">
									<label for="email"><i class="ptkgdm ptkgdm-email"></i></label> <input
										type="email" name="email" id="email" placeholder="Your Email" />
								</div>
								<div class="form-group">
									<label for="pass"><i class="ptkgdm ptkgdm-lock"></i></label> <input
										type="password" name="pass" id="pass" placeholder="Password" />
								</div>
								<div class="form-group">
									<label for="re-pass"><i class="ptkgdm ptkgdm-lock-outline"></i></label>
									<input type="password" name="re_pass" id="re_pass"
										placeholder="Repeat your password" />
								</div>
								<div class="form-group">
									<input type="checkbox" name="agree-term" id="agree-term"
										class="agree-term" /> <label for="agree-term"
										class="label-agree-term"><span><span></span></span>I
										agree all statements in <a href="#" class="term-service">Terms
											of service</a></label>
								</div>
							</form>
							<div class="form-group form-button">
   		 						<a href="login.jsp" id="signin" class="form-submit">Sign Up!</a>
							</div>
						</div>
						<div class="signup-image">
							<figure>
								<img src="images/vanlu.jpg" alt="sing up image">
							</figure>
							<a href="login.jsp" class="signup-image-link">I am already
								member</a>
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
			
			if (status == "success") {
				swal("congrats", "Account Created Succesfully", "success");
			}
		</script>	
	</body>
</html>