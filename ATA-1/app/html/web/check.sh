# busybox may slow on [ ]
empty() {
	case "${1}" in
		"") return 0 ;;
		*) return 255 ;;
	esac
}
equal() {
	case "${1}" in
		"${2}") return 0 ;;
		*) return 255 ;;
	esac
}
neq() {
	case "${1}" in
		"${2}") return 255 ;;
		*) return 0 ;;
	esac
}
check_timestamp() {
	_checkpoint=$((${1} + 600)) 
	_now="`date +%s`"
	[ ${_now} -gt ${_checkpoint} ] || return 255
	return 0
}
check_user() {
    if neq ${1} "config2" && neq "`nvram get session_user`" "admin"; then
		return 0
	fi
	return 255
}
get_system_status() {
    WAN=`nvram get wan_device`
    nvram set :121="`ifconfig ${WAN} 2>/dev/null|grep \"inet addr\"|cut -d \" \" -f12|cut -d \":\" -f2`"
    nvram set :199="`uptime|cut -d ',' -f1`"
}
check_lang() {
	if neq $(nvram get 342) $(nvram get 342a); then
		/app/bin/lang
	fi	
}

header() {
cat <<EOF
HTTP/1.1 200 OK
Content-Type: text/html; charset=utf-8
Server: Grandstream/1.10


EOF
}

header_binary() {
filename="config.txt"
if [ "x${1}" != "x" ] ; then
    filename="${1}"
fi    
cat <<EOF
HTTP/1.1 200 OK
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="${filename}"
Server: Grandstream/1.10

EOF
}

header_text() {
cat <<EOF
Content-Type: text/html; charset=utf-8
Pragma: no-cache


EOF
}

header_with_cookie() {
cat <<EOF
HTTP/1.0 200 OK
Content-Type: text/html; charset=utf-8
Server: Grandstream/1.10
Pragma: no-cache
Cache-Control: no-cache
Connection: close
Set-Cookie: session_id=${SESSIONID};


EOF
}

print_error_page(){
cat << EOF
<html>
<head>
<title>Grandstream Device Configuration</title>
<style type="text/css">
<!--
.l{  font-family: Tahoma; font-size: 10pt; color: #000000; }
a.l:Hover{  font-family: Tahoma; font-size: 10pt; color: #ffffff; }
-->
</style></head><body bgcolor="#CCCCCC">
<table width="870" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#336699">
<tr><td valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr><td height="48" valign="middle" bgcolor="#F3C47C" class="l" align="center"><strong><font color="#336699" size="3"><b>Grandstream Device Configuration</b></font></strong></td>
</tr><tr><td height="20" valign="top" background="/backline.gif" bgcolor="#F3C47C" align="center"> 
<table width="70%" cellpadding="0" cellspacing="0">
<tr><td bgcolor="#999999" align="center"><a href="index" class="l"><b>STATUS</b></a></td>
<td bgcolor="#999999" align="center"><a href="config2" class="l"><b>BASIC SETTINGS</b></a></td>
<td bgcolor="#999999" align="center"><a href="config" class="l"><b>ADVANCED SETTINGS</b></a></td>
</tr></table></td></tr>
        <tr bgcolor="#FFFFCC"> 
          <td> <table width=100% border=0 cellspacing=1 cellpadding=2>
              <tr> 
                <td> <table width=500 border=0 cellspacing=5 cellpadding=0 align=center bgcolor="ffffcc">
                    <tr bordercolor="ffffff" bgcolor="ffffff"> 
                      <td align=center bgcolor="ffffcc" height=69> <br> <br>
                        An error has occurred.<br>
                        <br> <br> </td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr height=28 bgcolor="#F3C47C" align=center> 
                <td colspan=2> 
                  <input type="button" name="reboot" value="Reboot" onClick="document.location='rs'"> 
                  <input name="gnkey" type=hidden value=0b82> </td>
              </tr>
            </table></td>
        </tr>
<tr><td bgcolor="#336699" align="center" class="l"><font size="1">All Rights Reserved Grandstream Networks, Inc. 2006-2008</font></td></tr>
</table></td></tr>
</table>
</body></html>
EOF
}

print_error_page_without_links(){
cat << EOF
<html>
<head>
<title>Grandstream Device Configuration</title>
<style type="text/css">
<!--
.l{  font-family: Tahoma; font-size: 10pt; color: #000000; }
a.l:Hover{  font-family: Tahoma; font-size: 10pt; color: #ffffff; }
-->
</style></head><body bgcolor="#CCCCCC">
<table width="870" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#336699">
<tr><td valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr><td height="48" valign="middle" bgcolor="#F3C47C" class="l" align="center"><strong><font color="#336699" size="3"><b>Grandstream Device Configuration</b></font></strong></td>
</tr><tr><td height="20" valign="top" background="/backline.gif" bgcolor="#F3C47C" align="center">
        <tr bgcolor="#FFFFCC">
          <td> <table width=100% border=0 cellspacing=1 cellpadding=2>
              <tr>
                <td> <table width=500 border=0 cellspacing=5 cellpadding=0 align=center bgcolor="ffffcc">
                    <tr bordercolor="ffffff" bgcolor="ffffff">
                      <td align=center bgcolor="ffffcc" height=69> <br> <br>
                        An error has occurred.<br>
                        <br> <br> </td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
<tr><td bgcolor="#336699" align="center" class="l"><font size="1">All Rights Reserved Grandstream Networks, Inc. 2006-2008</font></td></tr>
</table></td></tr>
</table>
</body></html>
EOF
}

nvparse_html_check(){
PS=`nvparse ${1}` 2> /dev/null
echo ${PS} | grep '/html' > /dev/null
if [ $? -eq 0 ] ; then
	echo ${PS}
else
	${2}
fi 
}

nvparse1_html_check(){
PS=`nvparse1 ${1}` 2> /dev/null
echo ${PS} | grep '/html' > /dev/null
if [ $? -eq 0 ] ; then
	echo ${PS}
else
	${2}
fi 
}
