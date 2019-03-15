package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.EmailVO;
import org.zerock.domain.HouseholdVO;
import org.zerock.domain.MemberVO;

public interface MainMapper {
	public boolean signup(MemberVO vo);
	public MemberVO login(String email);
	public int idcheck(String email);
	public void createAuthKey(String email,String authkey);
	public void userAuth(String email);
	public int getMembernum(String email);
	public void createAuthKey(EmailVO vo);
	public EmailVO authkeyselect(int membernum);
	public MemberVO passcheck(String email);
	public void passupdate(@Param("num") int num, @Param("pwd") String pwd);
	public void incomeInsert(HouseholdVO vo);
	public List<HouseholdVO> tableList(int membernum);
}
