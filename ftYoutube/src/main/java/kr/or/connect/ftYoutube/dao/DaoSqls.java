package kr.or.connect.ftYoutube.dao;

public class DaoSqls {

//get all records from studio1
	public static final String SELECT_ALL_STUDIO_ONE
		= "SELECT id, hour, minute, day, ifnull(user_id, '-') AS user_id, ifnull(user_pw, '-') AS user_pw, enroll_date FROM studio1";
//get all records from studio2
	public static final String SELECT_ALL_STUDIO_TWO
		= "SELECT id, hour, minute, day, ifnull(user_id, '-') AS user_id, ifnull(user_pw, '-') AS user_pw, enroll_date FROM studio2";
	
	
}
