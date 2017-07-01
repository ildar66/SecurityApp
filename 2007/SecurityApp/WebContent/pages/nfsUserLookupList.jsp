<%@ page language = "java" %>
<%@ page contentType = "text/html; charset=windows-1251" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%--@ taglib uri="/WEB-INF/july.tld" prefix="july" --%>
<%@ page import = "com.nri.security.forms.*, com.nri.value.*, com.nri.domain.*"%>

<HTML>
<HEAD>
	<%--link rel="stylesheet" type="text/css" href="/theme/main.css"--%>
	<link rel="stylesheet" type="text/css" href="/SecurityApp/theme/Master.css">
	<jsp:include page = "/secure/layouts/browser_detection.jsp" flush="true"/>
	<TITLE>������������ ���</TITLE>
</HEAD>
<BODY class="content">
	<SCRIPT language=javascript src="../common/dialog.js" type="text/javascript"></SCRIPT> 
<%
	java.lang.String gColSpan = "4";
	NfsUserLookupListForm listForm = (NfsUserLookupListForm)request.getAttribute("NfsUserLookupListForm");
	String sortBy = listForm.getOrderBy();
	java.util.List posList = (java.util.List)request.getAttribute(BeanKeys.NFS_USERS_LOOKUP_LIST);
	int posListSize = posList.size();//���-�� �������.	
%>

<html:form action="/nfsUserLookupList.do" styleId="listForm">
<html:errors/>
<html:hidden property="orderBy"/>
<html:hidden property="selectedID" value="0"/>
<%@include file="../secure/layouts/tableJS.jspf"%>

<html:hidden property="formName"/>
<html:hidden property="fieldNames"/>

<script language="javascript">
function Go(strval) {
	var thisform = document.listForm;
	var outform = window.opener.document.forms[thisform.formName.value];
	
	if(outform != null)
	{
		var names = thisform.fieldNames.value.split('|'), values = strval.split('|');
		for(var i in names) {
			if(names[i].length > 0)
				outform[names[i]].value = unescape(values[i]);
		}
	}
	storeID(strval);
	Close();
}

function Close(){
	var thisform = document.listForm;
	var outform = window.opener.document.forms[thisform.formName.value];
	if(outform != null) {
		//document.body.style.cursor="wait";
		//window.opener.focus();
		outform.operation.value = "addLink";
		outform.submit();		
	}
	window.close();
}

function storeID(strval) {
	document.cookie = "PeopleToNfsUserListForm=" + strval;
}
</script>

<table class="framing-table" id="tableID" BORDER="0" CELLPADDING="3" CELLSPACING="1" width="100%">

	<july:separator colspan="<%= gColSpan %>" />
	
	<TR class="layout-manager">
		<TD colspan="<%= gColSpan %>">
			<table class="framing-table">
				<tr>
					<th class="find-filter">���:</th>
					<td class="find-filter" nowrap="nowrap">
						<html:text styleClass="search" property="searchStr" size="25"/>
						<%--july:searchbutton/--%>
						<INPUT TYPE='image' src='<%=request.getContextPath()%>/images/refresh.gif'  onclick='document.body.style.cursor="wait"' border='0' alt='������'>
					</td>
					<td class="find-filter" nowrap>
					<%
						String[] a = { "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�" };
						for (int i = 0; i < a.length; i++) {%>
							<A href="javascript:toggleA('<%= a[i]%>')"><%= a[i]%></A>
							<%if(a[i].equals("�")){%><BR><%}%>
					<%}%>
					&nbsp;&nbsp;&nbsp;<A href="javascript:toggleA('')">���</A>
					</td>
				</tr>
				<tr>
					<th class="find-filter">�����. ���:</th>
					<td class="find-filter" colspan="2">
						<html:radio property="activeState" value="ALL"/>���
						<html:radio property="activeState" value="Y"/>��������
						<html:radio property="activeState" value="N"/>�� ��������
					</td>
				</tr>
			</table>
		</TD>
	</TR>

	<july:separator colspan="<%= gColSpan %>" />

	<tr class="layout-manager">
		<td colspan="<%= gColSpan %>">
		<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1">
			<TR>
				<TD class="find-filter">
					<%--html:link page="/nfsUserDialog.do?action=Add">
						<IMG SRC="<%=request.getContextPath()%>/images/plus.gif" BORDER='0' ALT='�������� ������'/>
					</html:link--%>				
					<%--july:addbutton page="/EditNfsUser.do?action=Add"/--%>
					<july:backbutton page="/main.do"/>
				</TD>
				<TH class="find-filter" align="right">�������� �������:<%= posListSize %></TH>
				<TD class="find-filter"><july:navigator/></TD>
            </TR>
		</TABLE>
		</td>
	</tr>
      
      <july:separator colspan="<%= gColSpan %>" />
    
    <!-- Table header -->
    <tr class="title">
 		<TD class="column-head-name" align="center" valign="middle">
 			<img src="<%=request.getContextPath()%>/images/empty.gif" width="1" height="1" />
		</TD>
		<TD class="column-head-name">
			<A title="����������� �� ���� 'personID'" href="javascript:SortBy('personID')">��� ���</A>
			<%=isUp(sortBy, "personID")%>
		</TD>		
		<TD class="column-head-name" nowrap>
			<A title="����������� �� ���� 'login'" href="javascript:SortBy('login')">login ���</A>
			<%=isUp(sortBy, "login")%>
		</TD>
		<TD class="column-head-name">
			<A title="����������� �� ���� 'fullName'" href="javascript:SortBy('fullName')">��� ������������ ���</A>
			<%=isUp(sortBy, "fullName")%>
		</TD>
        <%--TD class="column-head-name">&nbsp;</TD--%>
    </tr>

<july:separator colspan="<%= gColSpan %>" />


        <!-- Table body -->
    <logic:iterate id="it" name="<%=BeanKeys.NFS_USERS_LOOKUP_LIST%>" type="com.nri.domain.NfsUser">
        <logic:present name="it">
			<%
			    NfsUser nfsVO = (NfsUser)it;
				String className = "normal";
				if( nfsVO.getRecordStatus().equals("D") )
					className = "gray";
			%>        
            <tr id='<bean:write name="it" property="personID" filter="true"/>' class="normal" onMouseOver="className='select'" onMouseOut="onMouseOutRow(this.id);" onclick="onClickRow(this.id);">
            	<td class="text">
                    <%--html:link page="/nfsUserDialog.do?action=Edit" paramId="nfsUser" paramName="it" paramProperty="nfsUser" paramScope="page">            	
                    	<IMG SRC="<%=request.getContextPath()%>/images/izmena.gif" BORDER='0' ALT='�������� ������'></html:link--%>
            	</td>
                <td class="text">
                	<%if( className == "normal" ){%>
					<A href='javascript:Go("<bean:write name="it" property="personID" filter="true"/>")' title="�������� ������">                
						<bean:write name="it" property="personID" filter="true"/></A>
                    <%}else{%>
                    	<B style="color: red;">�� �������:</B>
                    	<bean:write name="it" property="personID" filter="true"/>
                    <%}%>						
                </td>
                <td class="text">
                    <bean:write name="it" property="login" filter="true"/>
                </td>
                <td class="text">
                    <bean:write name="it" property="fullName" filter="true"/>
                </td>                                
                <%--td class="text">
						<html:link 
						page="/nfsUserDialog.do?action=Delete" paramId="nfsUser" paramName="it"
						paramProperty="nfsUser" paramScope="page">
							<IMG SRC="<%=request.getContextPath()%>/images/del.gif" BORDER='0' ALT='������� ������'/>
						</html:link>                    
                </td--%>
            </tr>

            <july:separator colspan="<%= gColSpan %>" />

	      </logic:present>
      </logic:iterate>

	<tr class="layout-manager">
		<td colspan="<%= gColSpan %>">
		<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1">
			<TR>
				<TD class="find-filter">
					<%--html:link page="/nfsUserDialog.do?action=Add">
						<IMG SRC="<%=request.getContextPath()%>/images/plus.gif" BORDER='0' ALT='�������� ������'/>
					</html:link--%>				
					<%--july:addbutton page="/EditNfsUser.do?action=Add"/--%>
					<july:backbutton page="/main.do"/>
				</TD>
				<TH class="find-filter" align="right">�������� �������:<%= posListSize %></TH>
				<TD class="find-filter"><july:navigator/></TD>
            </TR>
		</TABLE>
		</td>
	</tr>
      
</table>

</html:form>
<script language="javascript">
	//switchFilter();
	loadSelectedRow();
	window.location.hash=document.all.selectedID.value;
</script>
</BODY>
</HTML>
