package org.zerock.service;

import java.util.List;

import org.zerock.domain.EmailVO;
import org.zerock.domain.HouseholdVO;
import org.zerock.domain.MemberVO;

public interface MainService {

	//회원가입
	public void signup(MemberVO vo);
	//로그인
	public MemberVO login(String email);
	//회원가입 아이디체크
	public int idcheck(String email);
	//이메일 인증키 생성 및 발송
	public void createAuthKey(String email,String key);
	public void userAuth(String email);
	//이메일 인증키 확인
	public EmailVO authkeyselect(int membernum);
	//회원번호 찾기
	public int getMembernum(String email);
	//비밀번호 체크
	public int passCheck(String email,String password);
	//비밀번호 변경
	public void passupdate(int num, String pwd);
	//수입 입력
	public void incomeInsert(HouseholdVO vo);
	//테이블 리스트
	public List<HouseholdVO> tableList(int membernum);
}
