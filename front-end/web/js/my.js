/*
 * js/my.js
 * 主要包括函数 getTable（使用 ajax 根据一个参数获取查询的表的结果） 、 uq（配合 getTable 使用） 和 insert_data（根据一个参数表名来向表中插入数据）
 */
function getTable(str) {
	xmlhttp = new XMLHttpRequest();
	req="gettable.php?q="+str;
	table_html="";
	switch (str) {
	case 'wzxx':
		table_html="<p class='w3-container w3-large'>最新违章信息：</p>";
		break;
	case '1':
		cd=document.getElementById("cd").value;
		req+="&cd='"+cd+"'";
		table_html='车队编号：<input id="cd" type="text" value="0"/> <input type="button" onclick="getTable(\'1\')" value="确定"/> '+"<p class='w3-container w3-large'>该车队的司机基本信息如下:</p>";
		break;
	case '2':
		sj=document.getElementById("sj").value;
		dt1=document.getElementById("dt1").value;
		dt2=document.getElementById("dt2").value;
		req+="&sj='"+sj+"'&dt1='"+dt1+"'&dt2='"+dt2+"'";
		table_html='司机姓名：<input id="sj" type="text" value="钱智美"/> 起始日期：<input id="dt1" type="text" value="2018-01-01 00:00:00"/>结束日期：<input id="dt2" type="text" value="2018-10-01 00:00:00" /><input type="button" onclick="getTable(\'2\')" value="确定"/> '+"<p class='w3-container w3-large'>该司机在该时间段的违章信息如下：</p>"
			break;
	case '3':
		cd=document.getElementById("cd").value;
		dt1=document.getElementById("dt1").value;
		dt2=document.getElementById("dt2").value;
		req+="&cd="+cd+"&dt1='"+dt1+"'&dt2='"+dt2+"'";
		table_html='车队编号：<input id="cd" type="text" value="0" /> 起始日期：<input id="dt1" type="text" value="2018-01-01 00:00:00"/>结束日期：<input id="dt2" type="text" value="2018-10-01 00:00:00" /><input type="button" onclick="getTable(\'3\')" value="确定"/> '+"<p class='w3-container w3-large'>该车队在该时间段的违章信息如下：</p>"
	default:
		break;
	}
	xmlhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("table").innerHTML =table_html+this.responseText;

		}
	};
	xmlhttp.open("GET",req,true);
	xmlhttp.send();
}
getTable('wzxx');

//useful query
function uq(str){
	switch (str) {
		case '1':
			document.getElementById("table").innerHTML='车队编号：<input id="cd" type="text" value="0" /> <input type="button" onclick="getTable(\'1\')" value="确定"/> ';
			break;
		
		case '2':
			document.getElementById("table").innerHTML='司机姓名：<input id="sj" type="text" value="钱智美"/> 起始日期：<input id="dt1" type="text" value="2018-01-01 00:00:00"/>结束日期：<input id="dt2" type="text" value="2018-10-01 00:00:00" /><input type="button" onclick="getTable(\'2\')" value="确定"/> ';
			break;
		case '3':
			document.getElementById("table").innerHTML='车队编号：<input id="cd" type="text" value="0" /> 起始日期：<input id="dt1" type="text" value="2018-01-01 00:00:00"/>结束日期：<input id="dt2" type="text" value="2018-10-01 00:00:00" /><input type="button" onclick="getTable(\'3\')" value="确定"/> ';
			break;

		default:
			
			break;
	}
}
function insert_data(str){
	switch (str) {
		case '人员':
			document.getElementById("table").innerHTML='<p class="w3-large">请输入该人员的相关信息：</p><form class="w3-container w3-light-grey" action="insertdata.php" method="post"><br /> <label style="font-weight:bold">工号：</label> <input name="gonghao" class="w3-input" type="text"  value="233"/><br /> <label style="font-weight:bold">姓名：</label> <input name="xingming" class="w3-input" type="text" value="张三" /><br /> <label style="font-weight:bold">性别：</label> <input type="radio" name="xingbie" value="男" checked> <label>男</label> <input type="radio" name="xingbie" value="女"> <label>女</label> <br /> <br /> <label style="font-weight:bold">职位：</label> <select name="zhiwei"> <option value="司机" selected>司机</option> <option value="队长">队长</option> </select> <br />  <br /><input type="submit" class="w3-input w3-red" /><input type="hidden" name="table_name" value="renyuan" /><br /> </form>';
			break;
		case '司机':
			document.getElementById("table").innerHTML='<p class="w3-large">请输入该司机的相关信息：</p><form class="w3-container w3-light-grey" action="insertdata.php" method="post"><br /> <label style="font-weight:bold">工号：</label> <input name="gonghao" class="w3-input" type="text"  value="233"/><br /> <label style="font-weight:bold">所属的线路编号：</label> <input name="suoshuxianlu" class="w3-input" type="text" value="7" /><br /><input type="submit" class="w3-input w3-red" /><input type="hidden" name="table_name" value="siji" /><br /> </form>';
			break;
		case '车辆':
			document.getElementById("table").innerHTML='<p class="w3-large">请输入该车辆的相关信息：</p><form class="w3-container w3-light-grey" action="insertdata.php" method="post"><br /> <label style="font-weight:bold">车牌号：</label> <input name="chepaihao" class="w3-input" type="text"  value="陕A08919"/><br /> <label style="font-weight:bold">座位数：</label> <input name="zuoshu" class="w3-input" type="text" value="50" /><br /> <label style="font-weight:bold">备注信息：</label> <textarea name="beizhuxinxi" class="w3-input">新能源环保型公交车</textarea><br /> <label style="font-weight:bold">所属线路：</label> <input name="suoshuxianlu" class="w3-input" type="text" value="7" /><br /> <br />  <br /><input type="submit" class="w3-input w3-red" /><input type="hidden" name="table_name" value="cheliang" /><br /> </form>';
			break;
		case '违章':
			document.getElementById("table").innerHTML='<p class="w3-large">请输入此次违章的具体信息：</p><form class="w3-container w3-light-grey" action="insertdata.php" method="post"><br /> <label style="font-weight:bold">违章司机：</label> <input name="siji" class="w3-input" type="text"  value="233"/><br /><label style="font-weight:bold">所使用的车辆：</label> <input name="cheliang" class="w3-input" type="text"  value="陕A08919"/><br /><label style="font-weight:bold">违章类型：</label><select name="weizhangleixin"> <option value="违章停车" selected>违章停车</option> <option value="压线">压线</option> <option value="未礼让斑马线">未礼让斑马线</option><option value="闯红灯">闯红灯</option> </select> <br />  <br /> <label style="font-weight:bold">时间：</label> <input name="shijian" class="w3-input" type="text"  value="2018-09-12 13:14:55"/><br /> <label style="font-weight:bold">站点：</label> <input name="zhandian" class="w3-input" type="text" value="西安电子科技大学（南校区）" /><br />  <input type="submit" class="w3-input w3-red" /><input type="hidden" name="table_name" value="weizhang" /><br /> </form>';
			break;
		default:
			break;
	}
}
