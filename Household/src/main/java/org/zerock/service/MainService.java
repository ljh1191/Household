package org.zerock.service;

import java.util.List;

import org.zerock.domain.EmailVO;
import org.zerock.domain.HouseholdVO;
import org.zerock.domain.MemberVO;

public interface MainService {

	//ȸ������
	public void signup(MemberVO vo);
	//�α���
	public MemberVO login(String email);
	//ȸ������ ���̵�üũ
	public int idcheck(String email);
	//�̸��� ����Ű ���� �� �߼�
	public void createAuthKey(String email,String key);
	public void userAuth(String email);
	//�̸��� ����Ű Ȯ��
	public EmailVO authkeyselect(int membernum);
	//ȸ����ȣ ã��
	public int getMembernum(String email);
	//��й�ȣ üũ
	public int passCheck(String email,String password);
	//��й�ȣ ����
	public void passupdate(int num, String pwd);
	//���� �Է�
	public void incomeInsert(HouseholdVO vo);
	//���̺� ����Ʈ
	public List<HouseholdVO> tableList(int membernum);
}
