package com.rpa.user.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.manager.util.SessionUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.rpa.user.domain.UserDTO;
import com.rpa.user.service.UserService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {

	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService service;
	
	
	@GetMapping("/register")
	public void register() throws Exception {
		log.info("회원가입 페이지");
	}
	
	@PostMapping("/register")
	public String register(UserDTO user) throws Exception {
		service.userJoin(user);
		log.info("register success");
		
		return "redirect:/mainTEST";
	}
	
	@RequestMapping(value = "/registerIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String registerIDCheck(String id) throws Exception {
		log.info("idCheckt");
		
		int result = service.userIDCheck(id);
		
		log.info("결과 : " + result);
		
		if(result != 0) {
			return "fail"; //중복아이디 존재
		}else {
			return "success"; //중복아이디 없음
		}
	}
	
	@GetMapping("/login")
	public String login() throws Exception {
		log.info("로그인 페이지");
		return "user/login";
	}
	
	
	@PostMapping("/login")
	public String login(HttpServletRequest request, UserDTO user, RedirectAttributes rttr) throws Exception {
		
		log.info("로그인처리 + user : " + user);
		
		HttpSession session = request.getSession();
		UserDTO login = service.userLogin(user);
		
		if(login == null) {
			session.setAttribute("user", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			session.setAttribute("user", login);
		}
		return "redirect:/mainTEST";
//		return "redirect:/";
	}
	
	//아이디 찾기 페이지 이동
	@RequestMapping("find_id_form")
	public String findIdpage() {
		return "user/findId";
		
	}
	
	//아이디 찾기
	@RequestMapping(value = "find_id", method=RequestMethod.POST)
	public String findId(UserDTO userDTO,Model model) throws Exception {
		UserDTO user = service.findId(userDTO);
		
		if(user == null) { 
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("id", user.getId());
		}
		
		return "user/findId";
		
	}
	
	@RequestMapping(value="find_password_form")
	public String findPwPage() {
		return "user/findPassword";
	}
	
	@RequestMapping(value="find_password", method=RequestMethod.POST)
	public String findPw(UserDTO userDTO, Model model) throws Exception {
		
		UserDTO user = service.findPw(userDTO);
		
		if(user == null) { 
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("updateid", user.getId());
		}
		
		return "user/findPassword";
		
	}
	
	 // 비밀번호 바꾸기 실행
		@RequestMapping(value="update_password", method=RequestMethod.POST)
		public String updatePasswordAction(@RequestParam(value="updateid", defaultValue="", required=false) 
											String id,UserDTO user) throws Exception {
			user.setId(id);
			System.out.println(user);
			service.updatePw(user);
			return "user/findPasswordConfirm";
		}
		
	    // 비밀번호 바꾸기할 경우 성공 페이지 이동
		@RequestMapping(value="check_password_view")
		public String checkPasswordForModify(HttpSession session, Model model) {
			UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
			
			if(loginUser == null) {
				return "user/login";
			} else {
				return "/mainTEST";
			}
		}
	
	
	
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		
		log.info("로그아웃 처리");
		session.invalidate();
		
		return "redirect:/mainTEST";
	}
	
	@RequestMapping(value="/user/kakaologin")
    public String kakaoLogin() {
        StringBuffer loginUrl = new StringBuffer();
        loginUrl.append("https://kauth.kakao.com/oauth/authorize?client_id=");
        loginUrl.append("413e8a35b4572f164e0f426232a72f19"); 
        loginUrl.append("&redirect_uri=");
        loginUrl.append("http://localhost:8080/user/kakaologin"); 
        loginUrl.append("&response_type=code");
        
        return "redirect:"+loginUrl.toString();
    }
	
	 @RequestMapping(value = "/kakao_callback", method = RequestMethod.GET)
	    public String redirectkakao(@RequestParam String code, HttpSession session) throws IOException {
	            System.out.println(code);
	            
	            //접속토큰 get
	            String kakaoToken = kakaoService.getReturnAccessToken(code);
	            
	            //접속자 정보 get
	            Map<String,Object> result = kakaoService.getUserInfo(kakaoToken);
	            System.out.println("컨트롤러 출력"+result.get("nickname")+result.get("profile_image"));
	            SessionConfigVO configVO =new SessionConfigVO();
	            configVO.setUser_name((String)result.get("nickname"));
	            configVO.setProfile_img((String)result.get("profile_image"));
	            
	            session.setAttribute("sessionConfigVO", configVO);
	            /*로그아웃 처리 시, 사용할 토큰 값*/
	            session.setAttribute("kakaoToken", kakaoToken);
	        return "redirect:/";
	    }

	
	
	
//	@GetMapping("/getkakao")
//	@ResponseBody
//	public String getkakao(HttpServletRequest request) throws Exception {
//		String reqUrl = 
//				"https://kauth.kakao.com/oauth/authorize"
//				+ "?client_id=413e8a35b4572f164e0f426232a72f19"
//				+ "&redirect_uri=http://localhost:8181/user/kakaologin"
//				+ "&response_type=code";
//		
//		return reqUrl;
//	}
//	// 카카오 연동정보 조회
//		@RequestMapping(value = "/kakaologin")
//		public String oauthKakao(
//				@RequestParam(value = "code", required = false) String code
//				, Model model) throws Exception {
//
//			System.out.println("#########" + code);
//	        String access_Token = getAccessToken(code);
//	        System.out.println("###access_Token#### : " + access_Token);
//	        
//	        
//	        HashMap<String, Object> userInfo = getUserInfo(access_Token);
//	        System.out.println("###access_Token#### : " + access_Token);
//	        System.out.println("###userInfo#### : " + userInfo.get("email"));
//	        System.out.println("###nickname#### : " + userInfo.get("nickname"));
//	       
//	        JSONObject kakaoInfo =  new JSONObject(userInfo);
//	        model.addAttribute("kakaoInfo", kakaoInfo);
//	        
//	        return "/mainTEST"; //본인 원하는 경로 설정
//		}
//		
//	    //토큰발급
//		public String getAccessToken (String authorize_code) {
//	        String access_Token = "";
//	        String refresh_Token = "";
//	        String reqURL = "https://kauth.kakao.com/oauth/token";
//
//	        try {
//	            URL url = new URL(reqURL);
//
//	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//
//	            //  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
//	            conn.setRequestMethod("POST");
//	            conn.setDoOutput(true);
//
//	            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
//	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
//	            StringBuilder sb = new StringBuilder();
//	            sb.append("grant_type=authorization_code");
//	            sb.append("&client_id=413e8a35b4572f164e0f426232a72f19");  //본인이 발급받은 key
//	            sb.append("&redirect_uri=http://localhost:8181/user/kakaologin");     // 본인이 설정해 놓은 경로
//	            sb.append("&code=" + authorize_code);
//	            bw.write(sb.toString());
//	            bw.flush();
//
//	            //    결과 코드가 200이라면 성공
//	            int responseCode = conn.getResponseCode();
//	            System.out.println("responseCode : " + responseCode);
//
//	            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
//	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//	            String line = "";
//	            String result = "";
//
//	            while ((line = br.readLine()) != null) {
//	                result += line;
//	            }
//	            System.out.println("response body : " + result);
//
//	            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
//	            JsonParser parser = new JsonParser();
//	            JsonElement element = parser.parse(result);
//
//	            access_Token = element.getAsJsonObject().get("access_token").getAsString();
//	            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
//
//	            System.out.println("access_token : " + access_Token);
//	            System.out.println("refresh_token : " + refresh_Token);
//
//	            br.close();
//	            bw.close();
//	        } catch (IOException e) {
//	            // TODO Auto-generated catch block
//	            e.printStackTrace();
//	        }
//
//	        return access_Token;
//	    }
//		
//	    //유저정보조회
//	    public HashMap<String, Object> getUserInfo (String access_Token) {
//
//	        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
//	        HashMap<String, Object> userInfo = new HashMap<String, Object>();
//	        String reqURL = "https://kapi.kakao.com/v2/user/me";
//	        try {
//	            URL url = new URL(reqURL);
//	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//	            conn.setRequestMethod("GET");
//
//	            //    요청에 필요한 Header에 포함될 내용
//	            conn.setRequestProperty("Authorization", "Bearer " + access_Token);
//
//	            int responseCode = conn.getResponseCode();
//	            System.out.println("responseCode : " + responseCode);
//
//	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//
//	            String line = "";
//	            String result = "";
//
//	            while ((line = br.readLine()) != null) {
//	                result += line;
//	            }
//	            System.out.println("response body : " + result);
//
//	            JsonParser parser = new JsonParser();
//	            JsonElement element = parser.parse(result);
//
//	            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
//	            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
//
//	            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
//	            String email = kakao_account.getAsJsonObject().get("email").getAsString();
//	            
//	            userInfo.put("accessToken", access_Token);
//	            userInfo.put("nickname", nickname);
//	            userInfo.put("email", email);
//
//	        } catch (IOException e) {
//	            // TODO Auto-generated catch block
//	            e.printStackTrace();
//	        }
//
//	        return userInfo;
//	    }
 }
