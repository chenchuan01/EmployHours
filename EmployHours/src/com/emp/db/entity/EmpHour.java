package com.emp.db.entity;

import com.sys.base.BaseEntity;

/**
 *EmpHour.java
 */
public class EmpHour extends BaseEntity{
	private String empno;
	private String empname;
	private String empdep;
	private String workdate;
	private Integer planhour;
	private Integer workedhour;
	private Integer misshour;
	private Integer status;
	public String getEmpname() {
		return empname;
	}
	public void setEmpname(String empname) {
		this.empname = empname;
	}
	public String getEmpdep() {
		return empdep;
	}
	public void setEmpdep(String empdep) {
		this.empdep = empdep;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getWorkdate() {
		return workdate;
	}
	public void setWorkdate(String workdate) {
		this.workdate = workdate;
	}
	public Integer getPlanhour() {
		return planhour;
	}
	public void setPlanhour(Integer planhour) {
		this.planhour = planhour;
	}
	public Integer getWorkedhour() {
		return workedhour;
	}
	public void setWorkedhour(Integer workedhour) {
		this.workedhour = workedhour;
	}
	public Integer getMisshour() {
		return misshour;
	}
	public void setMisshour(Integer misshour) {
		this.misshour = misshour;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
}
