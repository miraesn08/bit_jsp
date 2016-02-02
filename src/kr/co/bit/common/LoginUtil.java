package kr.co.bit.common;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.vo.MemberVO;

public class LoginUtil {
 	private final static String IdName = "loginUserId";
 	
 	public static boolean isLogin(HttpServletRequest request) {
 		boolean isLogin = false;

 		Cookie[] cookies = request.getCookies();
 		for (Cookie cookie : cookies) {
 			if (LoginUtil.IdName.equals(cookie.getName())) {
 				// null pointer exception 방지를 위한 coding
 				// "loginUserId"는 문자열이 항상 있으므로
 				isLogin = true;
 				break;
 			}
 		}

 		return isLogin;
 	}

 	public static void setLogin(MemberVO member, HttpServletResponse response) throws UnsupportedEncodingException {
 		Cookie cookie = new Cookie(LoginUtil.IdName, URLEncoder.encode(member.getId(), "utf-8"));
 		cookie.setPath("/");
 		cookie.setMaxAge(-1);
 		response.addCookie(cookie);									
 	}

 	public static void setLogout(HttpServletResponse response) throws UnsupportedEncodingException {
 		Cookie cookie = new Cookie(LoginUtil.IdName, "");
 		cookie.setPath("/");
 		cookie.setMaxAge(0);
 		response.addCookie(cookie);									
 	}

 	public static String getLoginId(HttpServletRequest request) throws UnsupportedEncodingException {
 		String idValue = "";

 		Cookie[] cookies = request.getCookies();
 		for (Cookie cookie : cookies) {
 			if (cookie.getName().equals(LoginUtil.IdName)) {
 				idValue  = URLDecoder.decode(cookie.getValue(),"utf-8");
 				break;
 			}
 		}

 		return idValue;
 	}
}
