<%--
  Created by IntelliJ IDEA.
  User: soundligt
  Date: 2022-11-18
  Time: 오후 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.*, java.io.File" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String filename = "";
    int sizeLimit = 15 * 1024 * 1024;

    String realPath = request.getServletContext().getRealPath("upload");
    File dir = new File(realPath);
    if (!dir.exists()) dir.mkdirs();

    MultipartRequest multipartRequest = null;
    multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

    filename = multipartRequest.getFilesystemName("photo");
%>
<img src="${pageContext.request.contextPath}/upload/<%=filename%>">
</body>
</html>
