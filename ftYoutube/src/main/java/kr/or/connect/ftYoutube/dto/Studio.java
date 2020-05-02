package kr.or.connect.ftYoutube.dto;

import java.util.Date;

public class Studio {

	Long id;
	String hour;
	String minute;
	String day;
	String userId;
	String userPw;
	Date enrollDate;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getHour() {
		return hour;
	}
	public void setHour(String hour) {
		this.hour = hour;
	}
	public String getMinute() {
		return minute;
	}
	public void setMinute(String minute) {
		this.minute = minute;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	
	@Override
	public String toString() {
		return "Studio [id=" + id + ", hour=" + hour + ", minute=" + minute + ", day=" + day + ", userId=" + userId
				+ ", userPw=" + userPw + ", enrollDate=" + enrollDate + "]";
	}
	
	
}
