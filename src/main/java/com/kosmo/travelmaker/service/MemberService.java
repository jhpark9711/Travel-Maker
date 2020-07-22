package com.kosmo.travelmaker.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface MemberService {
	//로그인 용]
	boolean isLogin(Map map);
	AndroidMemberDTO isLogin(AndroidMemberDTO dto);
	boolean SignUp(MemberDTO dto);
	String idCheck(String id);
	List<PlannerDTO> plannerList(String id);
	MemberDTO selectMemberDTO(String id);
	boolean updateMemberDTO(Map map);
	public ArrayList<MemberDTO> members();
	public ArrayList<MemberDTO> userInfo(String id);
	MemberDTO selectMember(String id);
	//어드민2 멤버리스트용
	List<MemberDTO> selectMemberList();
}

