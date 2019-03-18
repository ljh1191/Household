package org.zerock.domain;

import java.util.ArrayList;

public class HomeVO {
	private String month;
	private int membernum;
	private int mon_incom;
	private int mon_dx;
	private int[] mon_area_incom;
	private ArrayList<HouseholdVO> mon_pie_incom;
	private ArrayList<HouseholdVO> mon_bar_incom;
	
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getMon_incom() {
		return mon_incom;
	}
	public void setMon_incom(int mon_incom) {
		this.mon_incom = mon_incom;
	}
	public int getMon_dx() {
		return mon_dx;
	}
	public void setMon_dx(int mon_dx) {
		this.mon_dx = mon_dx;
	}
	public int[] getMon_area_incom() {
		return mon_area_incom;
	}
	public void setMon_area_incom(int[] mon_area_incom) {
		this.mon_area_incom = mon_area_incom;
	}
	public ArrayList<HouseholdVO> getMon_pie_incom() {
		return mon_pie_incom;
	}
	public void setMon_pie_incom(ArrayList<HouseholdVO> mon_pie_incom) {
		this.mon_pie_incom = mon_pie_incom;
	}
	public ArrayList<HouseholdVO> getMon_bar_incom() {
		return mon_bar_incom;
	}
	public void setMon_bar_incom(ArrayList<HouseholdVO> mon_bar_incom) {
		this.mon_bar_incom = mon_bar_incom;
	}
	public int getMembernum() {
		return membernum;
	}
	public void setMembernum(int membernum) {
		this.membernum = membernum;
	}
	
}
