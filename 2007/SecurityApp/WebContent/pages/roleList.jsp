<%@ page language = "java" %>
<%@ page contentType = "text/html; charset=windows-1251" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%--@ taglib uri="/WEB-INF/july.tld" prefix="july" --%>
<%@ page import = "com.nri.security.forms.*, com.nri.value.*"%>

<HTML>
<HEAD>
	<%--link rel="stylesheet" type="text/css" href="/theme/main.css"--%>
	<link rel="stylesheet" type="text/css" href="/SecurityApp/theme/Master.css">
	<jsp:include page = "/secure/layouts/browser_detection.jsp" flush="true"/>	
	<TITLE>����</TITLE>
</HEAD>
<BODY class="content">
	<SCRIPT language=javascript src="<%=request.getContextPath()%>/common/dialog.js" type="text/javascript"></SCRIPT> 
<%
	java.lang.String gColSpan = "7";
	String dialogProperty = "top=100, left=350, width=500, height=310, scrollbars=yes, resizable=yes";
	RoleListForm listForm = (RoleListForm)session.getAttribute("RoleListForm");
	String sortBy = listForm.getOrderBy();
	//paging:
	java.util.List posList = (java.util.List)request.getAttribute(BeanKeys.ROLE_LIST);
	int posListSize = posList.size();//���-�� �������.
	int pageSize = (posListSize > 300)? 20 : 15 ;//���-�� ������� �� ��������.
	int pages = (posListSize%pageSize == 0) ? (posListSize/pageSize) : (posListSize/pageSize + 1);//���-�� �������.	
%>
<H3 id='bread-crumb'>
	���� &gt;
</H3><br>
<html:form action="/roleList.do" styleId="listForm">
<html:errors/>
<html:hidden property="orderBy"/>
<html:hidden property="selectedID" value="0"/>
<%@include file="../secure/layouts/tableJS.jspf"%>
<script language="javascript">
//����������� �������� �������:
function showPage(page) {
	var posListSize = <%= posListSize%>;
	var pageSize = <%= pageSize%>;
	var end = tableID.rows.length - 1;
	var start = end - posListSize;
	for(var i = start; i < end; i++){
		if(i >= start + (page-1)*pageSize && i < start + page*pageSize){
			tableID.rows[i].style.setAttribute("display", "block");			 
	 	}else{
			tableID.rows[i].style.setAttribute("display", "none");
		}
	}
	listForm.pageNumber.value = page;
}
//����������� ���� ������� �������:
function showAllPage() {
	var posListSize = <%= posListSize%>;
	var end = tableID.rows.length - 1;
	var start = end - posListSize;
	for(var i = start; i < end; i++){
		tableID.rows[i].style.setAttribute("display", "block");			 
	}
	listForm.pageNumber.value = "���";
}
</script>

<table class="framing-table" id="tableID" BORDER="0" CELLPADDING="3" CELLSPACING="1" width="100%">

<%--july:separator colspan="<%= gColSpan %>" /--%>

<TR class="layout-manager">
 <TD colspan="<%= gColSpan %>">
 
    <table class="framing-table">
		<tr>
			<th class="find-filter">
				����:&nbsp;&nbsp;<A href="javascript:toggleA('')">���</A>&nbsp;&nbsp;
			</th>
			<td class="find-filter"><html:text styleClass="search" style="width: 100pt" property="searchStr" size="10"/>
				<INPUT TYPE='image' src='<%=request.getContextPath()%>/images/refresh.gif'  onclick='document.body.style.cursor="wait"' border='0' alt='������'>&nbsp;
			</td>
			<td class="find-filter" nowrap>
			<%
				String[] a = { "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�" };
				for (int i = 0; i < a.length; i++) {%>
					<A href="javascript:toggleA('<%= a[i]%>')"><%= a[i]%></A>
					<%if(a[i].equals("�")){%><BR><%}%>
			<%}%>&nbsp;&nbsp;&nbsp;<A href="javascript:toggleA('')">���</A>			
			</td>
		</tr>
     </table>
    
  </TD>
</TR>

<july:separator colspan="<%= gColSpan %>" />
      
        <!-- Table header -->
        <tr class="layout-manager">
			<TD class="find-filter"><july:backbutton page="/main.do"/></TD>
			<TH colspan="<%= gColSpan %>" class="find-filter">
				����:<A href='<%=request.getContextPath()%>/roleDialog.do?action=Add' onclick='return openDialog(this.href, "roleDialog", "<%= dialogProperty%>");'><IMG SRC="<%=request.getContextPath()%>/images/plus.gif" BORDER='0' ALT='�������� ����'></A>
				�����: <%= posListSize%>.&nbsp;&nbsp; 
				<%if(posListSize > 0){%>
					��������: <INPUT TYPE="TEXT" NAME="pageNumber" VALUE="���" READONLY="readonly" class="editdisabled" style="width: 15pt; font-size: 80%;">
					<% for(int i = 1; i <= pages; i++){ %>
						<%--A name="pagePos_<%=i%>" class="button" onmouseover="showPage(<%=i%>);" style="vertical-align: bottom;"><%=i%></A--%>
						<INPUT type=button value=" <%=i%> " onclick="showPage(<%=i%>);" class="buttons" style="font-size: 80%; background-color:#336699; color: white;">
					<% } %>
					<%--A name="pagePos_ALL" class="button" onmouseover="showAllPage();" style="vertical-align: bottom;">���</A--%>
					<INPUT type=button value="���" onclick="showAllPage();" class="buttons" style="font-size: 80%; background-color:#336699; color: white;">
				<% } %>				
			</TH>
		</tr>
<july:separator colspan="<%= gColSpan %>" />
        <tr class="title">
        	<TD class="column-head-name" nowrap></TD>
			<TD class="column-head-name" align="center" nowrap>
				<A title="����������� �� ���� '�'" href="javascript:SortBy('sortOrder')">�</A>
				<%=isUp(sortBy, "sortOrder")%>
			</TD>        
			<TD class="column-head-name" align="center" nowrap>
				<A title="����������� �� ���� '���'" href="javascript:SortBy('role')">���</A>
				<%=isUp(sortBy, "role")%>
			</TD>
			<TD class="column-head-name" align="center" nowrap>
				<A title="����������� �� ���� '����'" href="javascript:SortBy(' rolename')">����</A>
				<%=isUp(sortBy, " rolename")%>
			</TD>
			<TD class="column-head-name" align="center" nowrap>
				<A title="����������� �� ���� '������'" href="javascript:SortBy('taskComment')">������</A>
				<%=isUp(sortBy, "taskComment")%>
			</TD>
			<TD class="column-head-name" title="�������� ����" align="center"><B>!</B></TD>			
            <TD class="column-head-name" title="���� ��� ���������">&nbsp;</TD>
        </tr>

<july:separator colspan="<%= gColSpan %>" />

         
        <!-- Table body -->
        <logic:iterate id="item" name="<%=BeanKeys.ROLE_LIST%>">
            <logic:present name="item">
            <tr id='<bean:write name="item" property="role" filter="true"/>' class="normal" onMouseOver="className='select';" onMouseOut="onMouseOutRow(this.id);" onclick="onClickRow(this.id);">
				<td class="text" style="background-color:#F0F0F0">
					<A href='<%=request.getContextPath()%>/roleDialog.do?action=Edit&role=<bean:write name="item" property="role" filter="true"/>' onclick='return openDialog(this.href, "roleDialog", "<%= dialogProperty %>");'><IMG SRC="<%=request.getContextPath()%>/images/izmena.gif" BORDER='0' ALT='�������� ������'></A>
				</td>            
                <td class="text">
                	<bean:write name="item" property="sortOrder" filter="true"/>
                </td>            
                <td class="text">
                	<bean:write name="item" property="role" filter="true"/>
                </td>
                <td class="text">
                	<bean:write name="item" property="roleName" filter="true"/>
                </td>
                <td class="text">
                	<bean:write name="item" property="taskComment" filter="true"/>
                </td>
                <td class="text">
                  	<IMG SRC="<%=request.getContextPath()%>/images/doc.gif" BORDER='0' ALT='��������' title="<bean:write name="item" property="comment" filter="true"/>">                
                </td>
                <td class="text" style="background-color:#F0F0F0">
					<A href='<%=request.getContextPath()%>/roleDialog.do?action=Delete&role=<bean:write name="item" property="role" filter="true"/>' onclick='return openDialog(this.href, "roleDialog", "<%= dialogProperty%>");'><IMG SRC="<%=request.getContextPath()%>/images/del.gif" BORDER='0' ALT='������� ������'></A>
                </td>
            </tr>

            <%--july:separator colspan="<%= gColSpan %>" /--%>

	        </logic:present>
        </logic:iterate>

        <TR class="title">
          <TD class="title"><july:backbutton page="/main.do"/></TD>
          <%--TD><A href='roleDialog.do?action=Add' onclick='return openDialog(this.href, "roleDialog", "<%= dialogProperty%>");'><IMG SRC="/images/plus.gif" BORDER='0' ALT='�������� ����'></A></TD--%>
          <TD colspan="<%= gColSpan %>"></TD>
        </TR>

      <%--july:separator colspan="<%= gColSpan %>" /--%>
      
    </table>

</html:form>
<script language="javascript">
	//switchFilter();
	loadSelectedRow();
	//window.location.hash=document.all.selectedID.value;
</script>
</BODY>
</HTML>