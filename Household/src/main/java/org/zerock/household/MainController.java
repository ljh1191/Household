package org.zerock.household;

import java.io.UnsupportedEncodingException;
import java.util.Calendar;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.EmailVO;
import org.zerock.domain.HomeVO;
import org.zerock.domain.HouseholdVO;
import org.zerock.domain.MailHandler;
import org.zerock.domain.MemberVO;
import org.zerock.domain.TempKey;
import org.zerock.service.MainService;

@Controller
@RequestMapping("/main/*")
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	private MainService service;
	@Autowired
    private JavaMailSender mailSender;
	
	@GetMapping("/main")
	public String mainform() {
		logger.info("메인화면으로 이동");
		return "main/main";
	}
	
	@GetMapping("/index")
	public String index() {
		logger.info("인덱스화면으로 이동");
		return "main/index";
	}
	
	@GetMapping("/loginform")
	public String loginform() {
		logger.info("로그인으로 이동");
		return "main/login";
	}
	
	@GetMapping("/signupform")
	public String signupform() {
		logger.info("회원가입으로 이동");
		return "main/signup";
	}
	
	@GetMapping("/chart")
	public String chartform() {
		logger.info("차트화면으로 이동");
		return "chart/chart";
	}
	
	@PostMapping("/signup")
	public @ResponseBody String signup(String name,String password,String email) {
		int flag = service.idcheck(email);
		if(flag == 1) {
			logger.info("이미 가입된 이메일");
			return "-1";
		}
		MemberVO vo = new MemberVO();
		vo.setName(name);
		vo.setPassword(password);
		vo.setEmail(email);
		service.signup(vo);
		logger.info("회원가입 완료");
		return "1";
	}
	
	@PostMapping("/login")
	public @ResponseBody String login(String email,String password,HttpSession session) {
		MemberVO vo = new MemberVO();
		vo.setPassword(password);
		vo.setEmail(email);
		MemberVO check = service.login(email);
		if(check != null) {
			if(password.equals(check.getPassword())) {
				//로그인성공
				session.setAttribute("vo", check);
				return "1";
			}
			//비밀번호 틀림
			return "0";
		}
		//회원아님
		return "-1";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main/index";
	}
	
	@GetMapping("/forgetpassword")
	public String forgetpassword() {
		logger.info("비밀번호 찾기로 이동");
		return "main/forgetpassword";
	}
	
	@PostMapping("/forgetpassword")
	public @ResponseBody String forgetpassword(String email) {
		//회원가입 여부확인
		MemberVO check = service.login(email);
		if(check == null) {
			return "-1";
		}
		String key = new TempKey().getKey(50, false); // 인증키 생성
		System.out.println("인증키 : "+key);
		service.createAuthKey(email, key);
		try {
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("가계부 프로그램 인증메일입니다.");
			sendMail.setText(
					new StringBuffer().append("<h1>비밀번호 찾기 메일인증</h1>").append("").append("인증키 :").append("").append(key).toString());
			try {
				sendMail.setFrom(email, "가계부 프로그램");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			sendMail.setTo(email);
			sendMail.send();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "1";
	}
	
	@PostMapping("/authkey")
	public @ResponseBody String authkey(String authkey,String email) {
		int membernum = service.getMembernum(email);
		EmailVO vo = service.authkeyselect(membernum);
		if(vo.getAuthkey().equals(authkey)) {
			return "1";
		}
		return "0";
	}
	
	@GetMapping("/passwordchangeForm")
	public String passwordchangeForm(String email,Model mo) {
		mo.addAttribute("email", email);
		return "main/passwordchange";
	}
	
	@PostMapping("/passwordchange")
	public @ResponseBody String passwordchange(String email,String password,String newpassword) {
		System.out.println("email : " +email);
		int passcheck = service.passCheck(email,password);
		if(passcheck == 1) {
			int num = service.getMembernum(email);
			service.passupdate(num,newpassword);
			logger.info("비밀번호 변경 완료.");
			return "1";
		}
		return "0";
	}
	
	@PostMapping("/incomeInsert")
	public @ResponseBody String incomeInsert(HouseholdVO vo) {
		service.incomeInsert(vo);
		return "1";
	}
	
	@GetMapping("/chartForm")
	public String chartForm(HomeVO vo, Model model) {
		Calendar cal = Calendar.getInstance();
		String nowmon = String.valueOf(cal.get(cal.MONTH)+1);
		vo.setNowmonth(nowmon);
		if(vo.getMembernum() == 0) {
			index();
		}
		if(vo.getMonth() == null) {
			vo.setMonth(nowmon);
			if(cal.get(cal.MONTH)+1 < 10) {
				vo.setMonth("0".concat(vo.getMonth()));
			}
		}
		HomeVO hvo = service.homegetData(vo);
		model.addAttribute("hvo", hvo);
		model.addAttribute("nowmon", nowmon);
		model.addAttribute("selectmon", Integer.parseInt(vo.getMonth()));
		return "chart/chart";
	}
}
