package kr.or.connect.ftYoutube.dao;

import static kr.or.connect.ftYoutube.dao.DaoSqls.CHECK_DELETABLE;
import static kr.or.connect.ftYoutube.dao.DaoSqls.DELETE_STUDIO;
import static kr.or.connect.ftYoutube.dao.DaoSqls.SELECT_ALL_STUDIO_ONE;
import static kr.or.connect.ftYoutube.dao.DaoSqls.SELECT_ALL_STUDIO_TWO;
import static kr.or.connect.ftYoutube.dao.DaoSqls.SELECT_BY_DAY_HOUR;
import static kr.or.connect.ftYoutube.dao.DaoSqls.UPDATE_BY_DAY_HOUR;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.or.connect.ftYoutube.dto.Studio;

@Repository
public class StudioDao {

	private NamedParameterJdbcTemplate jdbc;
	private RowMapper<Studio> rowMapper
		= BeanPropertyRowMapper.newInstance(Studio.class);

	//Constructor
	public StudioDao(DataSource dataSource) {
		
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
	
	}
	
	//SELECT Every records from table studio 1(2)
	public List<Studio> getAllStudioOne(){
		return jdbc.query(SELECT_ALL_STUDIO_ONE, Collections.emptyMap(), rowMapper);
	}
	public List<Studio> getAllStudioTwo(){
		return jdbc.query(SELECT_ALL_STUDIO_TWO, Collections.emptyMap(), rowMapper);
	}
	
	//Update using hour and day info
	public int updateByDayHour(Studio studio, Integer snum) {
		Map<String, Object> params = new HashMap<>();
		params.put("snum", snum);
		params.put("userId", studio.getUserId());
		params.put("userPw", studio.getUserPw());
		params.put("day", studio.getDay());
		params.put("hour", studio.getHour());
		
		return jdbc.update(UPDATE_BY_DAY_HOUR, params);
	}

	
	//select 'a' record from studio table
	//using hour = parameter hour, day = parameter day
	public Studio selectByDayHour(Studio studio, Integer snum) {
		Map<String, Object> params = new HashMap<>();
		params.put("snum", snum);
		params.put("day", studio.getDay());
		params.put("hour", studio.getHour());
		
		return jdbc.queryForObject(SELECT_BY_DAY_HOUR, params, rowMapper);
	}
	
	//return 'an' id if there's any matching record.
	//be used to check if client's delete request is available
	public Studio checkDeletable(Studio studio, Integer snum) {
		Map<String, Object> params = new HashMap<>();
		params.put("snum", snum);
		params.put("day", studio.getDay());
		params.put("hour", studio.getHour());
		params.put("userId", studio.getUserId());
		params.put("userPw", studio.getUserPw());
		
		return jdbc.queryForObject(CHECK_DELETABLE, params, rowMapper);
	}
	
	//delete a record from studio table
	//conditions: userId, userPw, day, hour
	public int deleteStudio(Studio studio, Integer snum) {
		Map<String, Object> params = new HashMap<>();
		params.put("snum", snum);
		params.put("day", studio.getDay());
		params.put("hour", studio.getHour());
		params.put("userId", studio.getUserId());
		params.put("userPw", studio.getUserPw());

		return jdbc.update(DELETE_STUDIO, params);
	}
}
