package com.sys.db.entity;

import com.sys.base.BaseEntity;
/**
 * @author chenchuan
 * @date 2016年1月22日
 * 系统用户
 */
public class User extends BaseEntity{
	private String userName;
	private String password;
	
    public User() {
    }
    public User(String userName) {
		super();
		this.userName = userName;
	}
    
	public User(String userName, String password) {
		super();
		this.userName = userName;
		this.password = password;
	}
	

	public User(Integer id) {
		super.setId(id);
	}


	public String getUserName() {
		return userName;
	}
	public String getPassword() {
		return password;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
