package com.mycloset.util;

import lombok.Data;

@Data
public class Critera {
	
	private int pageNum;
	private int amount;
	
	public Critera() {
		this(1, 10);
	}

	public Critera(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
	
}
