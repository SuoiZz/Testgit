<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>网络在线考试――后台管理</title>
<link href="<%=request.getContextPath()%>/CSS/style.css"
	rel="stylesheet"></link>
	<script language="javascript">
			function show(value)
		    {
		    	alert(value);//选中的是单选题还是多选题
		    	var sOption=document.getElementById("sOption");//单选题
		    	var mOption=document.getElementById("mOption");//单选题
		    	
		    	if(value=="单选题")
		    	{
		    		sOption.style.display="block";
		    		mOption.style.display="none";
		    	}
		    	else
		    	{
		    		sOption.style.display="none";
		    		mOption.style.display="block";	
		    	}
		    }
			
			function checkForm(form)
		    {
		    	var  course_id=document.getElementById("course_id");
		    	//alert("course_id:"+course_id);
		        var	 course_id_value=course_id.value;
		    	//alert("course_id_value:"+course_id_value);
		        if (course_id_value=="%")
		        {
		        	//window.alert("请选择一个【课程】！");	
		        	course_id.focus();//重新获取焦点
		        	document.getElementById("dv01").style.display="block";
		        	return false;
				}
		        
		        if (form["subject_name"].value=="") 
		        {
		        	form["subject_name"].focus();
		        	document.getElementById("dv02").style.display="block";
		        	return false;
				}
		        
		        if( form['subject_A'].value == '' )
		        {
		        	document.getElementById("dvA").style.display="block";
					form['subject_A'].focus();
					return false;
				}
				if( form['subject_B'].value == '' )
				{
		        	document.getElementById("dvB").style.display="block";
					form['subject_B'].focus();
					return false;
				}
				if( form['subject_C'].value == '' )
				{
		        	document.getElementById("dvC").style.display="block";
					form['subject_C'].focus();
					return false;
				}
				if( form['subject_D'].value == '' )
				{
		        	document.getElementById("dvD").style.display="block";
					form['subject_D'].focus();
					return false;
				}
		    	
				 
				var subject_type = form['subject_type'];
				if(subject_type.value=="单选题")
				{
					alert("本次选择的事单选题"+form["subject_answer"].value);
					if(form["subject_answer"].value=="%")
					{
			        document.getElementById("dvanswer").style.display="block";
		            form["subject_answer"].focus();
		            return false;
					}
				}
				else
				{
					var answerArr = document.getElementsByName("answerArr");
					var count=0;
					for(var i =0;i<answerArr.length;i++)
					{
						alert(i+"----->"+answerArr[i].checked);
						if(answerArr[i].checked==true)
						{
							count++;
						}
					}
					
					if(count==0)
					{
						 document.getElementById("dvanswerArr").style.display="block";
						 answerArr[0].focus();
				         return false;		
					}
				}
				
				return true;//非空验证通过了
		    }
			</script>
</head>
<body>

	<%@ include file="/manage/top.jsp"%>

	<table width="960" border="0" align="center" cellspacing="0" cellpadding="0">
		<tr>
			<td width="176" align="center" valign="top" bgcolor="#FFFFFF">
			
				<%@ include file="/manage/left.jsp"%>
				
			</td>
			<td align="right" valign="top" bgcolor="#FFFFFF">
				<table width="99%" border="0" cellpadding="0" cellspacing="0" align="center">
					<tr>
						<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="78%" class="word_grey" align="left">
										&nbsp;当前位置：<span class="word_darkGrey">考试题目管理&gt;&gt;添加考试题目&gt;&gt;</span>
									</td>
									<td align="right">
										<img src="<%=request.getContextPath()%>/Images/m_ico1.gif" width="5" height="9">&nbsp; 
										当前管理员：<%=((Map)session.getAttribute("user")).get("manager_name")%>&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center" valign="top">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="84%">&nbsp;</td>
								</tr>
							</table>

							<form name="questionsForm" method="post" action="<%=request.getContextPath() %>/manage/subject.do?method=add" onsubmit="return checkForm(questionsForm)" style="margin: 0px">
								<table width="85%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">

									<tr>
										<td height="30" align="left" style="padding: 5px;">所属课程：</td>
										<td align="left" id="whichTaoTi">
											<select name="course_id" onchange="F_getTaoTi(this.value)">
												<option value="%">---请选择---</option>
												<%
												List list_course=(List)request.getAttribute("list_course");
												for(int i =0;i<list_course.size();i++)
												 {
													Map map_course = (Map)list_course.get(i);
													%>
													<option value="<%=map_course.get("course_id")%>"><%=map_course.get("course_name")%></option>
												<%}%>
											</select>
										</td>
									</tr>
									<tr align="center">
										<td width="15%" height="30" align="left" style="padding: 5px;">考试题目：</td>
										<td width="85%" align="left">
											<input type="text" name="subject_name" size="40" value=""> *
										</td>
									<tr>
									<tr>
										<td height="30" align="left" style="padding: 5px;">试题类型：</td>
										<td align="left">
											<select name="subject_type" onchange="show(this.value)">
												<option value="%">---请选择---</option>
												<option value="单选题">单选题</option>
												<option value="多选题">多选题</option>
											</select>
										</td>
									</tr>
									<tr align="center">
										<td width="15%" height="30" align="left" style="padding: 5px;">选项A：</td>
										<td width="85%" align="left">
											<textarea name="subject_A" rows="2" cols="40"></textarea>*
										</td>
									</tr>
									<tr align="center">
										<td width="15%" height="30" align="left" style="padding: 5px;">选项B：</td>
										<td width="85%" align="left">
											<textarea name="subject_B" rows="2" cols="40"></textarea>*
										</td>
									</tr>
									<tr align="center">
										<td width="15%" height="30" align="left" style="padding: 5px;">选项C：</td>
										<td width="85%" align="left">
											<textarea name="subject_C" rows="2" cols="40"></textarea>*
										</td>
									</tr>
									<tr align="center">
										<td width="15%" height="30" align="left" style="padding: 5px;">选项D：</td>
										<td width="85%" align="left">
											<textarea name="subject_D" rows="2" cols="40"></textarea>*
										</td>
									</tr>
									<tr align="center">
										<td width="15%" height="30" align="left" style="padding: 5px;">正确答案：</td>
										<td width="85%" align="left" id="sOption">
											<select name="answer">
												<option value="%">---请选择---</option>
												<option value="A">A</option>
												<option value="B">B</option>
												<option value="C">C</option>
												<option value="D">D</option>
											</select>
										</td>
										<td width="85%" align="left" id="mOption" style="display: none">
											<input type="checkbox" name="answerArr" value="A" class="noborder">A 
											<input type="checkbox" name="answerArr" value="B" class="noborder">B
											<input type="checkbox" name="answerArr" value="C" class="noborder">C 
											<input type="checkbox" name="answerArr" value="D" class="noborder">D
										</td>
									</tr>

									<tr align="center">
										<td width="15%" height="30" align="left" style="padding: 5px;">备注：</td>
										<td width="85%" align="left">
											<input type="text" name="subject_remark" size="40" value="">
										</td>
									</tr>
									<tr>
										<td height="65" align="left" style="padding: 5px;">&nbsp;</td>
										<td align="left">
											<input type="submit" name="submit" value=" 保存 " class="btn_grey"> &nbsp; 
											<input type="button" name="button" value=" 返回 " onclick="window.location.href='<%=request.getContextPath() %>/manage/subject.do?method=query'" class="btn_grey">
										</td>
									</tr>
								</table>
							</form>

						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<%@ include file="/manage/copyright.jsp"%>
</body>
</html>
