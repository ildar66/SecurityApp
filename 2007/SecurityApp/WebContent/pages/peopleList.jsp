<%@ page language = "java" %>
<%@ page contentType = "text/html; charset=windows-1251" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%--@ taglib uri="/WEB-INF/july.tld" prefix="july" --%>
<%@ page import = "com.nri.security.forms.*, com.nri.value.*, com.nri.domain.Page "%>
<HTML>
<HEAD>
	<%--link rel="stylesheet" type="text/css" href="/theme/main.css"--%>
	<link rel="stylesheet" type="text/css" href="/SecurityApp/theme/Master.css">
	<jsp:include page = "/secure/layouts/browser_detection.jsp" flush="true"/>
	<%--script language="JavaScript" src="/SecurityApp/scripts/menu_functions.js"></script--%>
	<%--script language="JavaScript" src="/SecurityApp/scripts/collectionform.js"></script--%>

	<TITLE>���������� ����</TITLE>
</HEAD>
<BODY class="content">

<%	
	String gColSpan = "10";
	PeopleListForm listForm = (PeopleListForm) session.getAttribute("PeopleListForm");
	String sortBy = listForm.getOrderBy();
	int startAtRow = listForm.getStartAtRow();
	int howManyRows = listForm.getHowManyRows();
	Page currentPage = (Page)request.getAttribute(BeanKeys.PEOPLE_PAGE);
	int startOfNextPage = startAtRow + howManyRows;//currentPage.getStartOfNextPage();
	int startOfPreviousPage = Math.max(startAtRow - howManyRows, 0);;//currentPage.getStartOfPreviousPage();
	int posListSize = currentPage.getList().size();//���-�� �������.
	int pageSize = (posListSize > 100)? (howManyRows/10) : 10 ;//���-�� ������� �� ��������.
	int pages = (posListSize%pageSize == 0) ? (posListSize/pageSize) : (posListSize/pageSize + 1);//���-�� �������.
	//int numStartPage = startAtRow/pageSize + 1;
%>
<H3 id='bread-crumb'>
	���������� ���� &gt;
</H3><br>
<html:form action="/peopleList.do" styleId="listForm">
	<html:errors/>
	
	<html:hidden property="orderBy" />
	<html:hidden property="selectedID" value="0" />
	<%--html:hidden property="startAtRow" /--%>
	
	<%@include file="../secure/layouts/tableJS.jspf"%>	
	
<script language="javascript">
	function MoveTo(school){
		if(school == 'previous'){
			document.listForm.startAtRow.value = <%= startOfPreviousPage%>;
		}else if (school == 'next'){
			document.listForm.startAtRow.value = <%= startOfNextPage%>;
		}else{
			document.listForm.startAtRow.value = 0;
		}
	    document.body.style.cursor="wait";	
		document.listForm.submit();
		return false;	
	}
	function toggle(letter){
		document.listForm.startAtRow.value = 0;
	    document.body.style.cursor="wait";
	    toggleA(letter);
	}
//����������� �������� �������:
function showPage(page, pageNumber) {
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
	//listForm.pageNumber.value = pageNumber;
	document.all.pageNumber.innerText = pageNumber;
}
//����������� ���� ������� �������:
function showAllPage() {
	var posListSize = <%= posListSize%>;
	var end = tableID.rows.length - 1;
	var start = end - posListSize;
	for(var i = start; i < end; i++){
		tableID.rows[i].style.setAttribute("display", "block");			 
	}
	//listForm.pageNumber.value = '<%= startAtRow + "-" + (startAtRow + posListSize) %>';
	document.all.pageNumber.innerHTML = '<%= startAtRow + "&divide;" + (startAtRow + posListSize) %>';
}		
</script>

	<table class="framing-table" id="tableID" BORDER="0" CELLPADDING="3" CELLSPACING="1" width="100%">

		<TR class="layout-manager">
			<TD colspan="<%=gColSpan%>">
			<table class="framing-table">
				<tr>
					<th class="find-filter">���������� ����: </th>
					<td class="find-filter">
						<html:text styleClass="search" property="searchStr" size="25" styleId="searchStr" onchange="listForm.startAtRow.value = 0;"/>
						<%--july:searchbutton/--%>
						<INPUT TYPE='image' src='<%=request.getContextPath()%>/images/refresh.gif'  onclick='document.body.style.cursor="wait"' border='0' alt='������'>
					</td>
					<td class="find-filter" nowrap>
						<%	String[] a = { "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�" };
							for (int i = 0; i < a.length; i++) {%>
								<A href="javascript:toggle('<%=a[i]%>')"><%=a[i]%></A>
								<%if (a[i].equals("�")) {%><BR>
						<%}%> <%}%>&nbsp;&nbsp;&nbsp;<A href="javascript:toggle('')">���</A>	
					</td>
				</tr>
				<tr>
					<th class="find-filter" colspan="3">
						<html:radio property="activeState" value="ALL" />��� 
						<html:radio	property="activeState" value="Y" />�������� 
						<html:radio property="activeState" value="N" />�� ��������
					</th>
				</tr>
			</table>
			</TD>
		</TR>

		<tr class="layout-manager">
			<td colspan="<%=gColSpan%>">
			<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1">
				<TR>
					<TD class="find-filter">
						<html:link page="/peopleDialog.do?action=Add">
							<IMG SRC="<%=request.getContextPath()%>/images/plus.gif" BORDER='0' ALT='�������� ������'/></html:link>
						<%--july:backbutton page="/main.do" /--%>
					</TD>
					<TH class="find-filter" nowrap="nowrap">
						������: <LABEL title="�������� ������� �� ������� �� ��������" id="pageNumber" /><%= startAtRow + "&divide;" + (startAtRow + posListSize) %></LABEL>
						<%--INPUT TYPE="TEXT" NAME="pageNumber" VALUE="<%= startAtRow + "-" + (startAtRow + posListSize) %>" READONLY="readonly" style="width: 30pt; font-size: 100%;"--%>					
					</TH>
					<TD class="buttons" nowrap="nowrap">
						<%--july:navigator /--%>
						<logic:equal name="<%=BeanKeys.PEOPLE_PAGE%>" property="previousPageAvailable" value="true">
							<INPUT type=button value="  &lt;   " onclick="MoveTo('previous')" class="buttons"/>
						</logic:equal>
						<%if(posListSize > pageSize){%>
							<%
								int maxNumber = startAtRow + posListSize;
								int startNumber = startAtRow;
							    for(int i = 1; i <= pages; i++) { 
									int endNumber = startNumber + pageSize;
									if(endNumber > maxNumber){
										endNumber = maxNumber;
									}
									String pageNumber = "" + startNumber + "&divide;" + endNumber;
									startNumber = endNumber;
								   %><INPUT type=button class="buttons" onclick="showPage(<%=i%>, '<%=pageNumber%>');" style="font-size: 80%" value="<%=pageNumber%>"/><%  }  %>
							<INPUT type=button class="buttons" onclick="showAllPage();" style="font-size: 80%; color: blue;" value="<%= startAtRow + "&divide;" + (startAtRow + posListSize) %>">
						<% } %>							
						<logic:equal name="<%=BeanKeys.PEOPLE_PAGE%>" property="nextPageAvailable" value="true">						
							<INPUT type=button value="   &gt;  " onclick="MoveTo('next')" class="buttons">
						</logic:equal>
					</TD>
				</TR>
			</TABLE>
			</TD>
		</tr>

		<!-- Table header -->
		<tr class="title">
	 		<TD class="column-head-name" align="center" valign="middle">
	 			<img src="<%=request.getContextPath()%>/images/empty.gif" width="1" height="1" />
			</TD>		
			<TD class="column-head-name" nowrap="nowrap">
				<A title="����������� �� ���� 'man'" href="javascript:SortBy('man')">���</A> <%=isUp(sortBy, "man")%>
			</TD>
			<TD class="column-head-name" nowrap="nowrap">
				<A title="����������� �� ���� 'lastName'" href="javascript:SortBy('lastName')">�������</A> <%=isUp(sortBy, "lastName")%>
			</TD>
			<TD class="column-head-name" nowrap="nowrap">
				<A title="����������� �� ���� 'firstName'" href="javascript:SortBy('firstName')">���</A> <%=isUp(sortBy, "firstName")%>
			</TD>
			<TD class="column-head-name" nowrap="nowrap">
				<A title="����������� �� ���� 'middleName'" href="javascript:SortBy('middleName')">��������</A> <%=isUp(sortBy, "middleName")%>
			</TD>
			<TD class="column-head-name" nowrap="nowrap">
				<A title="����������� �� ���� 'passportSer'" href="javascript:SortBy('passportSer')">�������</A> <%=isUp(sortBy, "passportSer")%>
			</TD>
			<TD class="column-head-name"><B>���������</B></TD>
			<TD class="column-head-name"><B>����</B></TD>
			<TD class="column-head-name"><B>���</B></TD>
			<TD class="column-head-name">&nbsp;</TD>
		</tr>

		


		<!-- Table body -->
		<logic:iterate id="it" name="<%=BeanKeys.PEOPLE_PAGE%>" property="list" type="com.nri.domain.People">
			<logic:present name="it">
				<tr id='<bean:write name="it" property="man" filter="true"/>' class="normal" onMouseOver="className='select'" onMouseOut="onMouseOutRow(this.id);" onclick="onClickRow(this.id);">
	            	<td class="text">
						<html:link page="/peopleDialog.do?action=Edit" paramId="man" paramName="it" paramProperty="man" paramScope="page">
	                    	<IMG SRC="<%=request.getContextPath()%>/images/izmena.gif" BORDER='0' ALT='�������� ������'></html:link></td>				
					<td class="text">
						<bean:write name="it" property="man" filter="true" /></td>
					<td class="text">
						<bean:write name="it" property="lastName" filter="true" />
					</td>
					<td class="text">
						<bean:write name="it" property="firstName" filter="true" />
					</td>
					<td class="text">
						<bean:write name="it" property="middleName"	filter="true" />
					</td>
					<td class="text">
						<bean:write name="it" property="passportSer" filter="true" />
					</td>
					<td class="text">
						<html:link page="/operatorList.do" paramId="man" paramName="it" paramProperty="man" paramScope="page">
							���������</html:link>
					</td>
					<td class="text">
						<html:link page="/peopleStaffList.do" paramId="man" paramName="it" paramProperty="man" paramScope="page">
							����</html:link>
					</td>
					<td class="text">
						<html:link page="/peopleToNfsUserList.do" paramId="man" paramName="it" paramProperty="man" paramScope="page">
                        	�����</html:link>
                    </td>
					<td class="text">
						<html:link page="/peopleDialog.do?action=Delete" paramId="man" paramName="it" paramProperty="man" paramScope="page">
							<IMG SRC="<%=request.getContextPath()%>/images/del.gif" BORDER='0' ALT='������� ������'/>
						</html:link>
					</td>
				</tr>

			</logic:present>
		</logic:iterate>

		<tr class="layout-manager">
			<td colspan="<%=gColSpan%>">
			<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1">
				<TR>
					<TD class="find-filter">
						<html:link page="/peopleDialog.do?action=Add">
							<IMG SRC="<%=request.getContextPath()%>/images/plus.gif" BORDER='0' ALT='�������� ������'/>
						</html:link>
						<%--july:backbutton page="/main.do" /--%>
					</TD>
					<TD class="find-filter">&nbsp;</TD>					
					<TH class="find-filter" nowrap="nowrap">�������� �������: <%=posListSize%></TH>
					<TD class="find-filter">&nbsp;</TD>
					<TH class="find-filter" nowrap="nowrap">����� �����. ������: <html:text property="startAtRow" size="2"/></TH>
					<TD class="find-filter">&nbsp;</TD>
					<TH class="find-filter" nowrap="nowrap">
						������� �� ��������: <html:text property="howManyRows" size="2" />
						<INPUT TYPE='image' src='<%=request.getContextPath()%>/images/refresh.gif'  onclick='document.body.style.cursor="wait"' border='0' alt='������'>
					</TH>					
				</TR>
			</TABLE>
			</TD>
		</tr>
	</table>
</html:form>
<script language="javascript">
	//switchFilter();
	loadSelectedRow();
	//window.location.hash=document.all.selectedID.value;
</script>
</BODY>
</HTML>