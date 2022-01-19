<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<title>网络在线考试</title>
		<link href="<%=request.getContextPath() %>/CSS/style.css" rel="stylesheet"></link>
		<script language="javascript" src="<%=request.getContextPath() %>/JS/ContentLoader.js"></script>
	</head>
	<script language="javascript">
		function checkForm(form) {
			if (form.ID.value == "") {
				alert("请输入准考证号!");
				form.ID.focus();
				return false;
			}
		}
	</script>
	<body>
	
		<table width="960" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td >
					<img alt="" src="<%=request.getContextPath() %>/Images/top_bg.jpg" width="960" height="131"></td>
			</tr>
		</table>
		
		<table width="960" border="0" align="center" cellspacing="0" cellpadding="0">
			<tr>
				<td valign="top" bgcolor="#FFFFFF">
					<table width="950" height="474" border="0" cellpadding="0" cellspacing="0" align="center">
						<tr>
							<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="word_grey">
											&nbsp;
											<img src="<%=request.getContextPath() %>/Images/f_ico.gif" width="8" height="8" /> 
											当前位置：→ <span class="word_darkGrey">找回密码 &gt;&gt;&gt;</span>
										</td>
										<td align="right">
											<img src="<%=request.getContextPath() %>/Images/m_ico1.gif" width="5" height="9" />&nbsp;
											<a href="<%=request.getContextPath() %>/index.jsp">返回首页</a>&nbsp;
										</td>
									</tr>
								</table></td>
						</tr>
						<tr>
							<td height="222" align="center" valign="top">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="84%">&nbsp;</td>
									</tr>
								</table> 
								
								<form name="studentForm" action="<%=request.getContextPath() %>/seekPwd2.jsp" method="post" onsubmit="return checkForm(studentForm)">
									<table width="57%" height="69" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td width="17%">
												<img src="Images/step1.gif" width="73" height="30" />
											</td>
											<td width="83%" align="left" class="word_orange1">输入准考证号</td>
										</tr>
									</table>
									<table width="57%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
										<tr align="center">
											<td width="16%" height="30" align="left" style="padding: 5px;">准考证号：</td>
											<td width="84%" align="left">
												<input type="text" name="ID" size="40"/> 
												<span class="word_orange1"> *</span>
											</td>
										</tr>
										<tr>
											<td height="65" align="left" style="padding: 5px;">&nbsp;</td>
											<td align="left">
												<input type="submit" value=" 下一步 " class="btn_grey" />&nbsp;
												<input type="reset" value=" 取消 " class="btn_grey" />&nbsp;
												<input type="button" value=" 返回 " class="btn_grey" onclick="window.location.href='<%=request.getContextPath() %>/index.jsp'"/>&nbsp;
											</td>
										</tr>
									</table>
								</form>
							</td>
						</tr>
						<tr>
							<td height="153" align="right" valign="top">
								<img src="<%=request.getContextPath() %>/Images/seedPwd.gif" width="139" height="153" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<%@ include file="copyright.jsp"%>
	</body>
</html>
