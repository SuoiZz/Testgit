<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.turing.utils.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>EL&JSTL的讲解</title>
	</head>
	<body>
	   在elandjstl.jsp上向四个作用域中存入数据：    
<%
    //1.向pageContext域存入数据
    pageContext.setAttribute("company", "pageContext域");
   

    //2.向request域中存入数据
    request.setAttribute("company", "依安国际");
    
    
    
    
    //3.向Session域中存入数据：存储一个对象
    User user = new User();
    user.setId(1);
    user.setName("Jack");
    user.setPassword("123");
    session.setAttribute("user", user);
    
    
    
    //4.向application域中存入数据:存储一个集合
    List<User> list = new ArrayList<User>();
    User user1 = new User();
    user1.setId(2);
    user1.setName("杨过");
    user1.setPassword("123");
    list.add(user1);
    User user2 = new User();
    user2.setId(3);
    user2.setName("郭襄");
    user2.setPassword("123");
    list.add(user2);
    application.setAttribute("list", list);
%>
<br/>
然后可以在下面的两个表格中分别去用jsp脚本和EL来实现取值
<br/>
<hr/>
脚本法取值：
<table border="2px" bordercolor="green" align="center">
   <tr>
	   <td>方法</td>
	   <td>值</td>
   </tr>
   <tr>
	    <td>pageContext作用域：</td>
	   <td><input type="text" value="<%=pageContext.getAttribute("company")%>"/></td>
   </tr>
    <tr>
	  <td>request作用域：</td>
	   <td><input type="text" value="<%=request.getAttribute("company") %>"/></td>
   </tr>
    <tr>
	  <td>session作用域：</td>
	   <td><input type="text" value="<%
		    User sessionUser = (User)session.getAttribute("user");
		    out.write(sessionUser.getName());
		   %>"/>
   </td>
   </tr>
   
    <tr>
	   <td>application作用域：</td>
	   <td><input type="text" value="<%
			  List listApplication=(List)application.getAttribute("list");
	          User userObj=(User)listApplication.get(0);
	          out.write(userObj+"");
	   %>"/></td>
   </tr>

</table>







<hr/>
使用EL表达式获得域中的值
<table border="2px" bordercolor="green" align="center">
   <tr>
	   <td>方法</td>
	   <td>值</td>
   </tr>
   <tr>
	   <td>pageContext作用域：</td>
	   <td><input type="text" value="${pageScope.company}"/></td>
   </tr>
    <tr>
	   <td>request作用域：</td>
	   <td><input type="text" value="${requestScope.company}"/></td>
   </tr>
    <tr>
	   <td>session作用域：</td>
	   <td><input type="text" value="${sessionScope.user.name }"/>
   </td>
   </tr>
   
    <tr>
	   <td>application作用域：</td>
	   <td><input type="text" value="${applicationScope.list[1]}"/></td>
   </tr>

</table>


2.拓展与补充：<br/>
EL可以进行一些简单的运算<br/>

2.1算数运行 + - * / % 注：+只能做算数运算，不能做求和运算<br/>
算术运算:${"1"+"1" } <br/>
其结果为2  它会自动将“1”转化为数字进行运算<br/>

2.2 关系运算 == >= ,< = !=    <br/>
关系运算：${5=="5"}  <br/>
其结果为"true"<br/>

2.3 逻辑运算 & | ! && ||<br/>
逻辑运算：${2<1&&4<5}  <br/>
其结果为"false" <br/>

2.4 （empty）空运算：判断某个集合、字符串、对象是否为空。 <br/>
以下四种情况结果为true：空字符串，空的集合，值为null，找不到对应的值<br/>

测试数据：<br/>
<%
List list2=new ArrayList();
list2.add(1);
request.setAttribute("list2", list2);
request.setAttribute("a", "");
request.setAttribute("b", null);

User user001_init=new User();
//user001.setId(7);
//user001.setName("Jack");
//user001.setPassword("123456");
request.setAttribute("user001", null);
%>


取值代码：<br/><hr/>
${empty list2 }  <br/>
其结果为"false"<br/>
<hr/>
${empty a } <br/>
其结果为 "true"<br/>
<hr/>
${empty b } <br/>其结果为 "true"<br/><hr/>
${empty user001}<br/>其结果为"false"<br/>

<br/><br/><br/><hr/>

2.JSTL的常见的标签：<br/>
                       
<c:set  scope="session" var="money"     value="4000"  /><!-- 用于保存数据 -->
<c:if test="${sessionScope.money>2000}">     <!-- 与我们在一般程序中用的if一样 -->
  <c:out  value="${sessionScope.money}"/>    <%--  用于在JSP中显示数据，就像<%= ... > --%>
</c:if> 
<br/><br/><hr/>
3.c:forEach的深入讲解	<br/>	
先添加测试数据：<br/>
<%
    //1.模拟List<String> strList
    List<String> strList = new ArrayList<String>();
    strList.add("dfd");
    strList.add("ret");
    strList.add("yty");
    strList.add("hk");
    request.setAttribute("strList", strList);

    //2.遍历List<User>的值
    List<User> userList = new ArrayList<User>();
    User user7 = new User();
    user7.setId(2);
    user7.setName("路人甲");
    user7.setPassword("123");
    userList.add(user7);
    
    User user8 = new User();
    user8.setId(3);
    user8.setName("路人乙");
    user8.setPassword("123");
    userList.add(user8);
    application.setAttribute("userList", userList);
    
    

    //3.遍历Map<String,String>的值
    Map strMap = new HashMap();
    strMap.put("name", "lucy");
    strMap.put("age", "18");
    strMap.put("addr", "保定");
    strMap.put("email", "lucy@163.com");
    session.setAttribute("strMap", strMap);

    //4.遍历List<Map<String,Object>>的值
    Map<String,Object> map01 = new HashMap();
    map01.put("id", "001");
    map01.put("name", "裘千尺");
    Map<String,Object> map02 = new HashMap();
    map02.put("id", "002");
    map02.put("name", "裘千刃");
    List<Map<String,Object>> listOfmap=new ArrayList<Map<String,Object>>();
    listOfmap.add(map01);
    listOfmap.add(map02);
    request.setAttribute("listOfmap", listOfmap);   
%>

<hr/>
通过c:forEach标签取出数据：<br/>

<h1>取出strList的数据</h1>
<c:forEach items="${requestScope.strList}" var="str">
    ${str }<br/>
</c:forEach>

<br/><br/><hr/>
<h1>取出userList的数据</h1>
<c:forEach items="${userList}" var="user">
    user的name：${user.name }------user的password：${user.password }<br/>
</c:forEach>

<br/><br/><hr/>

<h1>取出strMap的数据</h1>
<c:forEach items="${strMap}" var="entry">
    ${entry.key }====${entry.value }<br/>
</c:forEach>

<br/><br/><hr/>
<h1>取出listOfmap的数据</h1>
<c:forEach items="${listOfmap}" var="map">
    ${map.id}:${map.name }<br/>
</c:forEach>



	</body>
</html>
