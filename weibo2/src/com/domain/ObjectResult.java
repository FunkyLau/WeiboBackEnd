package com.domain;

public class ObjectResult extends Result {
	private Object object;
	private Result result;
	public Object getObject() {
		return object;
	}
	public void setObject(Object object) {
		this.object = object;
	}
	public Result getResult() {
		return result;
	}
	public void setResult(Result result) {
		this.result = result;
	}
	
	public ObjectResult(String resCode,String resDesc,Object object) {
		result = new Result();
		result.setResCode(resCode);
		result.setResDesc(resDesc);
		this.setResult(result);
		this.setObject(object);
	}

}
