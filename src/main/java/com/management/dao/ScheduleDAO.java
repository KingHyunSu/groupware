package com.management.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.management.dto.ScheduleDTO;

@Repository
public class ScheduleDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.management.dao.ScheduleDAO";
	
	public List<ScheduleDTO> showSchedule() throws Exception {
		return sqlSession.selectList(namespace + ".showSchedule");
	}
	
	public void addSchedule(ScheduleDTO dto) throws Exception  {
		sqlSession.insert(namespace + ".addSchedule", dto);
	}
}
