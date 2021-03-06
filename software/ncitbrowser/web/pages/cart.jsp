<%--L
  Copyright Northrop Grumman Information Technology.

  Distributed under the OSI-approved BSD 3-Clause License.
  See http://ncip.github.com/nci-term-browser/LICENSE.txt for details.
L--%>

<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=windows-1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns:c="http://java.sun.com/jsp/jstl/core">
<head>
<title>NCI Term Browser</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/styleSheet.css" />
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/script.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/search.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dropdown.js"></script>
</head>
<body onLoad="javascript:popupMessage();document.forms.searchTerm.matchText.focus();">
   <script type="text/javascript" src="<%=request.getContextPath()%>/js/wz_tooltip.js"></script>
   <script type="text/javascript" src="<%=request.getContextPath()%>/js/tip_centerwindow.js"></script>
   <script type="text/javascript" src="<%=request.getContextPath()%>/js/tip_followscroll.js"></script>
   <f:view>
      <!-- Begin Skip Top Navigation -->
      <a href="#evs-content" class="hideLink" accesskey="1" title="Skip repetitive navigation links">skip navigation links</a>
      <!-- End Skip Top Navigation -->
      <h:form id="conceptForm">
         <script language="javascript" type="text/javascript">
         	function backButton() {
         		location.href = '<h:outputText value="#{CartActionBean.backurl}"/>';
         	}
            function popupMessage() {
               if (<h:outputText value="#{CartActionBean.messageflag}"/>) {
                alert('<h:outputText value="#{CartActionBean.message}"/>');
               }
            }
            var thePopup;
            function popupSelectVersions() {
          	  if (isSelected()) {  
             	  if (thePopup == null) {  
             		  thePopup = open('<%=request.getContextPath()%>/pages/cartSelPopup.jsf', 
                 	   'selectVersions','top=100, left=100, height=260, width=290, status=no, menubar=no, resizable=yes, scrollbars=yes, toolbar=no, location=no, directories=no');
             	  } else {
             		  thePopup.focus();
             	  }   
          	  } else {
                 alert('No concepts selected.');
          	  }       
            }      
            function confirmRemoveMessage() {
               if (isSelected()) {
                  return confirm("Are you sure?");
               }
               return true;
            }
            function isSelected() {
                var flag = false;
                var first = document.getElementById("conceptForm:checkboxId");
                var count = <h:outputText value="#{CartActionBean.count}"/>;
                if (first != null) {
                   if (first.checked) {
                      flag = true;
                   } else {
                      for (i=1;i<count;i++) {
                         var element = document.getElementById('conceptForm:checkboxIdj_id_' + i);
                         if (element.checked) {
                            flag = true;
                            break;
                         }
                      }
                   }
                }
                return flag;
            }               
	     </script>
        <%
         	String contactUsUrl = request.getContextPath() + "/pages/contact_us.jsf";
     			String subsetsUrl = request.getContextPath()	+ "/pages/subset.jsf";
        %>
        <%@ include file="/pages/templates/header.jsp"%>
        <div class="center-page">
            <%@ include file="/pages/templates/sub-header.jsp"%>
            <!-- Main box -->
            <div id="main-area">
               <%@ include file="/pages/templates/content-header-no-searchbox.jsp"%>
               <!-- Page content -->
               <div class="pagecontent">
                  <a name="evs-content" id="evs-content"></a>
                  <table border="0" width="700px">
                     <%
                     	String message = (String) request.getSession().getAttribute("message");
                 			if (message != null) {
                 			   request.getSession().removeAttribute("message");
                     %>
                           <tr>
                              <td class="textbodyred">&nbsp;<%=message%></td>
                           </tr>
                     <%
                     	}
                     %>
                     <tr>
                        <td>
                           <table border="0">
                              <tr>
                                 <td class="texttitle-blue">Cart</td>
                                 <td class="texttitle-gray">(<h:outputText value="#{CartActionBean.count}" />)</td>
                              </tr>
                           </table>
                        </td>
                        <td align="right">
                            <h:commandLink action="#{CartActionBean.selectAllInCart}"
                              styleClass="texttitle-blue-small">
                              <h:graphicImage
                                 value="../images/selectAll.gif"
                                 alt="Select All"
                                 title="Select all concepts"
                                 style="border: none" />
                           </h:commandLink>&nbsp;
                           <h:commandLink action="#{CartActionBean.unselectAllInCart}"
                              styleClass="texttitle-blue-small">
                              <h:graphicImage
                                 value="../images/clearselections.gif"
                                 alt="Unselect"
                                 title="Unselect all concepts"
                                 style="border: none" />
                           </h:commandLink>&nbsp;
                           <h:commandLink action="#{CartActionBean.removeFromCart}"
                              styleClass="texttitle-blue-small"
                              onclick="return confirmRemoveMessage();">
                              <h:graphicImage
                                 value="../images/remove.gif"
                                 alt="Remove"
                                 title="Remove concepts from the cart"
                                 style="border: none" />
                           </h:commandLink>&nbsp;
                           <h:commandLink action="#{CartActionBean.cartVersionSelectionAction}"
                              styleClass="texttitle-blue-small"
                              actionListener="#{CartActionBean.formatListener}"
                              immediate="true">
                              <h:graphicImage
                                 value="../images/exportxml.gif"
                                 alt="Export XML"
                                 title="Export cart contents in LexGrid XML format"
                                 style="border: none" />
                              <f:param name="format" value="XML" />
                           </h:commandLink>&nbsp;
                           <h:commandLink action="#{CartActionBean.cartVersionSelectionAction}"
                              styleClass="texttitle-blue-small"
                              actionListener="#{CartActionBean.formatListener}"
                              immediate="true">
                              <h:graphicImage
                                 value="../images/exportcsv.gif"
                                 alt="Export CSV"
                                 title="Generate a list of cart concepts in CSV format readable from Excel"
                                 style="border: none" />
                              <f:param name="format" value="CSV" />
                           </h:commandLink>
                        </td>
                     </tr>
                  </table>
                  <hr />
                  <table class="dataTable" summary="" cellpadding="3" cellspacing="0" border="0" width="100%">
                     <tr>
                        <th class="dataTableHeader" scope="col" align="left" width="20px">&nbsp;</th>
                        <th class="dataTableHeader" scope="col" align="left">Concept</th>
                        <th class="dataTableHeader" scope="col" align="left">Vocabulary</th>
                     </tr>
                     <c:forEach var="item" begin="0" items="#{CartActionBean.concepts}" varStatus="status">
                        <c:choose>
                           <c:when test="${status.index % 2 == 0}">
                              <tr class="dataRowDark">
                           </c:when>
                           <c:otherwise>
                              <tr class="dataRowLight">
                           </c:otherwise>
                        </c:choose>
                        <td scope="row">
                           <h:selectBooleanCheckbox id="checkboxId" binding="#{item.checkbox}" onclick="submit()" />
                        </td>
                        <td>
                           <h:outputLink value="#{item.url}">${item.name}</h:outputLink>
                           ${item.displayStatus}
                        </td>
                        <td>${item.displayCodingSchemeName}</td>
                        </tr>
                     </c:forEach>
                  </table>
                  <br />
                  <%@ include file="/pages/templates/nciFooter.jsp"%>
               </div> <!-- End of pagecontent -->
            </div> <!-- End main-area -->
            <div class="mainbox-bottom"><img src="<%=basePath%>/images/mainbox-bottom.gif" width="745" height="5" alt="Mainbox Bottom" /></div>
         </div> <!-- End center-page -->
      </h:form>
   </f:view>
</body>
</html>
