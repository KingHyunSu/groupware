package com.management.sign;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class SignService {

	@Inject
	private SignDAO dao;

	//결재 경로 부서 선택
	public List<SignDTO> selectDeptShowMember(String dept){
		SignDTO dto = new SignDTO();
		dto.setDept(dept);
		
		return dao.selectDeptShowMember(dto);
	}
	
	//결재 경로 직원 선택
	public SignDTO selectSignUser(SignDTO dto){

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
	public void insertSign(SignDTO dto) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		dto.setId(id);
		
		String defaultSign = "0";
		dto.setSignCheck(defaultSign);
		dto.setSign(defaultSign);
		
		//날짜
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(d);
		dto.setDate(date);
		
		dao.insertSign(dto);
		
		
		dao.selectNum(dto);
		
		String signNameList = dto.getSignName();
		String[] signName = signNameList.split(",");
		String signDeptList = dto.getSignDept();
		String[] deptName = signDeptList.split(",");
		String signRankList = dto.getSignRank();
		String[] rankName = signRankList.split(",");

		
		for(int i = 0; i < signName.length; i++) {
			dto.setSignName(signName[i]);
			dto.setSignDept(deptName[i]);
			dto.setSignRank(rankName[i]);
			
			dao.insertSignPath(dto);
		}
	}
	
	//결재 진행 중인 문서 리스트
	public List<SignDTO> signProcessList() {
		
		SignDTO dto = new SignDTO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		dto.setId(id);
		
		return dao.signProcessList(dto);
	}
	
	//결재 대기 중인 문서 리스트 
	public List<SignDTO> signStayList() {
		
		SignDTO dto = new SignDTO();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		
		dto.setId(id);
		
		SignDTO user = dao.userInfo(dto);
		
		dto.setSignName(user.getName());
		dto.setSignDept(user.getDeptname());
		dto.setSignRank(user.getRankname());
		
		return dao.signStayList(dto);
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
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		
		dto.setId(id);
	
		//결제할 유저 정보 가져오기
		SignDTO userInfo = dao.userInfo(dto);
		
		dto.setSignName(userInfo.getName());
		dto.setSignDept(userInfo.getDeptname());
		dto.setSignRank(userInfo.getRankname());

		dto.setNum(Integer.parseInt(num));

		//결재 날짜 
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(d);
		dto.setSignDate(date);
		
		//결제
		dao.signOK(dto);
		
		//결제 어디까지 완료되었는지 확인
		int signSum = 0;
		
		List<SignDTO> list = dao.signDocPath(dto);
		
		for(int i = 0; i < list.size(); i++) {
			SignDTO signCheck = list.get(i);
			
			signSum += Integer.parseInt(signCheck.getSign());
		}
		
		//(결제 카운트수 == 결제 완료 합) 이면 sign테이블 결제 '1'
		if(signSum == dao.signCount(dto)) {
			dto.setDate(date.toString());
			
			dao.signFinish(dto);
		}
	}
}
