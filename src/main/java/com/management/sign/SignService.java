package com.management.sign;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class SignService {

	@Inject
	private SignDAO dao;

	public List<SignDTO> selectDeptShowMember(String dept){
		SignDTO dto = new SignDTO();
		dto.setDept(dept);
		
		return dao.selectDeptShowMember(dto);
	}
	
	public SignDTO selectSignUser(SignDTO dto){

		return dao.selectSignUser(dto);
	}
	
	public SignDTO userInfo() {
		
		SignDTO dto = new SignDTO();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		
		dto.setId(id);
		
		return dao.userInfo(dto);
	}
	
	public void insertSign(SignDTO dto) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		dto.setId(id);
		
		String defaultSign = "0";
		dto.setSign(defaultSign);
		
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
	
	public List<SignDTO> signProcessList() {
		SignDTO dto = new SignDTO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		dto.setId(id);
		
		return dao.signProcessList(dto);
	}
	
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
	
	public SignDTO signDocView(SignDTO dto) {
		
		return dao.signDocView(dto);
	}
	
	public List<SignDTO> signDocPath(SignDTO dto) {

		return dao.signDocPath(dto);
	}
	
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
		System.out.println(dto.getSignRank());
		dto.setNum(Integer.parseInt(num));

		//결제 확인 업데이트
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
			dao.signFinish(dto);
		}
	}
}
