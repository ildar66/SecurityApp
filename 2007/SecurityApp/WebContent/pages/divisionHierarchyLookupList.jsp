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
	<TITLE>�������������</TITLE>
</HEAD>
<BODY class="content">
	<SCRIPT language=javascript src="../common/dialog.js" type="text/javascript"></SCRIPT> 
	
<%
	java.lang.String gColSpan = "8";
	DivisionHierarchyLookupListForm listForm = (DivisionHierarchyLookupListForm)request.getAttribute("DivisionHierarchyLookupListForm");
	String sortBy = listForm.getOrderBy();
	java.util.List posList = (java.util.List)request.getAttribute(BeanKeys.DIVISION_HIERARCHY_LOOKUP_LIST);
	int posListSize = posList.size();//���-�� �������.
	boolean canEdit = request.isUserInRole("administrator");
%>
<%--H3 id='bread-crumb'>
	<html:link page="/companyList.do">��������</html:link> &gt;
	<html:link page="/divisionList.do" paramId="company" paramName="DivisionListForm" paramProperty="company" paramScope="session">
		������������� �������� <I><bean:write name="DivisionListForm" property="companyVO.name"/></I></html:link>  &gt;
</H3><BR--%>
<html:form action="/divisionHierarchyLookupList.do" styleId="listForm">
<html:errors/>
<html:hidden property="orderBy"/>
<html:hidden property="selectedID" value="0"/>
<%@include file="../secure/layouts/tableJS.jspf"%>

<html:hidden property="encloser"/>

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
	Close();
}
function Close(){
	var thisform = document.listForm;
	var outform = window.opener.document.forms[thisform.formName.value];
	if(outform != null) {
		document.body.style.cursor="wait";
		window.opener.focus();
	}
	window.close();
}
</script>

<table class="framing-table" id="tableID" BORDER="0" CELLPADDING="3" CELLSPACING="1" width="100%">



	<TR class="layout-manager">
		<TD colspan="<%= gColSpan %>">
			<table class="framing-table">
				<tr>
					<th class="find-filter">
						��������:
						<P>
						   	<html:link page="/divisionLookupList.do" paramId="company" paramName="DivisionHierarchyLookupListForm" paramProperty="companyVO.company" paramScope="request">
                        		<I><%= listForm.getCompanyVO().getName()%></I></html:link>
						</P>						
					</th>
					<td class="find-filter" colspan="2">
						<UL>
				      	<logic:iterate id="dir" name="<%=BeanKeys.ENCLOSER_HIERARCHY%>" type="com.nri.domain.Division">
        					<logic:present name="dir">
        						<UL><LI>
	        						<html:link page="/divisionHierarchyLookupList.do" onclick="this.href = this.href + '&formName=' + formName.value+ '&fieldNames=' + fieldNames.value" paramId="encloser" paramName="dir" paramProperty="division" paramScope="page">
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
						�������������:
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
          <td colspan="<%= gColSpan %>"><TABLE class="buttons">
            <TR class="title">
              <TD class="buttons"><% if(canEdit) { %><july:addbutton page="/EditDirection.do?action=Add"/><% } %><july:backbutton page="/ShowCompanyList.do"/></TD>
              <TD class="navigator"><july:navigator/></TD>
            </TR>
            </TABLE></TD>
        </tr--%>
        
		<tr class="layout-manager">
			<td colspan="<%= gColSpan %>">
			<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1">
				<TR>
					<TD class="find-filter">
						<%--html:link page="/divisionDialog.do?action=Add&forwardName=divisionHierarchyLookupList" paramId="encloser" paramName="DivisionHierarchyLookupListForm" paramProperty="encloser">
							<IMG SRC="<%=request.getContextPath()%>/images/plus.gif" BORDER='0' ALT='�������� ������'/>
						</html:link--%>				
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
            <%--july:headercolumn key="label.code" colType="number"/--%>
			<TD class="column-head-name" nowrap>
				<A title="����������� �� ���� 'division'" href="javascript:SortBy('division')">���</A>
				<%=isUp(sortBy, "division")%>
			</TD>
			<TD class="column-head-name">
				<A title="����������� �� ���� 'type'" href="javascript:SortBy('type')">���</A>
				<%=isUp(sortBy, "type")%>
			</TD>			            
            <%--july:sortcolumn ascFinder="1" descFinder="2" key="label.name" colType="string"/--%>
			<TD class="column-head-name">
				<A title="����������� �� ���� 'name'" href="javascript:SortBy('name')">������������</A>
				<%=isUp(sortBy, "name")%>
			</TD>
            <%--july:headercolumn key="label.services" colType="link"/--%>
            <TD class="column-head-name">�������������</TD>
<% if(canEdit) { %>
	     <TD class="column-head-name">&nbsp;</TD>
<% } %>
        </tr>




        <!-- Table body -->
        <logic:iterate id="dir" name="<%=BeanKeys.DIVISION_HIERARCHY_LOOKUP_LIST%>" type="com.nri.domain.Division">
            <logic:present name="dir">
            <tr id='<bean:write name="dir" property="division" filter="true"/>' class="normal" onMouseOver="className='select'" onMouseOut="onMouseOutRow(this.id);" onclick="onClickRow(this.id);">
            	<td class="text">
                    <%--html:link page="/divisionDialog.do?action=Edit&forwardName=divisionHierarchyLookupList" paramId="division" paramName="dir" paramProperty="division" paramScope="page">            	
                    	<IMG SRC="<%=request.getContextPath()%>/images/izmena.gif" BORDER='0' ALT='�������� ������'></html:link--%>
            	</td>             
                <td class="text">
                      <bean:write name="dir" property="division" filter="true"/>
                </td>
                <td class="text">
                      <bean:write name="dir" property="type" filter="true"/>
                </td>                
                <td class="text">
					<A href='javascript:Go("<bean:write name="dir" property="division" filter="true"/>|<bean:write name="dir" property="name" filter="true"/>")' title="�������� ������">                                                
                    	<bean:write name="dir" property="name" filter="true"/></A>
                </td>
                <td class="text">
                    <html:link page="/divisionHierarchyLookupList.do" onclick="this.href = this.href + '&formName=' + formName.value+ '&fieldNames=' + fieldNames.value" paramId="encloser" paramName="dir" paramProperty="division" paramScope="page">
                        <%--bean:message key="label.services"/--%>�������������
                    </html:link>
                </td>
<% if(canEdit) { %>
                <td class="text">
   					<%--html:link page="/divisionDialog.do?action=Delete&forwardName=divisionHierarchyLookupList" paramId="division"
						paramName="dir" paramProperty="division" paramScope="page">
						<IMG SRC="<%=request.getContextPath()%>/images/del.gif" BORDER='0' ALT='������� ������' />
					</html:link--%> 
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
						<%--html:link page="/divisionDialog.do?action=Add&forwardName=divisionHierarchyLookupList" paramId="encloser" paramName="DivisionHierarchyLookupListForm" paramProperty="encloser">
							<IMG SRC="<%=request.getContextPath()%>/images/plus.gif" BORDER='0' ALT='�������� ������'/>
						</html:link--%>				
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
	window.location.hash=document.all.selectedID.value;
</script>
</BODY>
</HTML>
