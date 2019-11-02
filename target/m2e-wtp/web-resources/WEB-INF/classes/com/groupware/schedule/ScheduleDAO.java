package com.groupware.schedule;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.groupware.dto.ScheduleDTO;

@Repository
public class ScheduleDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.management.schedule.ScheduleDAO";
	
	public List<ScheduleDTO> showSchedule(String id) throws Exception {
		return sqlSession.selectList(namespace + ".showSchedule", id);
	}
	
	public void addSchedule(ScheduleDTO dto) throws Exception  {
		sqlSession.insert(namespace + ".addSchedule", dto);
	}
}
