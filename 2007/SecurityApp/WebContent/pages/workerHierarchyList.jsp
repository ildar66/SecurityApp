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

<%
	java.lang.String gColSpan = "7";
 	WorkerHierarchyListForm listForm = (WorkerHierarchyListForm)request.getAttribute("WorkerHierarchyListForm");
	String sortBy = listForm.getOrderBy();
	java.util.List posList = (java.util.List)request.getAttribute(BeanKeys.WORKER_HIERARCHY_LIST);
	int posListSize = posList.size();//���-�� �������.
	boolean canEdit = request.isUserInRole("administrator");
%>
<H3 id='bread-crumb'>
	<html:link page="/companyList.do">��������</html:link> &gt;
	<html:link page="/workerList.do" paramId="company" paramName="WorkerHierarchyListForm" paramProperty="companyVO.company" paramScope="request">
		���� �������� <I><bean:write name="WorkerHierarchyListForm" property="companyVO.name"/></I></html:link>  &gt;
</H3>
<BR>
<html:form action="/workerHierarchyList.do" styleId="listForm">
<html:errors/>
<html:hidden property="orderBy"/>
<html:hidden property="selectedID" value="0"/>
<%@include file="../secure/layouts/tableJS.jspf"%>

<html:hidden property="query.division"/>

<table class="framing-table" id="tableID" BORDER="0" CELLPADDING="3" CELLSPACING="1" width="100%">

	<TR class="layout-manager">
		<TD colspan="<%= gColSpan %>">
			<table class="framing-table">
				<tr>
					<th class="find-filter" title="������� � ��������������">
						��������:<br>
					   	<html:link page="/divisionList.do" paramId="company" paramName="WorkerHierarchyListForm" paramProperty="companyVO.company" paramScope="request">
                    		<I><%= listForm.getCompanyVO().getName()%><I></html:link>
					</th>
					<td class="find-filter" colspan="2">
						<UL>
				      	<logic:iterate id="dir" name="<%=BeanKeys.ENCLOSER_HIERARCHY%>" type="com.nri.domain.Division">
        					<logic:present name="dir">
        						<UL><LI>����:
	        						<html:link page="/workerHierarchyList.do" paramId="division" paramName="dir" paramProperty="division" paramScope="page">
	        							<bean:write name="dir" property="type" filter="true"/>: <I><bean:write name="dir" property="name" filter="true"/></I>
	        						</html:link>
        						</LI>
					    	</logic:present>
					    	<br>
					    </logic:iterate> 
					    </UL>           						
					</td>
				</tr>			
				<%--tr>
					<th class="find-filter">������������</th>
					<td class="find-filter">
						<html:text styleClass="search" property="searchStr" size="25"/>
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
				</tr--%>
				<tr>
					<th class="find-filter">
						����:
						<INPUT TYPE='image' src='<%=request.getContextPath()%>/images/refresh.gif'  onclick='document.body.style.cursor="wait"' border='0' alt='������'>
					</th>
					<td class="find-filter" colspan="2">
						<html:radio property="activeState" value="ALL"/>���
						<html:radio property="activeState" value="Y"/>��������
						<html:radio property="activeState" value="N"/>�� ��������
					</td>
				</tr>
			</table>
		</TD>
	</TR>

        <%--tr class="title">
          <td colspan="<%= gColSpan %>">
          	<TABLE class="buttons">
	            <TR class="title">
	              <TD class="buttons"><% if(canEdit) { %><july:addbutton page="/EditWorkerDr.do?action=Add"/><% } %><july:backbutton page="/ShowDirectionList.do"/></TD>
	              <TD class="navigator"><july:navigator/></TD>
	            </TR>
            </TABLE></TD>
        </tr--%>
        
		<tr class="layout-manager">
			<td colspan="<%= gColSpan %>">
			<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1">
				<TR>
					<TD class="find-filter">
						<% if(canEdit) { %>
							<html:link page="/workerDialog.do?action=Add&forwardName=workerHierarchyList" paramId="division" paramName="WorkerHierarchyListForm" paramProperty="query.division">
								<IMG SRC="<%=request.getContextPath()%>/images/plus.gif" BORDER='0' ALT='�������� ������'/>
							</html:link>
						<% } %>				
						<july:backbutton page="/main.do"/>
					</TD>
					<TH class="find-filter" align="right">�������� �������:&nbsp;<%= posListSize %></TH>
					<TD class="find-filter"><july:navigator/></TD>
	            </TR>
			</TABLE>
			</td>
		</tr>         

        <!-- Table header -->
        <tr class="title">
	 		<TD class="column-head-name" align="center" valign="middle">
	 			<img src="<%=request.getContextPath()%>/images/empty.gif" width="1" height="1" />
			</TD>        
            <%--july:headercolumn key="label.code" colType="number"/--%>
			<TD class="column-head-name" nowrap>
				<A title="����������� �� ���� 'worker'" href="javascript:SortBy('worker')">���</A>
				<%=isUp(sortBy, "worker")%>
			</TD>            
            <%--july:headercolumn key="label.people.fullname" colType="string"/--%>
			<TD class="column-head-name" nowrap>
				<A title="����������� �� ���� 'fullName'" href="javascript:SortBy('fullName')">���</A>
				<%=isUp(sortBy, "fullName")%>
			</TD>            
            <%--july:headercolumn key="label.worker.workposition" colType="string"/--%>
			<TD class="column-head-name" nowrap>
				<A title="����������� �� ���� 'wpName'" href="javascript:SortBy('wpName')">���������</A>
				<%=isUp(sortBy, "wpName")%>
			</TD>            
            <%--july:headercolumn key="label.isservicestuff" colType="string"/--%>
			<TD class="column-head-name" nowrap>
				<A title="����������� �� ���� 'isServiceStuff'" href="javascript:SortBy('isServiceStuff')">��������</A>
				<%=isUp(sortBy, "isServiceStuff")%>
			</TD>            
            <%--july:headercolumn key="label.worker.isenabled" colType="string"/--%>
			<TD class="column-head-name" nowrap>
				<A title="����������� �� ���� 'isActive'" href="javascript:SortBy('isActive')">����/����</A>
				<%=isUp(sortBy, "isActive")%>
			</TD>             
<% if(canEdit) { %>
            <TD class="column-head-name">&nbsp;</TD>
<% } %>
        </tr>

        <!-- Table body -->
        <logic:iterate id="worker" name="<%=BeanKeys.WORKER_HIERARCHY_LIST%>" type="com.nri.custom.WorkerTO">
            <logic:present name="worker">
            <tr id='<bean:write name="worker" property="worker" filter="true"/>' class="normal" onMouseOver="className='select'" onMouseOut="onMouseOutRow(this.id);" onclick="onClickRow(this.id);">
            	<td class="text">
                    <html:link page="/workerDialog.do?action=Edit&forwardName=workerHierarchyList" paramId="worker" paramName="worker" paramProperty="worker" paramScope="page">            	
                    	<IMG SRC="<%=request.getContextPath()%>/images/izmena.gif" BORDER='0' ALT='�������� ������'></html:link>
            	</td>            
                <td class="text">
                      <bean:write name="worker" property="worker" filter="true"/>
                </td>
                <td class="text">
                    <bean:write name="worker" property="fullNamePeople" filter="true"/>
                </td>
                <td class="text">
                    <bean:write name="worker" property="workPositionsName" filter="true"/>
                </td>
		<td class="text" align="center">
<%
			Boolean check = worker.getIsServiceStuff();
			if(check != null && check.booleanValue()) {
				%><img src="<%=request.getContextPath()%>/images/yes.gif" width=16 height=16 border=0><%
			}
%>
		</td>
                <td class="text">
                    <logic:present name="worker" property="isActive">
                        <logic:equal name="worker" property="isActive" value="true">
                            <%--bean:message key="label.worker.enabled"/--%>��������
                        </logic:equal>
                        <logic:equal name="worker" property="isActive" value="false">
                            <%--bean:message key="label.worker.disabled"/--%>��������
                        </logic:equal>
                    </logic:present>
                    <logic:notPresent name="worker" property="isActive">
                        <%--bean:message key="label.worker.disabled"/--%>��������
                    </logic:notPresent>
                </td>
<% if(canEdit) { %>
                <td class="text">
                    <%--july:delbutton page="/EditWorkerDr.do?action=Delete" paramId="worker" paramName="worker" paramProperty="worker" paramScope="page"/--%>
					<html:link page="/workerDialog.do?action=Delete&forwardName=workerHierarchyList" paramId="worker"
						paramName="worker" paramProperty="worker" paramScope="page">
						<IMG SRC="<%=request.getContextPath()%>/images/del.gif" BORDER='0' ALT='������� ������' />
					</html:link>                    
                </td>
<% } %>
            </tr>

	        </logic:present>
        </logic:iterate>

		<tr class="layout-manager">
			<td colspan="<%= gColSpan %>">
			<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1">
				<TR>
					<TD class="find-filter">
						<% if(canEdit) { %>
							<html:link page="/workerDialog.do?action=Add&forwardName=workerHierarchyList" paramId="division" paramName="WorkerHierarchyListForm" paramProperty="query.division">
								<IMG SRC="<%=request.getContextPath()%>/images/plus.gif" BORDER='0' ALT='�������� ������'/>
							</html:link>
						<% } %>				
						<july:backbutton page="/main.do"/>
					</TD>
					<TH class="find-filter" align="right">�������� �������:&nbsp;<%= posListSize %></TH>
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

