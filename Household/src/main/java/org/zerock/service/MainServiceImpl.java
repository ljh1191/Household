package org.zerock.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.EmailVO;
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
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
		logger.info("아이디 중복체크");
		if(mapper.idcheck(email)==1) {
			return 1;
		}else {
			return 0;
		}
	}

	@Override
	public void createAuthKey(String email, String key) {
		// TODO Auto-generated method stub
		System.out.println("이메일 : "+email);
		int membernum = mapper.getMembernum(email);
		System.out.println("회원번호 : "+membernum);
		System.out.println(key);
		EmailVO vo = new EmailVO();
		vo.setEmail(email);
		vo.setAuthkey(key);
		vo.setMembernum(membernum);
		mapper.createAuthKey(vo);
	}

	@Override
	public void userAuth(String email) {
		// TODO Auto-generated method stub
		mapper.userAuth(email);
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

}
