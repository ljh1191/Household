package org.zerock.household;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.crypto.Cipher;
import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.EmailVO;
import org.zerock.domain.HomeVO;
import org.zerock.domain.HouseholdVO;
import org.zerock.domain.MailHandler;
import org.zerock.domain.MemberVO;
import org.zerock.domain.StocksVO;
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
		logger.info("����ȭ������ �̵�");
		return "main/main";
	}
	
	@GetMapping("/index")
	public String index(Model mo) {
		Document doc;
		try {
			//���ϰ���
			doc = Jsoup.connect("http://www.mk.co.kr/").get();
			Elements mkmainhtml = doc.select("div.main_art");
			mo.addAttribute("mkmainhtml", mkmainhtml.toString());
			
			//�ѱ�����
			doc = Jsoup.connect("http://www.hankyung.com/").get();
			Elements hkmainhtml = doc.select("div.wide_news_list");
			Elements hk2 = hkmainhtml.select("div");
			mo.addAttribute("hkmain", hk2.eq(1).toString());
			mo.addAttribute("hknewlist", hk2.eq(4).toString());
			
			//���̹�����
			doc = Jsoup.connect("https://finance.naver.com/sise/lastsearch2.nhn").get();
			Elements naverStocks = doc.select("div.box_type_l");
			Elements table = naverStocks.select("table.type_5").select("tbody");
			Elements tr = table.select("tr");
			Elements title = tr.eq(0).select("th");
			
			String[] naverStocksRanktitle = new String[title.size()];
			for (int i = 0; i < naverStocksRanktitle.length; i++) {
				naverStocksRanktitle[i] = title.eq(i).text();
			}
			mo.addAttribute("naverStocksRanktitle", naverStocksRanktitle);
			
			ArrayList<StocksVO> arr = new ArrayList<>();
			
			for (int i = 2; i < 7; i++) {
				StocksVO vo = new StocksVO();
				Elements contenttr = tr.eq(i).select("tr");
				Elements contenttd = contenttr.select("td");
				vo.setRank(contenttd.eq(0).text());
				vo.setName(contenttd.eq(1).text());
				vo.setSearch(contenttd.eq(2).text());
				vo.setNow(contenttd.eq(3).text());
				vo.setYesterdayra(contenttd.eq(4).text());
				vo.setUpdown(contenttd.eq(5).text());
				vo.setDeal(contenttd.eq(6).text());
				vo.setPp(contenttd.eq(7).text());
				vo.setHigh(contenttd.eq(8).text());
				vo.setLow(contenttd.eq(9).text());
				vo.setPer(contenttd.eq(10).text());
				vo.setRoe(contenttd.eq(11).text());
				arr.add(vo);
			}
			mo.addAttribute("Stockarr", arr);
			
			//���̹� �����̽�
			doc = Jsoup.connect("https://finance.naver.com/news/mainnews.nhn").get();
			Elements naverissu = doc.select("div.mainNewsList");
			String naveriss = "";
			for (int i = 0; i < 4; i++) {
				naveriss += naverissu.select("li").eq(i).toString();
				naveriss += "<br>";
			}
			mo.addAttribute("naverissu", naveriss.replaceAll("<a", "<a class= text-success "));
			
			//LG����������
			doc = Jsoup.connect("http://www.lgeri.com/economy/list.do?type=economy&rankOptions=TITLE/50,CONTENTS_PDF/30,KEYWORD/100,KEYWORD_TOP/100").get();
			Elements lgnews = doc.select("div.lst_area");
			Elements lgnewsul = lgnews.select("div.lst_area").select("ul");
			Elements lgnewsli0 = lgnewsul.select("li").eq(0);
			Elements lgnewsli1 = lgnewsul.select("li").eq(1);
			mo.addAttribute("lgnewsli0", lgnewsli0.toString().replaceAll("<a ", "<a class = text-info "));
			mo.addAttribute("lgnewsli1", lgnewsli1.toString().replaceAll("<a ", "<a class = text-info "));
			
			//KDI ������������
			doc = Jsoup.connect("http://eiec.kdi.re.kr/policy/material/plist.jsp").get();
			String kdistr = "";
			for (int i = 0; i < 5; i++) {
				Elements kdi = doc.select("div.listTypeA").select("li").eq(i);
				kdistr += kdi.toString();
				kdistr += "<br>";
			}
			mo.addAttribute("kdi", kdistr.replaceAll("<a ", "<a class = text-info "));
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		logger.info("�ε���ȭ������ �̵�");
		return "main/index";
	}
	
	@GetMapping("/loginform")
	public String loginform(HttpSession session,Model mo) throws InvalidKeySpecException {
		try {
			KeyPairGenerator gen = KeyPairGenerator.getInstance("RSA");
			gen.initialize(512);
			
			KeyPair keyPair = gen.generateKeyPair();
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			//����Ű,����Ű����
			PublicKey publickey = keyPair.getPublic();
			PrivateKey privatekey = keyPair.getPrivate();
			logger.info("����Ű,����Ű ����");
			//����Ű ��������
			session.setAttribute("PrivateKey", privatekey);
			
			RSAPublicKeySpec publicspec = keyFactory.getKeySpec(publickey, RSAPublicKeySpec.class);
			
			String publickeyModulus = publicspec.getModulus().toString(16);
			String publickeyEponent = publicspec.getPublicExponent().toString(16);
			//������ ����
			mo.addAttribute("publicKeyModulus", publickeyModulus);
			mo.addAttribute("publickeyEponent", publickeyEponent);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		logger.info("�α������� �̵�.");
		return "main/login";
	}
	
	@GetMapping("/signupform")
	public String signupform() {
		logger.info("ȸ���������� �̵�");
		return "main/signup";
	}
	
	@GetMapping("/chart")
	public String chartform() {
		logger.info("��Ʈȭ������ �̵�");
		return "chart/chart";
	}
	
	@PostMapping("/signup")
	public @ResponseBody String signup(String name,String password,String email) {
		int flag = service.idcheck(email);
		if(flag == 1) {
			logger.info("�̹� ���Ե� �̸���");
			return "-1";
		}
		MemberVO vo = new MemberVO();
		vo.setName(name);
		vo.setPassword(password);
		vo.setEmail(email);
		service.signup(vo);
		logger.info("ȸ������ �Ϸ�");
		return "1";
	}
	
	@PostMapping("/login")
	public @ResponseBody String login(String securedUsername,String securedPassword,HttpSession session,Model mo) throws ServletException {
		PrivateKey privateKey = (PrivateKey) session.getAttribute("PrivateKey");
		session.removeAttribute("PrivateKey");
		String email = "";
		String password = "";
		if(privateKey == null) {//����Ű,����Ű ������ �ȉ��� ��
			throw new RuntimeException("��ȣȭ ���Ű ������ ã�� �� �����ϴ�.");
		}
		try {
			email = decryptRsa(privateKey, securedUsername);
            password = decryptRsa(privateKey, securedPassword);
        } catch (Exception ex) {
            throw new ServletException(ex.getMessage(), ex);
        }
    
		MemberVO vo = new MemberVO();
		vo.setPassword(password);
		vo.setEmail(email);
		MemberVO check = service.login(email);
		if(check != null) {
			if(password.equals(check.getPassword())) {
				//�α��μ���
				session.setAttribute("vo", check);
				return "1";
			}
			//��й�ȣ Ʋ��
			return "0";
		}
		//ȸ���ƴ�
		return "-1";
	}
	 //����Ű�� ���� ��ȣȭ
	 private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
	        System.out.println("will decrypt : " + securedValue);
	        Cipher cipher = Cipher.getInstance("RSA");
	        byte[] encryptedBytes = hexToByteArray(securedValue);
	        cipher.init(Cipher.DECRYPT_MODE, privateKey);
	        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
	        String decryptedValue = new String(decryptedBytes, "utf-8"); // ���� ���ڵ� ����.
	        return decryptedValue;
	    }

    // 16�� ���ڿ��� byte �迭�� ��ȯ
	 public static byte[] hexToByteArray(String hex) {
        if (hex == null || hex.length() % 2 != 0) {
            return new byte[]{};
        }

        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length(); i += 2) {
            byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16);
            bytes[(int) Math.floor(i / 2)] = value;
        }
        return bytes;
	 }
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		logger.info("�α׾ƿ�.");
		session.invalidate();
		return "redirect:/main/index";
	}
	
	@GetMapping("/forgetpassword")
	public String forgetpassword() {
		logger.info("��й�ȣ ã��� �̵�");
		return "main/forgetpassword";
	}
	
	@PostMapping("/forgetpassword")
	public @ResponseBody String forgetpassword(String email) {
		//ȸ������ ����Ȯ��
		MemberVO check = service.login(email);
		if(check == null) {
			return "-1";
		}
		// ����Ű ����
		String key = new TempKey().getKey(50, false); 
		System.out.println("����Ű : "+key);
		//����Ű db�� ����
		service.createAuthKey(email, key);
		try {
			MailHandler sendMail = new MailHandler(mailSender);
			//���ϳ���
			//����
			sendMail.setSubject("����� ���α׷� ���������Դϴ�.");
			//����
			sendMail.setText(
							new StringBuffer().append("<h1>��й�ȣ ã�� ��������</h1>").append("").append("����Ű :").append("").append(key).toString()
							 );
			try {
				//�߽���
				sendMail.setFrom(email, "����� ���α׷�");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//������
			sendMail.setTo(email);
			//��������
			sendMail.send();
			logger.info("����Ű ���Ϸ� �߼�.");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "1";
	}
	
	@PostMapping("/authkey")
	public @ResponseBody String authkey(String authkey,String email) {
		logger.info("����Ű Ȯ��.");
		//������ ���� ȸ����ȣ ����.
		int membernum = service.getMembernum(email);
		//�ش�ȸ���� �ֱٿ� �߱޵� ����Ű ����.
		EmailVO vo = service.authkeyselect(membernum);
		if(vo.getAuthkey().equals(authkey)) {
			return "1";
		}
		return "0";
	}
	
	@GetMapping("/passwordchangeForm")
	public String passwordchangeForm(String email,Model mo) {
		logger.info("��й�ȣ ���������� �̵�.");
		mo.addAttribute("email", email);
		return "main/passwordchange";
	}
	
	@PostMapping("/passwordchange")
	public @ResponseBody String passwordchange(String email,String password,String newpassword) {
		int passcheck = service.passCheck(email,password);
		if(passcheck == 1) {
			int num = service.getMembernum(email);
			service.passupdate(num,newpassword);
			logger.info("��й�ȣ ���� �Ϸ�.");
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
	public String chartForm(HomeVO vo, Model mo) {
		Calendar cal = Calendar.getInstance();
		String nowmon = String.valueOf(cal.get(cal.MONTH)+1);
		vo.setNowmonth(nowmon);
		if(vo.getMembernum() == 0) {
			index(mo);
		}
		if(vo.getMonth() == null) {
			vo.setMonth(nowmon);
			if(cal.get(cal.MONTH)+1 < 10) {
				vo.setMonth("0".concat(vo.getMonth()));
			}
		}
		HomeVO hvo = service.homegetData(vo);
		mo.addAttribute("hvo", hvo);
		mo.addAttribute("nowmon", nowmon);
		mo.addAttribute("selectmon", Integer.parseInt(vo.getMonth()));
		return "chart/chart";
	}
	
	@GetMapping("/calendarForm")
	public String calendarForm(int membernum,Model mo) {
		List<HouseholdVO> list = service.tableList(membernum);
		mo.addAttribute("listSize", list.size());
		mo.addAttribute("list", list);
		return "main/calendar";
	}
	
	@RequestMapping(value = "calendarGetdata", method = RequestMethod.GET, produces= {"text/plain;charset=utf-8"})
	public @ResponseBody String calendarGetdata(int membernum) {
		List<HouseholdVO> list = service.tableList(membernum);
		DecimalFormat formatter = new DecimalFormat("###,###");
		JSONArray jarr = new JSONArray();
		JSONObject obj = null;
		for (HouseholdVO vo : list) {
			obj = new JSONObject();
			obj.put("title", vo.getCategory()+"_"+vo.getDivision()+" : "+formatter.format(vo.getMoney())+"��");
			obj.put("start", vo.getRegdate());
			obj.put("url", "javascript:calModal("+vo.getNum()+")");
			jarr.add(obj);
		}
		return jarr.toString();
	}
	
	@RequestMapping(value = "view", method = RequestMethod.GET, produces = {"application/json;charset=utf-8"})
	public @ResponseBody String view(int num) {
		HouseholdVO vo = service.view(num);
		JSONObject obj = new JSONObject();
		obj.put("num", vo.getNum());
		obj.put("membernum", vo.getMembernum());
		obj.put("division", vo.getDivision());
		obj.put("money", vo.getMoney());
		obj.put("regdate", vo.getRegdate());
		obj.put("content", vo.getContent());
		obj.put("category", vo.getCategory());
		return obj.toString();
	}
}
