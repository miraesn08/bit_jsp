<%@ page language="java" contentType="application/json"
    pageEncoding="UTF-8"%>
<%-- eclipse 환경설정에서 browser를 external browser로 설정 --%>
<%--
	자바는 라이브러리가 jar파일로 만듬. jar 파일안에는 여러개의 class,interface 등이 들어있다.
	1) eclipse dynamic web project에  다른 사람이 만든 jar 파일을 추가하여 사용하려면 어떻게 하는가?
	2) 자바 객체(DTO or VO) --> json으로 만드는 라이브러리를 찾는다.
	3) Member 객체를 json 문자열로 만드는 main 메소드를 가진 클래스를 작성한다.
	   	그래서 라이브러리를 테스트한다.
	4) jsp에서 Member객체를 json으로 만들어 출력한다.
 --%>    
{
	"name" : "홍길동",
	"age" : 50
}