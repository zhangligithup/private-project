package cn.tslanpu.test.unit.domain;

import java.io.Serializable;

public class Position implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String job;
	private int id;
	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Position [id=" + id + ", job=" + job + "]";
	}
}
