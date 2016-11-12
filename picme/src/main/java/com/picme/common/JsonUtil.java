package com.picme.common;

import java.util.LinkedHashMap;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

public class JsonUtil {

	 public static ObjectMapper getDefaultObjectMapper() {  
	        ObjectMapper mapper = new ObjectMapper();  
	        //设置将对象转换成JSON字符串时候:包含的属性不能为空或"";    
	        //Include.Include.ALWAYS 默认    
	        //Include.NON_DEFAULT 属性为默认值不序列化    
	        //Include.NON_EMPTY 属性为 空（""）  或者为 NULL 都不序列化    
	        //Include.NON_NULL 属性为NULL 不序列化    
	        mapper.setSerializationInclusion(Include.NON_NULL);  
	     // to allow serialization of "empty" POJOs (no properties to serialize)
	     // (without this setting, an exception is thrown in those cases)
	        mapper.disable(SerializationFeature.FAIL_ON_EMPTY_BEANS);
	        //设置将MAP转换为JSON时候只转换值不等于NULL的  
	       // mapper.configure(SerializationConfig.Feature.WRITE_NULL_MAP_VALUES, false);  
	     // to force escaping of non-ASCII characters:
	        mapper.configure(JsonGenerator.Feature.ESCAPE_NON_ASCII, true);
	        //mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));  
	        // to allow C/C++ style comments in JSON (non-standard, disabled by default)
	        // (note: with Jackson 2.5, there is also `mapper.enable(feature)` / `mapper.disable(feature)`)
	        mapper.configure(JsonParser.Feature.ALLOW_COMMENTS, true);
	        return mapper;  
	    } 
	 
	 /** 
	     * json对象转JAVA对象 
	     *  
	     * @param jsonStr 
	     * @param valueType 
	     * @return 
	     */  
	    public static <T> T readValue(String jsonStr, Class<T> valueType) {  
	    	ObjectMapper objectMapper = new ObjectMapper();
	        try {  
	            return objectMapper.readValue(jsonStr, valueType);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	  
	        return null;  
	    } 
	    
	    public static void main(String[] args) {
			String s = "{ \"access_token\":\"ACCESS_TOKEN\",\"expires_in\":7200,\"refresh_token\":\"REFRESH_TOKEN\", \"openid\":\"OPENID\",\"scope\":\"SCOPE\"}";
			LinkedHashMap o = (LinkedHashMap) JsonUtil.readValue(s, Object.class);
			System.out.println(o.get("access_token"));
	    }
}
