<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
   		html, body {
   			height: 100%;
    		background-image: url("/images/shutterstock_726719677.jpg");
    		background-size: cover;
    		}
    	.jumbotron {
    		text-align: center;
    		opacity: 0.8;
    	}	
    	
    	@media screen and (min-width: 768px)
			bootstrap.css:4988
			.jumbotron {
			    padding-top: 48px;
			    padding-bottom: 48px;
		}
    		
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

		//============= "�α���"  Event ���� =============
		$( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
				if(id == null || id.length <1) {
					alert('ID �� �Է����� �����̽��ϴ�.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('�н����带 �Է����� �����̽��ϴ�.');
					$("#password").focus();
					return;
				}
				
				$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			});
		});	
		
		
		//============= ȸ��������ȭ���̵� =============
		$( function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		
		
		//////////////////////////////////////���̽��� �α��� /////////////////////////////////////
		
		function checkLoginState() {
		    FB.getLoginStatus(function(response) {
		      statusChangeCallback(response);
		  	  }
			);
		  }

		  window.fbAsyncInit = function() {
		  FB.init({
		    appId      : '157517288201485',
		    cookie     : true,  // enable cookies to allow the server to access 
		    xfbml      : true,  // parse social plugins on this page
		    version    : 'v2.11' // use graph api version 2.8
		  });


		  FB.getLoginStatus(function(response) {
		    statusChangeCallback(response);
		  });

		  };
		
		
		function statusChangeCallback(response) {
		    console.log('statusChangeCallback');
		    console.log(response);
		    
		    if (response.status === 'connected') {
		    	console.log('�α��� ����');
		    	console.log(response.authResponse.accessToken);
		    	//testAPI();
		    	handleFacebookRegist(response);
		      
		    } else {
		    	console.log('�α��� �ϼ���');
		    }
		  }

			
		  (function(d, s, id) {
			  var js, fjs = d.getElementsByTagName(s)[0];
			  if (d.getElementById(id)) return;
			  js = d.createElement(s); js.id = id;
			  js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.11&appId=157517288201485';
			  fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));

		  function testAPI() {
		    console.log('Welcome!  Fetching your information.... ');
			}
		  
		  function handleFacebookRegist(response) {
			  console.log(response.authResponse.accessToken);
			  var accessToken = response.authResponse.accessToken;
			  var userId;
			  
			  FB.api('/me', function (user) {
				userId = user.id;
				alert(userId);
			  self.location = "/user/facebooklogin?userId="+userId;
			})
		  }
	</script>		
	
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->	
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
		
	 	 	<div class="col-md-12">
	 	 	
		 	 	<br/><br/>
				
				<div class="jumbotron">	 	 	
		 	 		<h1 class="text-center">�� &nbsp;&nbsp;�� &nbsp;&nbsp;��</h1>

			        <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="userId" class="col-sm-4 control-label">�� �� ��</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" name="userId" id="userId"  placeholder="���̵�" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="password" class="col-sm-4 control-label">�� �� �� ��</label>
					    <div class="col-sm-4">
					      <input type="password" class="form-control" name="password" id="password" placeholder="�н�����" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-4 text-center">
					      <button type="button" class="btn btn-primary"  >�� &nbsp;�� &nbsp;��</button>
					      <a class="btn btn-primary btn" href="#" role="button">ȸ &nbsp;�� &nbsp;�� &nbsp;��</a>
					    </div>
					  </div>
					  
					  <div class="col-sm-offset-4  col-sm-4 text-center">
						<fb:login-button scope="public_profile,email" class="fb-login-button"  data-size="large" data-button-type="continue_with"  onlogin="checkLoginState();">
						</fb:login-button>
 					</div>
					</form>
			   	 </div>
			
			</div>
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>