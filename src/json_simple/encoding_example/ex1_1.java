package json_simple.encoding_example;

import org.json.simple.JSONObject;

// Example 1-1 - Encode a JSON object
public class ex1_1 {

	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		JSONObject obj = new JSONObject();

		obj.put("name", "foo");
		obj.put("num", new Integer(100));
		obj.put("balance", new Double(1000.21));
		obj.put("is_vip", new Boolean(true));
		obj.put("nickname", null);

		System.out.print(obj); 
	}

}
