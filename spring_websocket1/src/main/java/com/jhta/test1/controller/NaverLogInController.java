package com.jhta.test1.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.SecureRandom;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;

@Controller
public class NaverLogInController {
     
    private String naverClientId = "네이버API_Client_ID";
     
    private String naverClientSecret = "네이버API_Client_Secret";
     
    private String state = "";
     
    @Autowired
    @Qualifier("authenticationManager")
    protected AuthenticationManager authenticationManager;
     
    /**
     * 네이버 로그인 요청
     * 
     * @param request
     * @param uri
     * @return
     */
    @RequestMapping(value = "/naverLogin.do")
    public String makeNaverRequestStatement(
            HttpServletRequest request,
            @RequestParam(value = "uri", required = false) String uri) 
    {
        HashMap<String, String> naverUrl = this.makeRequestStatement(request, naverClientId);
        this.state = naverUrl.get("state");
        String returnUrl = request.getHeader("referer");
         
        return "redirect:" + naverUrl.get("url");
    }
     
    /**
     * 네이버 로그인 요청에 대한 응답 처리
     * 
     * @param request
     * @param response
     * @param state
     * @param code
     * @param error
     * @param error_description
     * @return
     */
    @RequestMapping(value = "/naverRequestKey.do")
    public String getNaverRequestKey(
            HttpServletRequest request,
            HttpServletResponse response,
            @RequestParam("state") String state, 
            @RequestParam(value = "code", required = false) String code, 
            @RequestParam(value = "error", required = false) String error, 
            @RequestParam(value = "error_description", required = false) String error_description) 
    {
        HttpSession session = request.getSession();
         
        System.out.print("state = " + this.state + "="+  state + "/code = " + code + "/error = " + error + "/error_description = " + error_description);
         
        if (state.equals(this.state)) {
            session.setAttribute("isLoged", true);
        } else {
            session.setAttribute("isLoged", false);
            //System.out.println("state key값 불일치. 인증에러");
            return "redirect:/index.html";
        }
         
        // 네이버에 token_type, access_token 요청
        HashMap<String, String> result1 = this.getRequestKey(request, state, code, naverClientId, naverClientSecret);
         
        //
        String access_token = result1.get("access_token");
        String refresh_token = result1.get("refresh_token");
        String token_type = result1.get("token_type");
         
        System.out.println("access_token = " + access_token + "," + refresh_token + "," + token_type);
 
        // 사용자 정보 조회 요청
        HashMap<String, Object> result2 = this.requestUserInfo(token_type, access_token);
        System.out.println("result=" + result2);
 
        String email = (String)result2.get("email");
         
        if (email==null) {
            System.out.println("email = " + email);
            session.setAttribute("isLoged", false);
            return "redirect:/index.html";
        }
         
		String user_id = (String)result2.get("email");
         
        // 수동 로그인(spring security manual login) 처리
        try {
            // 
            UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken("abcd", "1111");
             
            // Authenticate the user
            Authentication authentication = authenticationManager.authenticate(authRequest);
            SecurityContext securityContext = SecurityContextHolder.getContext();
            securityContext.setAuthentication(authentication);
        } catch (Exception e) {
            e.printStackTrace();
            SecurityContextHolder.getContext().setAuthentication(null);
        }
         
        //return "redirect:" + returnUrl;
        return "redirect:/index.html";
    }
     
    /**
     * 호스트이름 반환
     * 
     * @param request
     * @return
     */
    public static String getHostname(HttpServletRequest request) {
        String port_str = (request.getServerPort()==80 ? "" : ":" + request.getServerPort());
        return "http://" + request.getServerName() + port_str + request.getContextPath();
    }
     
    /**
     * state 값 생성
     * 
     * @return
     */
    public String generateState() {
        SecureRandom random = new SecureRandom();
        return new BigInteger(130, random).toString(32);
    }
     
    /**
     * 네이버 로그인 요청 (Redirect URL 생성)
     * 
     * 1. redirect 생성 - 네이버 로그인 요청 완료 후 응답 받는 url 생성
     * 2. state 생성 - Ramdom 함수로 생성
     * 3. 요청 URL 생성 반환
     * 
     * @param request
     * @param clientId
     * @return
     */
    private HashMap<String, String> makeRequestStatement(HttpServletRequest request, String clientId) {
		// String redirectUri = "http://127.0.0.1:8080/naverRequestKey.cmx";
		String redirectUri = getHostname(request) + "/naverRequestKey.do";
		String state = generateState();
		String url = "https://nid.naver.com/oauth2.0/authorize?" + "response_type=code&client_id=" + clientId
				+ "&redirect_uri=" + redirectUri + "&state=" + state;

		HashMap<String, String> naverUrl = new HashMap<String, String>();
		naverUrl.put("state", state);
		naverUrl.put("url", url);
		return naverUrl;
	}

	/**
	 * 네이버에 token_type, access_token 요청(로그인 성공 이후)
	 * 
	 * @param request
	 * @param state
	 * @param code
	 * @param clientId
	 * @param naverClientSecret
	 * @return
	 */
	private HashMap<String, String> getRequestKey(HttpServletRequest request, String state, String code,
			String clientId, String naverClientSecret) {
		String naverUrl = "https://nid.naver.com/oauth2.0/token?client_id=" + clientId + "&client_secret="
				+ naverClientSecret + "&grant_type=authorization_code" + "&state=" + state + "&code=" + code;
		String naverJsonKey = "";// null로 하니까 null이 json에 포함이 됨.
		HashMap<String, String> result = new HashMap<String, String>();

		try {
			HttpURLConnection conn = (HttpURLConnection) new URL(naverUrl).openConnection();
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String input;
			while ((input = reader.readLine()) != null) {
				naverJsonKey += input;
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		try {
			JSONParser parser = new JSONParser();
			JSONObject jsonObject = (JSONObject) parser.parse(naverJsonKey);

			result.put("access_token", (String) jsonObject.get("access_token"));
			result.put("refresh_token", (String) jsonObject.get("refresh_token"));
			result.put("token_type", (String) jsonObject.get("token_type"));

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 네이버에 로그인 사용자의 정보 요청
	 * 
	 * @param token_type
	 * @param access_token
	 * @return
	 */
	public HashMap<String, Object> requestUserInfo(String token_type, String access_token) {

		String url = "https://apis.naver.com/nidlogin/nid/getUserProfile.xml";
		String naverResult = "";
		try {
			HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", token_type + " " + access_token);
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String input;
			while ((input = reader.readLine()) != null) {
				naverResult += input;
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		HashMap<String, Object> result = new HashMap<String, Object>();

		try {
			InputSource is = new InputSource(new StringReader(naverResult));
			Document xml = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
			XPath xpath = XPathFactory.newInstance().newXPath();
			Node email = (Node) xpath.evaluate("//data/response/email", xml, XPathConstants.NODE);
			Node nickname = (Node) xpath.evaluate("//data/response/nickname", xml, XPathConstants.NODE);
			Node profile_image = (Node) xpath.evaluate("//data/response/profile_image", xml, XPathConstants.NODE);
			Node age = (Node) xpath.evaluate("//data/response/age", xml, XPathConstants.NODE);
			Node gender = (Node) xpath.evaluate("//data/response/gender", xml, XPathConstants.NODE);
			Node id = (Node) xpath.evaluate("//data/response/id", xml, XPathConstants.NODE);
			Node birthday = (Node) xpath.evaluate("//data/response/birthday", xml, XPathConstants.NODE);
			if (email != null)
				result.put("email", email.getTextContent());
			if (nickname != null)
				result.put("nickname", nickname.getTextContent());
			if (profile_image != null)
				result.put("profile_image", profile_image.getTextContent());
			if (age != null)
				result.put("age", age.getTextContent());
			if (gender != null)
				result.put("gender", gender.getTextContent());
			if (id != null)
				result.put("id", id.getTextContent());
			if (birthday != null)
				result.put("birthday", birthday.getTextContent());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}


