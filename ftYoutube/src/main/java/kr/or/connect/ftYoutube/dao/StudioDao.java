package kr.or.connect.ftYoutube.dao;

import static kr.or.connect.ftYoutube.dao.DaoSqls.SELECT_ALL_STUDIO_ONE;
import static kr.or.connect.ftYoutube.dao.DaoSqls.SELECT_ALL_STUDIO_TWO;

import java.util.Collections;
import java.util.List;

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
}
