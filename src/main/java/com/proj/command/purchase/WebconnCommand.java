package com.proj.command.purchase;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.proj.beans.purchase.ProductListDTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WebconnCommand {
	private String json;
	private String productno;
	
	String address = "http://www.kamis.or.kr/service/price/xml.do?"
			+ "action=dailySalesList&"
			+ "p_cert_key=e2634638-5046-4d61-9755-5d440aa564c4&"
			+ "p_cert_id=1334&"
			+ "p_returntype=json";
	
	BufferedReader br;
	URL url;
	HttpURLConnection conn;
	String protocol = "GET";
	
	public WebconnCommand() throws Exception {
		url = new URL(address);
		conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod(protocol);
		br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

		json = br.readLine();
	    //테스트출력
		//System.out.println(json);
	}
	
	public List<ProductListDTO> getProdList() throws ParseException {
		List<ProductListDTO> list = new ArrayList<ProductListDTO>();
		
		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject)parser.parse(json);
		JSONArray price = (JSONArray)obj.get("price");
		
		for(int i = 0; i < price.size(); i++){
			JSONObject tmp = (JSONObject)price.get(i);
			ProductListDTO dto = new ProductListDTO();
			
			dto.setProductno((String)tmp.get("productno"));
			dto.setCategory_code((String)tmp.get("category_code"));
			dto.setCategory_name((String)tmp.get("category_name"));
			dto.setProductName((String)tmp.get("productName"));
			dto.setUnit((String)tmp.get("unit"));
			dto.setDpr1((String)tmp.get("dpr1"));
			if(tmp.get("direction") instanceof String) {
				dto.setDirection((String)tmp.get("direction"));
			} else {
				dto.setDirection("2");
			}
			
			if(tmp.get("value") instanceof String) {
				dto.setValue((String)tmp.get("value"));
			} else {
				dto.setValue("0.0");
			}
			
			list.add(dto);
		}
		return list;
	}
	
	public ProductListDTO getProd(String productno) throws ParseException {
		ProductListDTO dto = new ProductListDTO();
		
		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject)parser.parse(json);
		JSONArray price = (JSONArray)obj.get("price");
		
		for(int i = 0; i < price.size(); i++){
			JSONObject tmp = (JSONObject)price.get(i);
			
			if(((String)tmp.get("productno")).equals(productno)) {
				dto.setProductno((String)tmp.get("productno"));
				dto.setCategory_code((String)tmp.get("category_code"));
				dto.setCategory_name((String)tmp.get("category_name"));
				dto.setProductName((String)tmp.get("productName"));
				dto.setUnit((String)tmp.get("unit"));
				dto.setDpr1((String)tmp.get("dpr1"));
				if(tmp.get("direction") instanceof String) {
					dto.setDirection((String)tmp.get("direction"));
				} else {
					dto.setDirection("2");
				}
				
				if(tmp.get("value") instanceof String) {
					dto.setValue((String)tmp.get("value"));
				} else {
					dto.setValue("0.0");
				}
				break;
			}
		}
		
		return dto;
	}
}
