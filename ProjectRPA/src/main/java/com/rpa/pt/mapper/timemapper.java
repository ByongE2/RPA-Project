package com.rpa.pt.mapper;

import org.apache.ibatis.annotations.Select;

public interface timemapper {
	@Select("SELECT sysdate FROM dual")
	public String getTime1();
	
	public String getTime2();
}
