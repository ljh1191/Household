package org.zerock.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.EmailVO;
import org.zerock.domain.HomeVO;
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
	public int getIncome(HomeVO vo);
	public int getDx(HomeVO vo);
	public String getMonthincome(HashMap<String, Object> hm);
	public int pieCheck(HomeVO vo);
	public ArrayList<HouseholdVO> pieRank(HomeVO vo);
	public ArrayList<HouseholdVO> barRank(HomeVO vo);
	public void viewUpdate(HouseholdVO vo);
	public void viewDelete(HouseholdVO vo);
	public HouseholdVO view(int num);
}
