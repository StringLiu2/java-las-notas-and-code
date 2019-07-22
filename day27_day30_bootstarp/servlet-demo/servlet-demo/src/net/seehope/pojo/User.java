package net.seehope.pojo;

import java.io.Serializable;

public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String username;
	private String password;
	private String photo_src;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getPhoto_src() {
		return photo_src;
	}

	public void setPhoto_src(String photo_src) {
		this.photo_src = photo_src;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", photo_src=" + photo_src + "]";
	}
	
	

}
