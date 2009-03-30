<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Vector"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="gov.nih.nci.evs.browser.utils.DataUtils" %>
<%@ page import="gov.nih.nci.evs.browser.properties.PropertyFileParser" %>
<%@ page import="gov.nih.nci.evs.browser.properties.NCItBrowserProperties" %>
<%@ page import="gov.nih.nci.evs.browser.bean.DisplayItem" %>
<%@ page import="gov.nih.nci.evs.browser.bean.*" %>
<%@ page import="gov.nih.nci.evs.browser.utils.*" %>
<%@ page import="org.LexGrid.concepts.Concept" %>
<%@ page import="org.LexGrid.concepts.Presentation" %>
<%@ page import="org.LexGrid.commonTypes.Source" %>
<%@ page import="org.LexGrid.commonTypes.EntityDescription" %>
<%@ page import="org.LexGrid.commonTypes.Property" %>
<%@ page import="org.LexGrid.commonTypes.PropertyQualifier" %>
<%@ page import="org.LexGrid.concepts.Presentation" %>
<%@ page import="org.LexGrid.commonTypes.Source" %>
<%@ page import="org.LexGrid.commonTypes.EntityDescription" %>
<%@ page import="org.LexGrid.commonTypes.Property" %>
<%@ page import="org.LexGrid.commonTypes.PropertyQualifier" %>

<html>
<head>
  <title>NCI Thesaurus Browser Home</title>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/styleSheet.css" />
  <script type="text/javascript" src="<%= request.getContextPath() %>/js/script.js"></script>
  <script type="text/javascript" src="<%= request.getContextPath() %>/js/search.js"></script>
  <script type="text/javascript" src="<%= request.getContextPath() %>/js/dropdown.js"></script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
  <f:view>
    <%@ include file="/pages/templates/header.xhtml" %>
    <div class="center-page">
      <%@ include file="/pages/templates/sub-header.xhtml" %>
      <!-- Main box -->
      <div id="main-area">
        <%@ include file="/pages/templates/content-header.xhtml" %>
        <!-- Page content -->
        <div class="pagecontent">
          <%
            String dictionary = null;
            String code = null;
            String type = null;

            String singleton = (String) request.getSession().getAttribute("singleton");
            if (singleton != null && singleton.compareTo("true") == 0) {
              dictionary = (String) request.getSession().getAttribute("dictionary");
              code = (String) request.getSession().getAttribute("code");
            } else {
              dictionary = (String) request.getParameter("dictionary");
              code = (String) request.getParameter("code");
              type = (String) request.getParameter("type");
            }
            if (type == null) {
              type = "properties";
            }
            request.getSession().setAttribute("dictionary", dictionary);
            request.getSession().setAttribute("code", code);
            request.getSession().setAttribute("type", type);
            request.getSession().setAttribute("singleton", "false");
            String vers = null;
            String ltag = null;
            Concept c = DataUtils.getConceptByCode(dictionary, vers, ltag, code);
            request.getSession().setAttribute("concept", c);
            String name = c.getEntityDescription().getContent();
          %>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td class="texttitle-blue">
                <b><%=name%> (Code <%=code%>)</b>
              </td>
            </tr>
            <tr><td><hr></td></tr>
            <tr>
              <td height="1%" class="textbody">
                <%@ include file="/pages/templates/typeLinks.xhtml" %>
              </td>
            </tr>
            <tr>
              <td class="textbody">
                <%@ include file="/pages/templates/property.xhtml" %>
              </td>
            </tr>
            <tr>
              <td class="textbody">
                <%@ include file="/pages/templates/relationship.xhtml" %>
              </td>
            </tr>
            <tr>
              <td class="textbody">
                <%@ include file="/pages/templates/synonym.xhtml" %>
              </td>
            </tr>
          </table>
          <%@ include file="/pages/templates/nciFooter.html" %>
        </div>
        <!-- end Page content -->
      </div>
      <div class="mainbox-bottom"><img src="images/mainbox-bottom.gif" width="745" height="5" alt="" /></div>
      <!-- end Main box -->
    </div>
  </f:view>
</body>
</html>