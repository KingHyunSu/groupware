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
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		
		return dao.userInfo(id);
	}
	
	public void insertSign(SignDTO dto) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		dto.setId(id);
		
		dao.insertSign(dto);
		
		dao.selectNum(dto);
		
		String signNameList = dto.getSignName();
		String[] signName = signNameList.split(",");
		String signDeptList = dto.getSignDept();
		String[] deptName = signDeptList.split(",");
		String signRankList = dto.getSignRank();
		String[] rankName = signRankList.split(",");
		
		String defaultSign = "0";
		dto.setSign(defaultSign);
		
		for(int i = 0; i < signName.length; i++) {
			dto.setSignName(signName[i]);
			dto.setSignDept(deptName[i]);
			dto.setSignRank(rankName[i]);
			
			System.out.println(dto.getSignName());
			System.out.println(dto.getDeptname());
			
			dao.insertSignPath(dto);
		}
	}
	
	
}
