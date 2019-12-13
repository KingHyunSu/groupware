package com.groupware.sign;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.groupware.dto.DeptDTO;
import com.groupware.dto.MemberDTO;
import com.groupware.dto.SignDTO;
import com.groupware.dto.SignPathDTO;

@Service
public class SignService {

	@Inject
	private SignDAO dao;

	//결재 경로 부서 선택
	public List<MemberDTO> selectDeptShowMember(DeptDTO dto){
//		SignDTO dto = new SignDTO();
//		//dto.setDept(dept);
		
		return dao.selectDeptShowMember(dto);
	}
	
	//결재 경로 직원 선택
	public MemberDTO selectSignUser(MemberDTO dto){

		return dao.selectSignUser(dto);
	}
	
	//직원 정보
//	public SignDTO userInfo(String id) {
//		
//		SignDTO dto = new SignDTO();
//		
////		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
////		String id = auth.getName();
//		
//		dto.setId(id);
//		
//		return dao.userInfo(dto);
//	}
	
	//기안하기
	public void insertSign(String id, String title, String content, String name, String sign_id, String rank_no, String dept_no) {
		
		//state_no 
		
		//날짜
//		Date d = new Date();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		String date = sdf.format(d);
//		dto.setDate(date);
		SignDTO signDTO = new SignDTO();
		
		signDTO.setTitle(title);
		signDTO.setContent(content);
		signDTO.setId(id);
		
		int num = dao.insertSign(signDTO);
		
		//dao.selectNum(dto);
		
		//////////////////////////////////////

		String[] signName = name.split(",");
		String[] signId = sign_id.split(","); 
		String[] deptName = dept_no.split(",");
		String[] rankName = rank_no.split(",");

		SignPathDTO signPathDTO = new SignPathDTO();
		
		
		for(int i = 0; i < signName.length; i++) {
			signPathDTO.setSign_no(signDTO.getSign_no());
			signPathDTO.setName(signName[i]);
			signPathDTO.setId(signId[i]);
			signPathDTO.setDept_no(Integer.parseInt(deptName[i]));
			signPathDTO.setRank_no(Integer.parseInt(rankName[i]));
			
			dao.insertSignPath(signPathDTO);
		}
	}
	
	//결재 진행 중인 문서 리스트
	public List<SignDTO> signProcessList(String id) {
				
		return dao.signProcessList(id);
	}
	
	//결재 대기 중인 문서 리스트 
	public List<SignDTO> signStayList(String id) {

		return dao.signStayList(id);
	}
	
	//결재 완료된 문서 리스트
	public List<SignDTO> signFinishList(String id){
		SignDTO dto = new SignDTO();
		
		dto.setId(id);
		
		return dao.signFinishList(dto);
	}
	
	//결재 문서 보기
	public SignDTO signDocView(SignDTO dto) {
		
		return dao.signDocView(dto);
	}
	
	public List<SignPathDTO> signDocPath(SignDTO dto) {

		return dao.signDocPath(dto);
	}
	
	//결재 하기
	public void signOK(SignPathDTO dto) {

		dao.signOK(dto);
		
		
		//결재 경로에 전부 결재 완료되었으면 결재문서 상태 결재 완료로 변경
		int sign_no = dto.getSign_no();
		
		List<SignPathDTO> signPathSignNo =  dao.signPathNowSign(sign_no);
		
		int tot = signPathSignNo.size() * 2;
		
		int val = 0;
		
		for(int i = 0; i < signPathSignNo.size(); i++) {
			val += signPathSignNo.get(0).getState_no();
		}
		
		if(tot == val) {
			dao.updateSignFinish(sign_no);
		}

	}
}
