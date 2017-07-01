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
	<TITLE>���� ��� ���. ����</TITLE>
</HEAD>
<BODY class="content">

<%
	java.lang.String gColSpan = "9";
 	OperatorListForm listForm = (OperatorListForm)request.getAttribute("OperatorListForm");
	String sortBy = listForm.getOrderBy();
	java.util.List posList = (java.util.List)request.getAttribute(BeanKeys.OPERATOR_LIST);
	int posListSize = posList.size();//���-�� �������.
%>
<H3 id='bread-crumb'>
	<html:link page="/peopleList.do">���������� ����</html:link> &gt;
		 ��������� ���: <I><bean:write name="OperatorListForm" property="peopleVO.name"/></I>
</H3><br>

<html:form action="/operatorList.do" styleId="listForm">
<html:errors/>
<html:hidden property="orderBy"/>
<html:hidden property="selectedID" value="0"/>
<%@include file="../secure/layouts/tableJS.jspf"%>

<html:hidden property="man"/>

<table class="framing-table" id="tableID" BORDER="0" CELLPADDING="3" CELLSPACING="1" width="100%">

	<TR class="layout-manager">
		<TD colspan="<%= gColSpan %>">
			<table class="framing-table">
				<tr>
					<th class="find-filter">��� :</th>
					<td class="find-filter" colspan="2">
						<%= listForm.getPeopleVO().getName()%>
						<INPUT TYPE='image' src='<%=request.getContextPath()%>/images/refresh.gif'  onclick='document.body.style.cursor="wait"' border='0' alt='������'>
					</td>
				</tr>			
				<%--tr>
					<th class="find-filter">
						���� ���. ����:
						<INPUT TYPE='image' src='<%=request.getContextPath()%>/images/refresh.gif'  onclick='document.body.style.cursor="wait"' border='0' alt='������'>
					</th>
					<td class="find-filter" colspan="2">
						<html:radio property="activeState" value="ALL"/>���
						<html:radio property="activeState" value="Y"/>��������
						<html:radio property="activeState" value="N"/>�� ��������
					</td>
				</tr--%>
			</table>
		</TD>
	</TR>

		<tr class="layout-manager">
			<td colspan="<%= gColSpan %>">
			<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1">
				<TR>
					<TD class="find-filter">
						<html:link page="/operatorDialog.do?action=Add&forwardName=operatorList" paramId="man" paramName="OperatorListForm" paramProperty="man">
							<IMG SRC="<%=request.getContextPath()%>/images/plus.gif" BORDER='0' ALT='�������� ������'/>
						</html:link>
						<%--july:backbutton page="/main.do"/--%>
					</TD>
					<TH class="find-filter" align="right">�������� �������:&nbsp;<%= posListSize %></TH>
					<TD class="find-filter"><%--july:navigator/--%></TD>
	            </TR>
			</TABLE>
			</td>
		</tr>         

        <!-- Table header -->
        <tr class="title">
	 		<TD class="column-head-name" align="center" valign="middle">
	 			<img src="<%=request.getContextPath()%>/images/empty.gif" width="1" height="1" />
			</TD>        
			<TD class="column-head-name" nowrap>
				<A title="����������� �� ���� 'loginID'" href="javascript:SortBy('loginID')">��������</A>
				<%=isUp(sortBy, "loginID")%>
			</TD>            
			<TD class="column-head-name" nowrap>
				<A title="����������� �� ���� 'msUser'" href="javascript:SortBy('msUser')">����� MS</A>
				<%=isUp(sortBy, "msUser")%>
			</TD>
			<TD class="column-head-name">����</TD>
			<TD class="column-head-name" colspan="3">����� �������</TD>
			<TD class="column-head-name">��������</TD>            
            <TD class="column-head-name">&nbsp;</TD>
        </tr>

        <!-- Table body -->
        <logic:iterate id="operator" name="<%=BeanKeys.OPERATOR_LIST%>" type="com.nri.custom.OperatorTO"> 
            <logic:present name="operator">
            <tr id='<bean:write name="operator" property="operator" filter="true"/>' class="normal" onMouseOver="className='select'" onMouseOut="onMouseOutRow(this.id);" onclick="onClickRow(this.id);">
            	<td class="text">
                    <html:link page="/operatorDialog.do?action=Edit&forwardName=operatorList" paramId="operator" paramName="operator" paramProperty="operator" paramScope="page">            	
                    	<IMG SRC="<%=request.getContextPath()%>/images/izmena.gif" BORDER='0' ALT='�������� ������'></html:link>
            	</td>            
                <td class="text">
                    <bean:write name="operator" property="loginID" filter="true"/>
                </td>
                <td class="text">
                    <bean:write name="operator" property="msUser" filter="true"/>
                </td>
                 <td class="text">
                    <html:link page="/operatorToRoleList.do" paramId="operator" paramName="operator" paramProperty="operator" paramScope="page">
                        ����</html:link>
                </td>
                <td class="text">
                    <html:link page="/superRegionAccessList.do" paramId="operator" paramName="operator" paramProperty="operator" paramScope="page">
                        <%--bean:message key="label.superregion"/--%>������</html:link> 
                </td>
                <td class="text">
                    <html:link page="/regionAccessList.do" paramId="operator" paramName="operator" paramProperty="operator" paramScope="page">
                        <%--bean:message key="label.region"/--%>������</html:link>
                </td>
					<%
						//String opaccessaction = (String) request.getAttribute("opaccess");
						//System.out.println("opaccessaction = "+opaccessaction);
					%>
                <td class="text">
                	<%--A href='#' onclick='window.open("<%=opaccessaction%>?operatorId=<july:stringwrite name="oper" property="oper"/>")' title="��������� ����� �������">
                		��������� ����� �������</A--%>
                </td>               
                <td class="text">
				    <july:link page="/CopyOperatorAccess.do" paramId="operator" paramName="oper" paramProperty="oper" paramScope="page" alttext="msg.operatorCopy">
				        �����</july:link>
                </td>
                <td class="text">
					<html:link page="/operatorDialog.do?action=Delete&forwardName=operatorList" paramId="operator"
						paramName="operator" paramProperty="operator" paramScope="page">
						<IMG SRC="<%=request.getContextPath()%>/images/del.gif" BORDER='0' ALT='������� ������' />
					</html:link>                    
                </td>
	        </tr>
	        </logic:present>
        </logic:iterate>

		<tr class="layout-manager">
			<td colspan="<%= gColSpan %>">
			<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1">
				<TR>
					<TD class="find-filter">
						<html:link page="/operatorDialog.do?action=Add&forwardName=operatorList" paramId="man" paramName="OperatorListForm" paramProperty="man">
							<IMG SRC="<%=request.getContextPath()%>/images/plus.gif" BORDER='0' ALT='�������� ������'/>
						</html:link>
						<%--july:backbutton page="/main.do"/--%>
					</TD>
					<TH class="find-filter" align="right">�������� �������:&nbsp;<%= posListSize %></TH>
					<TD class="find-filter"><%--july:navigator/--%></TD>
	            </TR>
			</TABLE>
			</td>
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

