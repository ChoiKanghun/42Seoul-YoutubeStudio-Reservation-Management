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

//select a record from studio table
//condition : user_id, user_pw, day, hour and snum
//used to check if client can use delete API 
	public static final String CHECK_DELETABLE
		= "SELECT id FROM studio:snum WHERE day = :day and hour = :hour and user_id = :userId and user_pw = :userPw";
	
//delete a record from studio table
//depending on userId, userPw, day, hour
	public static final String DELETE_STUDIO
		= "UPDATE studio:snum SET user_id = null, user_pw = null WHERE day =:day and hour = :hour and user_id =:userId and user_pw =:userPw";

//make days one-day-back.
//For example, secondday->firstday, thirdday->secondday and so on.
	public static final String STUDIO_DAY_MOVE
		= "UPDATE studio:snum AS s1, studio:snum AS s2 "
				+ "SET s1.user_id = s2.user_id, s1.user_pw = s2.user_pw "
				+ "WHERE (s1.id=:idPrior) AND (s2.id=:idLater)";

//delete user_id, user_pw WHERE day='firstday'
	public static final String REMOVE_FIRST_DAY
		= "UPDATE studio:snum SET user_id=null, user_pw=null "
			+ " WHERE day='seventhday' ";

}


