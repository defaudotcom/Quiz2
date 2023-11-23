<header id="header">
    <nav class="navbar navbar-expand-lg">
        <a href="index.jsp" class="navbar-brand">
			<img src="./images/paw.png" alt="logo"> pet kingdom
        </a>
        <button class="navbar-toggler"
            type="button"
                data-toggle="collapse"
                data-target="#navbarNavAltMarkup"
                aria-controls="navbarNavAltMarkup"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse justify-content-end" id="navbarNavAltMarkup">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="cart.jsp"><i class="fas fa-heart"></i> Cart <span class="badge badge-danger">${cart_list.size()}</span> </a></li>
				<li class="nav-item"><a class="nav-link" href="hello.jsp">Logout</a></li>
			</ul>
		</div>
	</nav>
</header>