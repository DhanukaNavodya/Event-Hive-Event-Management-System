
    <nav class="header">
      <div class="header-container">
        <div class="logo-container">
          <a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/assets/logo.svg" alt="logo" /></a>
        </div>
        <div class="nav-links-container">
          <a href="${pageContext.request.contextPath}/index.jsp" class="navitems">Home</a>
          <a href="${pageContext.request.contextPath}/allEvents.jsp" class="navitems">Events</a>
          <a href="${pageContext.request.contextPath}/createEvent.jsp" class="navitems">Create Events</a>
          <a href="${pageContext.request.contextPath}/about.jsp" class="navitems">About</a>
        </div>
        <div class="user-account">
        	<%
        		
				if (session.getAttribute("userSessionEmail") == null) { %>
				    <button id="loginbtn">Sign in</button>
				    <button id="signupbtn">Sign up</button>
				<% } else if (session.getAttribute("userSessionRole") != null && session.getAttribute("userSessionRole").equals("admin")) { %>
				    <a href="${pageContext.request.contextPath}/adminDashboard.jsp" id="logoutbtn">Admin</a>
				<% } else { %>
				    <a href="${pageContext.request.contextPath}/userProfile.jsp?userId=<%= session.getAttribute("userSessionId") %>" id="logoutbtn"><img src="${pageContext.request.contextPath}/assets/header/profilepage.png" alt="Profile" id="profile-page-icon" /></a>
				<% } 
			%>

          
        </div>
      </div>
    </nav>

    <!--register popup-->

    <div class="login-page" id="registerpage">
      <img src="${pageContext.request.contextPath}/assets/header/login.png" alt="" id="login-page-image" />
      <div class="sign-page-form-section">
        <img src="${pageContext.request.contextPath}/assets/logo.svg" alt="" class="sign-page-logo" />
        <div class="sign-page-title">Sign Up to Event Hive</div>
        <form action="registerController" method="post" class="sign-page-form">
          <div class="sign-page-form-inputs">
            <div class="sign-page-form-input-label">Name</div>
            <input type="text" class="sign-page-form-input" name="reg_name"/>
          </div>
          <div class="sign-page-form-inputs">
            <div class="sign-page-form-input-label">Email</div>
            <input type="text" class="sign-page-form-input" name="reg_email"/>
          </div>
          <div class="sign-page-form-inputs">
            <div class="sign-page-form-input-label">Password</div>
            <input type="text" class="sign-page-form-input" name="reg_password"/>
          </div>
          <div class="sign-page-form-inputs">
            <div class="sign-page-form-input-label">Confirm Password</div>
            <input type="text" class="sign-page-form-input" name="reg_confirm_password"/>
          </div>
          <input type="submit" class="sign-page-form-submit" value="Sign Up" id="reg_submit_btn"/>
        </form>
        <button id="logintiregister">Already have an account?</button>
      </div>
    </div>

    <!--login pop up-->

    <div class="login-page" id="login-page">
      <div class="sign-page-form-section">
        <img src="${pageContext.request.contextPath}/assets/logo.svg" alt="" class="sign-page-logo" />
        <div class="sign-page-title">Sign In to Event Hive</div>
        <form action="loginController" method="post" class="sign-page-form">
          <div class="sign-page-form-inputs">
            <div class="sign-page-form-input-label">Email</div>
            <input type="text" class="sign-page-form-input" name="login_email"/>
          </div>
          <div class="sign-page-form-inputs">
            <div class="sign-page-form-input-label">Password</div>
            <input type="text" class="sign-page-form-input" name="login_password"/>
          </div>
          <input type="submit" class="sign-page-form-submit" value="Sign In" id="login_submit_btn"/>
        </form>
        <button id="registertologin">Don't have an account?</button>
      </div>
      <img src="${pageContext.request.contextPath}/assets/header/registerpage.png" alt="" id="reg-page-image" />
    </div>

	
