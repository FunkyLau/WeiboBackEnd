package com.domain;

/**
 * @Title: 通用返回结果
 * @Description: 
 * @Company: www.dhzx.com
 * @Author: nj.xuebin@dhjt.com
 * @Version: 1.0
 */
public class Result {
	private String resCode;
	private String resDesc;
	
	/**返回代码：0，调用成功；9999，系统异常
	 * @return the resCode
	 */
	public String getResCode() {
		return resCode;
	}
	/**
	 * @param resCode the resCode to set
	 */
	public void setResCode(String resCode) {
		this.resCode = resCode;
	}
	/**描述：成功，调用成功；失败，调用失败
	 * @return the resDesc
	 */
	public String getResDesc() {
		return resDesc;
	}
	/**
	 * @param resDesc the resDesc to set
	 */
	public void setResDesc(String resDesc) {
		this.resDesc = resDesc;
	}

}
