package com.jj.common;

import java.lang.reflect.Type;
import java.util.Date;

import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

public class GsonDateConverter implements JsonSerializer<Date>, JsonDeserializer<Date>{

	@Override
	public JsonElement serialize(Date arg0, Type arg1, JsonSerializationContext arg2) {
		
		return null;
	}
	
	
	@Override
	public Date deserialize(JsonElement arg0, Type arg1, JsonDeserializationContext arg2) throws JsonParseException {
		// TODO Auto-generated method stub
		return null;
	}

	
}
