<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<a id="kakao-login-btn"></a>
	<button class="api-btn" onclick="unlinkApp()">로그아웃</button>
	<div id="result"></div>
	
<script type="text/javascript">
// 로그아웃
  function unlinkApp() {
    Kakao.API.request({
      url: '/v1/user/unlink',
      success: function(res) {
        alert('success: ' + JSON.stringify(res))
      },
      fail: function(err) {
        alert('fail: ' + JSON.stringify(err))
      },
    })
  }
</script>
 
<script type="text/javascript">
// 로그인
	Kakao.init('8f269760785db490a82fbbfa1c9dc61e');
	console.log(Kakao.isInitialized());
	Kakao.Auth.createLoginButton({
    	container: '#kakao-login-btn',
    	success: function(authObj) {
      		Kakao.API.request({
        		url: '/v2/user/me',
        		success: function(result) {
          			$('#result').append(result);
          			id = result.id;
          			connected_at = result.connected_at;
          			kakao_account = result.kakao_account;
          			$('#result').append(kakao_account);
          			resultdiv="<h2>로그인 성공 !!";
          			resultdiv += '<h4>id: '+id+'<h4>';
          			resultdiv += '<h4>connected_at: '+connected_at+'<h4>';
          			nick = kakao_account.profile.nickname;
          			resultdiv += '<h4>nick: '+nick+'<h4>';
          			$('#result').append(resultdiv);		          
        		},
        		fail: function(error) {
          			alert('login success, but failed to request user information: ' +JSON.stringify(error))
        	},
		})
    },
    fail: function(err) {
      alert('failed to login: ' + JSON.stringify(err))
    },
  })
</script>
