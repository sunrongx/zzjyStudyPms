package com.zs.pms.po;

import java.io.Serializable;

public class TDep implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1640931736530463006L;
	private int id;
	private String name;
	private int pid; // 上级ID
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	
	
}
