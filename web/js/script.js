function alert() {} 


function redirect_site() {

	var url = document.forms["form_link"].quicklink.value;
	//if (url.length > 1) window.location = url;
	window.open (url, "", "alwaysRaised,dependent,status,scrollbars,resizable,width=800,height=600");  
}

function changeMenuStyle(obj, new_style) { 
  obj.className = new_style; 
}

function showCursor(){
	document.body.style.cursor='hand'
}

function hideCursor(){
	document.body.style.cursor='default'
}

function confirmDelete(){
  if (confirm('Are you sure you want to delete?')){
    return true;
    }else{
    return false;
  }
}


function validate_form()
{
    valid = true;
    if ( document.form[0].label.value.length == 0 )
    {
        alert ( "Please specify a label." );
        return false;
    }
    if ( document.form[0].rootConceptCode.length == 0 )
    {
        alert ( "Please specify a root concept code." );
        return false;
    }    
    return valid;
}




function openUserGuideWindow(pageURL) {
    window.open (pageURL, "User Guide", "alwaysRaised,dependent,status,scrollbars,resizable,width=800,height=500"); 
    
}

function openFeatureRequestWindow() {
    var agt			= navigator.userAgent.toLowerCase();
    var is_major  	= parseInt(navigator.appVersion);
    var is_ie     	= ((agt.indexOf("msie") != -1) && (agt.indexOf("opera") == -1));
    var is_ie4up  	= (is_ie && (is_major >= 4));

	if (is_ie4up)
	{
	    window.open ('https://gforge.nci.nih.gov/tracker/?atid=2087&group_id=90&func=browse', '_blank', 'alwaysRaised,dependent,status,scrollbars,resizable,width=800,height=600');  
	}
	else
	{
	    window.open ('https://gforge.nci.nih.gov/tracker/?atid=2087&group_id=90&func=browse', 'New Term Request', 'alwaysRaised,dependent,status,scrollbars,resizable,width=800,height=600');  
	}
}

function openNewTermRequestWindow() {
    var agt			= navigator.userAgent.toLowerCase();
    var is_major  	= parseInt(navigator.appVersion);
    var is_ie     	= ((agt.indexOf("msie") != -1) && (agt.indexOf("opera") == -1));
    var is_ie4up  	= (is_ie && (is_major >= 4));

	if (is_ie4up)
	{
//	    window.open ('http://gforge.nci.nih.gov/tracker/?atid=1849&group_id=129&func=browse', '_blank', 'alwaysRaised,dependent,status,scrollbars,resizable,width=800,height=600');  
	    window.open ('http://ncimeta.nci.nih.gov/MetaServlet/FormalizationFailedServlet','_blank', 'alwaysRaised,dependent,status,scrollbars,resizable,width=800,height=600');
	    }
	else
	{
//	    window.open ('http://gforge.nci.nih.gov/tracker/?atid=1849&group_id=129&func=browse', 'New Term Request', 'alwaysRaised,dependent,status,scrollbars,resizable,width=800,height=600');  
	    window.open ('http://ncimeta.nci.nih.gov/MetaServlet/FormalizationFailedServlet', 'New Term Request', 'alwaysRaised,dependent,status,scrollbars,resizable,width=800,height=600');
	}
}

function openHelpWindow(pageURL) {
    window.open (pageURL,"Help", "alwaysRaised,dependent,status,scrollbars,resizable,width=800,height=500");    
}

function openToolWindow() {
    window.open ("http://gforge.nci.nih.gov/", "New Term Request", "alwaysRaised,dependent,status,scrollbars,resizable,width=800,height=500");  
}

function openToolWindow2() {
    window.open ('http://gforge.nci.nih.gov/tracker/?func=add&group_id=129&atid=1656', "New Term Request", "alwaysRaised,dependent,status,scrollbars,resizable,width=800,height=500");  
}

//function openNewTermRequestWindow() {
//    window.open ('http://gforge.nci.nih.gov/tracker/?atid=1849&group_id=129&func=browse', 'New Term Request', 'alwaysRaised,dependent,status,scrollbars,resizable,width=800,height=600');  
//}

function changeMenuStyle(obj, new_style) { 
  obj.className = new_style; 
}

function showCursor(){
	document.body.style.cursor='hand'
}

function hideCursor(){
	document.body.style.cursor='default'
}

function confirmDelete(){
  if (confirm('Are you sure you want to delete?')){
    return true;
    }else{
    return false;
  }
}

function setDispatch(dispatchValue){
  document.forms[0].dispatch.value = dispatchValue;
  document.forms[0].submit();
}

function goto(locationStr){
  location.href = locationStr;
}

//Following deal with hiding the Advanced Search Menus
function ChangeClass(menu, newClass) { 
	 if (document.getElementById) { 
	 	document.getElementById(menu).className = newClass;
	 } 
} 

var remote = null;
function rs(n,u,w,h) {
	remote = window.open(u, n, 'width=' + w + ',height=' + h +',resizable=yes,scrollbars=yes');
	if (remote != null) {
	if (remote.opener == null)
	remote.opener = self;
	window.name = 'placeComment';
	remote.location.href = u;}
	remote.focus();
}

var persistmenu="yes" //"yes" or "no". Make sure each SPAN content contains an incrementing ID starting at 1 (id="sub1", id="sub2", etc)
var persisttype="sitewide" //enter "sitewide" for menu to persist across site, "local" for this page only

if (document.getElementById){ //DynamicDrive.com change
	document.write('<style type="text/css">\n')
	document.write('.submasterdiv{display: none;}\n')
	document.write('</style>\n')
}

function SwitchMenu(obj){
	if(document.getElementById){
		var el = document.getElementById(obj);
		var ar = document.getElementById("masterdiv").getElementsByTagName("span"); //DynamicDrive.com change
		//Doesn't check and close other open spans
		
		//document.getElementById("search").value = "advancedSearch";

		for (var i = 0; i < ar.length; i++){
			if (ar[i].style.display=="block") //DynamicDrive.com change
			ar[i].style.display = "none";
		}
		
		if(el.style.display != "block"){ //DynamicDrive.com change
			el.style.display = "block";
		}else{
			el.style.display = "block";
		}
	}
}

function get_cookie(Name) { 
	var search = Name + "="
	var returnvalue = "";
	if (document.cookie.length > 0) {
		offset = document.cookie.indexOf(search)
		if (offset != -1) { 
			offset += search.length
			end = document.cookie.indexOf(";", offset);
			if (end == -1) end = document.cookie.length;
			returnvalue=unescape(document.cookie.substring(offset, end))
		}
	}
	return returnvalue;
}

function onloadfunction(){
	if (persistmenu=="yes"){
		var cookiename=(persisttype=="sitewide")? "switchmenu" : window.location.pathname
		var cookievalue=get_cookie(cookiename)
		if (cookievalue!="")
		document.getElementById(cookievalue).style.display="block"
	}
}

function savemenustate(){
	var inc=1, blockid=""
	while (document.getElementById("sub"+inc)){
		if (document.getElementById("sub"+inc).style.display=="block"){
			blockid="sub"+inc
			break
		}
		inc++
	}
	var cookiename=(persisttype=="sitewide")? "switchmenu" : window.location.pathname
	var cookievalue=(persisttype=="sitewide")? blockid+";path=/" : blockid
	document.cookie=cookiename+"="+cookievalue
}

if (window.addEventListener)
	window.addEventListener("load", onloadfunction, false)
else if (window.attachEvent)
	window.attachEvent("onload", onloadfunction)
else if (document.getElementById)
	window.onload=onloadfunction

if (persistmenu=="yes" && document.getElementById)
	window.onunload=savemenustate
