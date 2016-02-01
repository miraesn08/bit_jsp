package json_simple.encoding_example;

import java.io.StringWriter;

import org.json.simple.JSONObject;

// Example 1-2 - Encode a JSON object - Streaming
public class ex1_2 {

	@SuppressWarnings("unchecked")
	public static void main(String[] args) throws Exception {
		JSONObject obj=new JSONObject(); 
		
		obj.put("name","foo"); 
		obj.put("num",new Integer(100)); 
		obj.put("balance",new Double(1000.21)); 
		obj.put("is_vip",new Boolean(true)); 
		obj.put("nickname",null);
		
		StringWriter out = new StringWriter(); 
		obj.writeJSONString(out); 
		String jsonText = out.toString(); 
		
		System.out.print(jsonText);
	}

}
