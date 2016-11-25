package com.picme.common;


public enum ErrorCode {

	SUCCESS("成功！"),
	SYSTEM_ERROR("系统错误"),
	THE_END("定义结束标记");
	
	private String message;
	private String code;

	ErrorCode(String message) {
		this.code = this.name();
		this.message = message;
	}
    ErrorCode(String code, String message) {
        this.code = code;
        this.message = message;
    }
	
	public String message() {
		return message;
	}

    public String code() {
        return code;
    }
}
