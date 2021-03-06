package com.kosmo.travelmaker.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.travelmaker.service.impl.MemberDAO;
import com.kosmo.travelmaker.service.AndroidMemberDTO;
import com.kosmo.travelmaker.service.ChatDTO;
import com.kosmo.travelmaker.service.MemberDTO;
import com.kosmo.travelmaker.service.MemberService;
import com.kosmo.travelmaker.service.PlannerDTO;
@Service("memberService")
public class MemberServiceImpl implements MemberService{
	@Resource(name = "memberDAO")
	MemberDAO memberDAO;
	
	@Override
	public boolean isLogin(Map map) {
		return memberDAO.isLogin(map);
	}
	
	public AndroidMemberDTO isLogin(AndroidMemberDTO dto) {
		return memberDAO.isLogin(dto);
	}
	
	@Override
	public boolean SignUp(MemberDTO dto) {
		return memberDAO.SignUp(dto);
	}
	@Override
	public String idCheck(String id) {
		return memberDAO.idCheck(id)?"failure":"success";
	}
	@Override
	public List<PlannerDTO> plannerList(String id) {
		return memberDAO.myPlannerList(id);
	}
	public String kakao(String kakaoemail,String kakoid,MemberDTO dto) {
		
		return memberDAO.kakao(dto);
	}

	public int registerInsert(AndroidMemberDTO member) {
		return memberDAO.registerInsert(member);
	}

	@Override
	public MemberDTO selectMemberDTO(String id) {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberDTO(id);
	}
	@Override
	public boolean updateMemberDTO(MemberDTO dto) {
		return memberDAO.updateMemberDTO(dto);
		
	}

	@Override
	public MemberDTO selectMember(String id) {
	
		return memberDAO.selectMember(id);
	}

	@Override
	public ArrayList<MemberDTO> userInfo(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<MemberDTO> members() {
		// TODO Auto-generated method stub
		return null;
	}
	//어드민2 멤버리스트용
	@Override
	public List<MemberDTO> selectMemberList() {
		return memberDAO.selectMemberList();
	}
	@Override
	public int checkAccByNo(int acc_no) {
		// TODO Auto-generated method stub
		return memberDAO.checkAccByNo(acc_no);
	}
	@Override
	public void updateAccYes(int acc_no) {
		// TODO Auto-generated method stub
		memberDAO.updateAccYes(acc_no);
	}

	@Override
	public void updateAccNo(int acc_no) {
		// TODO Auto-generated method stub
		memberDAO.updateAccNo(acc_no);
	}
	@Override
	public void updateUserInfoIdNo(Map<String, String> maps) {
		memberDAO.updateUserInfoIdNo(maps);
		
	}
	@Override
	public int selectAllowedByPlannerNo(int planner_no) {
		// TODO Auto-generated method stub
		return memberDAO.selectAllowedByPlannerNo(planner_no);
	}
	@Override
	public List<MemberDTO> selectMemberDTOListByAccAllow(int planner_no) {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberDTOListByAccAllow(planner_no);
	}
	@Override
	public List<ChatDTO> selectChatDTOList(int planner_no) {
		// TODO Auto-generated method stub
		return memberDAO.selectChatDTOList(planner_no);
	}
	@Override
	public boolean inputChat(Map<String, String> maps) {
		// TODO Auto-generated method stub
		return memberDAO.inputChat(maps);
	}
	@Override
	public List<PlannerDTO> AccplannerList(String user_id) {
		// TODO Auto-generated method stub
		return memberDAO.AccplannerList(user_id);
	}
	@Override
	public void deleteChat(int planner_no) {
		// TODO Auto-generated method stub
		memberDAO.deleteChat(planner_no);
	}

	public int userBlackUpdate(String id) {
		return memberDAO.userBlackUpdate(id);
	}

	
	public int usersafeUpdate(String id) {
		return memberDAO.userSafeUpdate(id);
	}

	public List<MemberDTO> selectBlack() {
		return memberDAO.selectBlack();
	}
	



	@Override
	public int selectMemberCount() {
		//어드민1 인원수 가져오기
		return memberDAO.memberCount();
	}

}
