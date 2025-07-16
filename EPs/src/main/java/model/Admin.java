package model;

public class Admin {
	private static final long serialVersionUID = 1L;
	private int userID;
	private String email;
	private String password;
	private boolean loggedIn = false;
	
	public Admin() {	}
	
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isLoggedIn() {
		return loggedIn;
	}
	public void setLoggedIn(boolean loggedIn) {
		this.loggedIn = loggedIn;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

}
