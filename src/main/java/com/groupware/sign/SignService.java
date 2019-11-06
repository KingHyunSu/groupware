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
	public SignDTO userInfo() {
		
		SignDTO dto = new SignDTO();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		
		dto.setId(id);
		
		return dao.userInfo(dto);
	}
	
	//기안하기
	public void insertSign(SignDTO dto, String name, String rank_no, String dept_no) {
		
		//state_no 
		
		//날짜
//		Date d = new Date();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		String date = sdf.format(d);
//		dto.setDate(date);
		
		int num = dao.insertSign(dto);
		
		
		dao.selectNum(dto);
		
		//////////////////////////////////////

		

		String[] signName = name.split(",");
		String[] deptName = dept_no.split(",");
		String[] rankName = rank_no.split(",");

		SignPathDTO signPathDTO = new SignPathDTO();
		
		for(int i = 0; i < signName.length; i++) {
			signPathDTO.setSign_no(num);
			signPathDTO.setName(signName[i]);
			signPathDTO.setDept_no(Integer.parseInt(deptName[i]));
			signPathDTO.setRank_no(Integer.parseInt(rankName[i]));
			
			dao.insertSignPath(dto);
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
	public List<SignDTO> signFinishList(){
		SignDTO dto = new SignDTO();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		
		dto.setId(id);
		
		return dao.signFinishList(dto);
	}
	
	//결재 문서 보기
	public SignDTO signDocView(SignDTO dto) {
		
		return dao.signDocView(dto);
	}
	
	public List<SignDTO> signDocPath(SignDTO dto) {

		return dao.signDocPath(dto);
	}
	
	//결재 하기
	public void signOK(String num) {
		SignDTO dto = new SignDTO();	

		dto.setSign_no(Integer.parseInt(num));

		//결재 날짜 
//		Date d = new Date();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		String date = sdf.format(d);
//		dto.setDate(date);
		
		//결제
		dao.signOK(dto);
		
		//결제 어디까지 완료되었는지 확인
		int signSum = 0;
		
		List<SignDTO> list = dao.signDocPath(dto);
		
		for(int i = 0; i < list.size(); i++) {
			SignDTO signCheck = list.get(i);
			
			signSum += signCheck.getSign_no();
		}
		
		//(결제 카운트수 == 결제 완료 합) 이면 sign테이블 결제 '1'
		//다시생각해보기
//		if(signSum == dao.signCount(dto)) {
//			dto.setDate(date.toString());
//			
//			dao.signFinish(dto);
//		}
	}
}
