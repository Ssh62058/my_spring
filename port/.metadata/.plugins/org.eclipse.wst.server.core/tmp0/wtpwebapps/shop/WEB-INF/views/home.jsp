<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="include/header.jsp" flush="false"/>
<!-- jsp에서 주로 출력버퍼를 강제로 비우는 용도로 사용한다 이를 통해서 페이지에서 실시간으로 데이터를 표시하거나 여러단계의 출력을 효과적으로 관리할수 있다 -->
<jsp:include page="include/body.jsp" flush="false"/>


<jsp:include page="include/footer.jsp" flush="false"/>
