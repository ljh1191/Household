package org.zerock.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.EmailVO;
import org.zerock.domain.HomeVO;
import org.zerock.domain.HouseholdVO;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MainMapper;

@Service
public class MainServiceImpl implements MainService{
	
	private static final Logger logger =  LoggerFactory.getLogger(MainServiceImpl.class);

	@Autowired
	private MainMapper mapper;
	
	@Override
	public void signup(MemberVO vo) {
		logger.info("회원가입");
		mapper.signup(vo);
	}

	@Override
	public MemberVO login(String email) {
		// TODO Auto-generated method stub
		logger.info("로그인체크");
		return mapper.login(email);
	}

	@Override
	public int idcheck(String email) {
		logger.info("아이디 중복체크");
		if(mapper.idcheck(email)==1) {
			return 1;
		}else {
			return 0;
		}
	}

	@Override
	public void createAuthKey(String email, String key) {
		logger.info("인증키 DB에 저장.");
		int membernum = mapper.getMembernum(email);
		EmailVO vo = new EmailVO();
		vo.setEmail(email);
		vo.setAuthkey(key);
		vo.setMembernum(membernum);
		mapper.createAuthKey(vo);
	}

	@Override
	public EmailVO authkeyselect(int membernum) {
		// TODO Auto-generated method stub
		return mapper.authkeyselect(membernum);
	}

	@Override
	public int getMembernum(String email) {
		// TODO Auto-generated method stub
		return mapper.getMembernum(email);
	}

	@Override
	public int passCheck(String email,String password) {
		// TODO Auto-generated method stub
		MemberVO vo = mapper.passcheck(email);
		if(vo.getPassword().equals(password)) {
			return 1;
		}
		return 0;
	}
	
	@Override
	public void passupdate(int num, String pwd) {
		// TODO Auto-generated method stub
		mapper.passupdate(num,pwd);
	}

	@Override
	public void incomeInsert(HouseholdVO vo) {
		// TODO Auto-generated method stub
		mapper.incomeInsert(vo);
	}

	@Override
	public List<HouseholdVO> tableList(int membernum) {
		// TODO Auto-generated method stub
		return mapper.tableList(membernum);
	}

	@Override
	public HomeVO homegetData(HomeVO vo) {
		// TODO Auto-generated method stub
		vo.setMon_incom(mapper.getIncome(vo));
		vo.setMon_dx(mapper.getDx(vo));
		int nowmon_num = Integer.parseInt(vo.getNowmonth());
		//해당월까지의 배열생성
		String[] mon = new String[nowmon_num];
		for (int i = 1; i <= nowmon_num; i++) {
			if(i < 10) {
				mon[i-1] = "0".concat(String.valueOf(i));
			}else {
				mon[i-1] = String.valueOf(i);
				
			}
		}
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("membernum", vo.getMembernum());
		//해당월까지 지출 배열에 넣음
		int[] mon_income = new int[mon.length];
		
		for (int i = 0; i < mon.length; i++) {
			hm.put("mon", mon[i]);
			mon_income[i] = mapper.getMonthincome(hm);
		}
		vo.setMon_area_incom(mon_income);
		//pie chart 데이터
		ArrayList<HouseholdVO> arr = mapper.pieRank(vo);
		vo.setMon_pie_incom(arr);
		//bar chart 데이터
		ArrayList<HouseholdVO> arr2 = mapper.barRank(vo);
		
		vo.setMon_bar_incom(arr2);
		return vo;
	}

	@Override
	public void viewUpdate(HouseholdVO vo) {
		// TODO Auto-generated method stub
		mapper.viewUpdate(vo);
	}

	@Override
	public void viewDelete(HouseholdVO vo) {
		// TODO Auto-generated method stub
		mapper.viewDelete(vo);
	}

	@Override
	public HouseholdVO view(int num) {
		// TODO Auto-generated method stub
		return mapper.view(num);
	}

}
