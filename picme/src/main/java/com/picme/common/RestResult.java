package com.picme.common;

import java.io.Serializable;

@SuppressWarnings("serial")
public class RestResult<T> implements Serializable {
	
	public enum ResultFlag {
		
		SUCCEED(1),
		FAILED(0);
		
		private final int value;
		
		ResultFlag(int value){
			this.value = value;
		}
		
		public int getValue(){
			return value;
		}
		
	}
	
	/**
	 * 返回值
	 */
	private int ret_flag;
	/**
	 * 错误代码
	 */
	private String error_code = ErrorCode.SUCCESS.name();
	/**
	 * 返回信息
	 */
	private String ret_msg = ErrorCode.SUCCESS.message();
	
	/**
	 * 分页数据的总条数
	 */
	private Long total_count;
	
	private T data;
	
	
	/**
	 * 错误的堆栈信息，用于调试，生产环境需要关闭调试
	 */
	private String error_stack_trace;
	/**
	 * 接口请求参数，用于调试，生产环境需要关闭调试
	 */
	private Object request_parameter;
	/**
	 * 接口消耗时间
	 */
	private long elapsed_time;

	public RestResult() {
		this.markSucceed();
	}

	public final void markSucceed() {
		this.ret_flag = ResultFlag.SUCCEED.getValue();
		this.ret_msg = ErrorCode.SUCCESS.message();
		this.error_code = ErrorCode.SUCCESS.code();
	}

	public final void markAsfailed() {
		this.ret_flag = ResultFlag.FAILED.getValue();
		this.ret_msg = ErrorCode.SYSTEM_ERROR.message();
		this.error_code = ErrorCode.SYSTEM_ERROR.code();
	}

	public String getError_code() {
		return error_code;
	}

	public void setError_code(String error_code) {
		this.error_code = error_code;
	}

	public String getRet_msg() {
		return ret_msg;
	}

	public void setRet_msg(String ret_msg) {
		this.ret_msg = ret_msg;
	}

	public Integer getRet_flag() {
		return ret_flag;
	}

	public void setRet_flag(Integer ret_flag) {
		this.ret_flag = ret_flag;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public boolean isSuccess(){
		return ResultFlag.SUCCEED.getValue()==ret_flag;
	}

	public Long getTotal_count() {
		return total_count;
	}

	public void setTotal_count(Long total_count) {
		this.total_count = total_count;
	}

	public void setRet_flag(int ret_flag) {
		this.ret_flag = ret_flag;
	}

	public String getError_stack_trace() {
		return error_stack_trace;
	}

	public void setError_stack_trace(String error_stack_trace) {
		this.error_stack_trace = error_stack_trace;
	}
	
	public Object getRequest_parameter() {
		return request_parameter;
	}

	public void setRequest_parameter(Object request_parameter) {
		this.request_parameter = request_parameter;
	}
	
	public long getElapsed_time() {
		return elapsed_time;
	}

	public void setElapsed_time(long elapsed_time) {
		this.elapsed_time = elapsed_time;
	}

	@Override
	public String toString() {
		return "RestResult [ret_flag=" + ret_flag + ", error_code=" + error_code + ", ret_msg=" + ret_msg
				+ ", total_count=" + total_count + ", data=" + data + ", error_stack_trace=" + error_stack_trace
				+ ", request_parameter=" + request_parameter + ", elapsed_time=" + elapsed_time + "]";
	}

}
