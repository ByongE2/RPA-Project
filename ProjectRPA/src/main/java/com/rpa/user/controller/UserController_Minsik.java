package com.rpa.user.controller;
//package com.rpa.user.controller;
//
//import java.io.BufferedReader;
//import java.io.BufferedWriter;
//import java.io.IOException;
//import java.io.InputStreamReader;
//import java.io.OutputStreamWriter;
//import java.net.HttpURLConnection;
//import java.net.URL;
//import java.util.HashMap;
//import java.util.Map;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import org.apache.catalina.manager.util.SessionUtils;
//import org.json.simple.JSONObject;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import com.google.gson.JsonElement;
//import com.google.gson.JsonObject;
//import com.google.gson.JsonParser;
//import com.rpa.user.domain.UserDTO;
//import com.rpa.user.service.UserService;
//
//import lombok.AllArgsConstructor;
//
//@Controller
//@RequestMapping("/user/*")
//@AllArgsConstructor
//public class UserController {
//
//   private static final Logger log = LoggerFactory.getLogger(UserController.class);
//   
//   @Autowired
//   private UserService service;
//   
//   
//   @GetMapping("/register")
//   public void register() throws Exception {
//      log.info("회원가입 페이지");
//   }
//   
//   @PostMapping("/register")
//   public String register(UserDTO user) throws Exception {
//      service.userJoin(user);
//      log.info("register success");
//      
//      return "redirect:/mainTEST";
//   }
//   
//   @RequestMapping(value = "/registerIdChk", method = RequestMethod.POST)
//   @ResponseBody
//   public String registerIDCheck(String id) throws Exception {
//      log.info("idCheckt");
//      
//      int result = service.userIDCheck(id);
//      
//      log.info("결과 : " + result);
//      
//      if(result != 0) {
//         return "fail"; //중복아이디 존재
//      }else {
//         return "success"; //중복아이디 없음
//      }
//   }
//   
//   @GetMapping("/login")
//   public String login() throws Exception {
//      log.info("로그인 페이지");
//      return "user/login";
//   }
//   
//   
//   @PostMapping("/login")
//   public String login(HttpServletRequest request, UserDTO user, RedirectAttributes rttr) throws Exception {
//      
//      log.info("로그인처리 + user : " + user);
//      
//      HttpSession session = request.getSession();
//      UserDTO login = service.userLogin(user);
//      
//      if(login == null) {
//         session.setAttribute("user", null);
//         rttr.addFlashAttribute("msg", false);
//      }else if(login.getGrade() == 1){
//         session.setAttribute("user", login);
//         return "redirect:/admin/main";
//         
//      }else {
//         session.setAttribute("user", login);
//         return "redirect:/mainTEST";
//      }
//      return "redirect:/";
//   }
//   
//   //아이디 찾기 페이지 이동
//   @RequestMapping("find_id_form")
//   public String findIdpage() {
//      return "user/findId";
//      
//   }
//   
//   //아이디 찾기
//   @RequestMapping(value = "find_id", method=RequestMethod.POST)
//   public String findId(UserDTO userDTO,Model model) throws Exception {
//      UserDTO user = service.findId(userDTO);
//      
//      if(user == null) { 
//         model.addAttribute("check", 1);
//      } else { 
//         model.addAttribute("check", 0);
//         model.addAttribute("id", user.getId());
//      }
//      
//      return "user/findId";
//      
//   }
//   
//   @RequestMapping(value="find_password_form")
//   public String findPwPage() {
//      return "user/findPassword";
//   }
//   
//   @RequestMapping(value="find_password", method=RequestMethod.POST)
//   public String findPw(UserDTO userDTO, Model model) throws Exception {
//      
//      UserDTO user = service.findPw(userDTO);
//      
//      if(user == null) { 
//         model.addAttribute("check", 1);
//      } else { 
//         model.addAttribute("check", 0);
//         model.addAttribute("updateid", user.getId());
//      }
//      
//      return "user/findPassword";
//      
//   }
//   
//    // 비밀번호 바꾸기 실행
//      @RequestMapping(value="update_password", method=RequestMethod.POST)
//      public String updatePasswordAction(@RequestParam(value="updateid", defaultValue="", required=false) 
//                                 String id,UserDTO user) throws Exception {
//         user.setId(id);
//         System.out.println(user);
//         service.updatePw(user);
//         return "user/findPasswordConfirm";
//      }
//      
//       // 비밀번호 바꾸기할 경우 성공 페이지 이동
//      @RequestMapping(value="check_password_view")
//      public String checkPasswordForModify(HttpSession session, Model model) {
//         UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
//         
//         if(loginUser == null) {
//            return "user/login";
//         } else {
//            return "/mainTEST";
//         }
//      }
//   
//   @GetMapping("/logout")
//   public String logout(HttpSession session) throws Exception {
//      
//      log.info("로그아웃 처리");
//      session.invalidate();
//      
//      return "redirect:/mainTEST";
//   }
//   
//   @RequestMapping(value="/user/kakaologin")
//    public String kakaoLogin() {
//        StringBuffer loginUrl = new StringBuffer();
//        loginUrl.append("https://kauth.kakao.com/oauth/authorize?client_id=");
//        loginUrl.append("413e8a35b4572f164e0f426232a72f19"); 
//        loginUrl.append("&redirect_uri=");
//        loginUrl.append("http://localhost:8080/user/kakaologin"); 
//        loginUrl.append("&response_type=code");
//        
//        return "redirect:"+loginUrl.toString();
//    }
//}
//
//
