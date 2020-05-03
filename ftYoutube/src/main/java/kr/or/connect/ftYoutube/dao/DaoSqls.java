package kr.or.connect.ftYoutube.dao;

public class DaoSqls {

//get all records from studio1
	public static final String SELECT_ALL_STUDIO_ONE
		= "SELECT id, hour, minute, day, ifnull(user_id, '-') AS user_id, ifnull(user_pw, '-') AS user_pw, enroll_date FROM studio1";
//get all records from studio2
	public static final String SELECT_ALL_STUDIO_TWO
		= "SELECT id, hour, minute, day, ifnull(user_id, '-') AS user_id, ifnull(user_pw, '-') AS user_pw, enroll_date FROM studio2";

//update a record from studio table Using day and hour info	
	public static final String UPDATE_BY_DAY_HOUR 
		= "UPDATE studio:snum SET user_id = :userId, user_pw = :userPw WHERE day = :day and hour = :hour";

//select a record from studio table Using day and hour info
	public static final String SELECT_BY_DAY_HOUR
		= "SELECT user_id FROM studio:snum WHERE day = :day and hour = :hour";

//delete a record from studio table
//depending on userId, userPw, day, hour
	public static final String DELETE_STUDIO
		= "UPDATE studio:snum SET user_id = null, user_pw = null WHERE day =:day and hour = :hour and user_id =:userId and user_pw =:userPw";


}


