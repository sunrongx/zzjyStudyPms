package com.zs.pms.po;

import java.io.Serializable;

public class Tcode implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7066601313641650995L;
	private int id;
	private int cid;
	private String cname;
	private String type;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
}
