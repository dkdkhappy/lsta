<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --%>
<%-- @(#)user.jsp 1.0 2014/08/12                                            --%>
<%--                                                                        --%>
<%-- COPYRIGHT (C) 2011 C-NODE, INC.                                        --%>
<%-- ALL RIGHTS RESERVED.                                                   --%>
<%-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --%>


<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --%>
<%-- Dealer Information Sheet 화면이다.                                        	--%>
<%--                                                                        --%>
<%-- @author C-NODE                                                         --%>
<%-- @version 1.0 2022/07/12                                                --%>
<%-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<!-- JAVASCRIPT AND STYLE INCLUDE -->
<%@ include file="/WEB-INF/views/include/common.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/styleAdd.css" />" />
<!-- BUSINESS JAVASCRIPT -->
<script type="text/javascript">
	/*  doInit({
		domain: '<spring:eval expression="@app['domain.user']"/>'
	}); */
</script>
<script type="text/javascript" src="<c:url value="/resources/js/dealer/dealerapplicationf01.js?v=1129A" />"></script>
<script>
//따라다니는 장바구니
function scroll_follow( id ){
$(window).scroll(function( ){  //스크롤이 움직일때마다 이벤트 발생 
   var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
       //console.log("<BBUG.CHK=====================================" + position);
       if (position == 0) {
       position += 150;
       } else if (position < 50) {
       position += 100;
       } else if (position <= 100) {
           position += 50;
       } else {
       position += 30;
       }
       $( id ).stop().animate({top:position+"px"}, 1); //해당 오브젝트 위치값 재설정
    });
 }
 
/* function scroll_follow( id ){
	$(window).scroll(function( ){  //스크롤이 움직일때마다 이벤트 발생 
       var position = $(window).scrollTop()+150; // 현재 스크롤바의 위치값을 반환합니다.
       //console.log(position+150);
       $( id ).stop().animate({top:position+"px"}, 1); //해당 오브젝트 위치값 재설정
    });
 } */
 
</script>
<style>
#account-layout{min-width:1200px !important;}
/* .l-btn-text { width: 70px;} */

::-webkit-scrollbar{width: 15px!important;}
::-webkit-scrollbar-track {background-color:#f1f1f1!important;}
::-webkit-scrollbar-thumb {background-color:#e0e0e0;border-radius: 10px!important;}

input { border: 1px solid #4F81BD; padding-right: 10px;}
.div-line-new-sub{ border-bottom: 0px; box-shadow: 0 0px 0px rgba(0,0,0,0.0);}
.panel{ box-shadow: 0 0px 0px rgba(0,0,0,0); }
.popup-search-table th,td{ padding: 2px; }

span.textbox.combo {
	height: 27px !important;
}

#save-button .l-btn-text{ width: 120px; }
.search-label-h {
    width: 7%;
    min-width: 100px;
}

#cart_body_option{
    padding: 0px;
    height: 94%;
}
#cart_body_option tr td{
    width: 100px; 
    text-align:center
}

#cart_body_option2 .newDealInput {border-bottom:none !important;}
#cart_body_option2 .combo {border-bottom:none !important;}
.td-width tr td{
	width: 0%;
} 
.tableSearch-c {
    margin-top: -4px;
    margin-bottom: 1px;
}
.tbl_100 {width: 100%; margin-bottom: 10px;}
.subTitTop {margin-top: 30px;}
.subTit {
	padding-top: 5px;
	padding-bottom: 5px;
	padding-left : 10px;
	color: #004a8d;
	font-size: 15px;
	font-weight: bold;
	background: #f2f2f2;
	border-top: 2px solid #4472c4;
	border-bottom: 1px solid #7396d3;
}
.subTit2 {
	padding-top: 5px;
	padding-bottom: 5px;
	padding-left : 10px;
	color: #004a8d;
	font-size: 15px;
	font-weight: bold;
	background: #f2f2f2;
	border-top: 1px solid #4472c4;
	border-bottom: 1px solid #7396d3;
}
.subTitIcon {font-size:17px;}
.subTitAccn {
	float: right;
	padding-top: 3px;
	padding-right: 10px;
    width: 30px;
    cursor: pointer;
}
/*.combo-arrow {background: none;}*/
.combo {
	border: none;
    border-bottom: 1px solid black;
    border-radius: 0px;
    box-shadow: none;
}
#working-popup{
	width: 100%;
	height: 100%;
	position: fixed;
	background: rgba(0,0,0,0.1);
	z-index: 9050;
	top: 0px;
}
#working-popup img {position: absolute;top: 40%;margin-left: -35px;margin-top: -75px;}
:focus-visible {outline: none;}

/*  select box 글자 가운데 정렬 */
.textbox.easyui-fluid.combo input {
	text-align: center !important;
	height: 27px !important;
	font-size: 16px;
	font-weight: bold;
	font-family: ankecallig-fg;
}
.textbox.combo input {
	text-align: center !important;
	height: 27px !important;
	font-size: 16px;
	font-weight: bold;
	font-family: ankecallig-fg;
}

/* style 추가 : 2022-10-20 양윤지 */
#cart_body_option > #cart_body_option {
	padding: 0 !important;
}

.f01Tbl .newDealInput {
    border-bottom: none !important;
}

</style>
</head>

<!-- BODY 상단 INCLUDE -->
<%@ include file="/WEB-INF/views/include/body.head.jsp" %>
<%@ include file="/WEB-INF/views/include/topnav.jsp" %>

<!-- 화면 첫 로딩시 필요한 ProgressBar -->
<div id="loadingProgressBar">
    <br></br>
    <center><img src="<%=request.getContextPath() %>/resources/images/ajax_loader_red_48.gif"></img></center>
</div>

<!-- [LAYOUT] start -->
<div class="easyui-layout" data-options="fit:true" id="account-layout" style="display:none;">
	<div id="working-popup" style="display:none;">
	    <br></br>
	    <center><img src="<%=request.getContextPath() %>/resources/images/ajax_loader_red_48.gif"/></center>
	</div>
	<form id="regist-form">
		<input type="hidden" name="oper"       id="r_oper"     value="${model.oper}"    />
        <input type="hidden" name="sysId"      id="r_sysId"    value="${model.sysId}"   />
        <input type="hidden" name="bordNo"     id="r_bordNo"   value="${model.bordNo}"  />
        <input type="hidden" name="bordGrup"   id="r_bordGrup" value="${model.bordGrup}"/>
        <input type="hidden" name="bordType"   id="r_bordType" value="${model.bordType}"/>
        <input type="hidden" name="bordBgn"    id="r_bordBgn"  value="${model.bordBgn}"/>
        <input type="hidden" name="bordEnd"    id="r_bordEnd"  value="9999-12-31"/>
        <input type="hidden" name="tempId"     id="r_tempId"   value="${model.tempId}"/>
        <input type="hidden" name="applId"     id="r_applId"   value="F01"/>
        <input type="hidden" name="docStat"    id="r_docStat"  value=""/>
        <input type="hidden" name="applType"   id="r_applType" value=""/>
        <input type="hidden" name="applStat"   id="r_applStat" value=""/>
        <input type="hidden" name="gsUserType" id="gsUserType" value="${gsUserType}" />
        <input type="hidden" name="gsSpcAuthCode" id="gsSpcAuthCode" value="${gsSpcAuthCode}" />
		<div style="width:1565px; margin-left: 155px;">
			<div id="search-toolbar" class="wui-toolbar" style="width: 70%;margin-left: 15%;">
					<div class="div-new"  style="text-align: center;">
				        <table cellpadding="5" class="search-table tableSearch-c wp-70" style="min-width: 1200px;">
							<tr><span class="subTitIcon" style="font-weight: bold; font-size: 20px; color: #0070c0;">Dealer Information Sheet</span>
			        	</table>
				   </div>
				   <div class="div-new"  style="text-align: right; margin-top: -15px;">
				        <table cellpadding="5" class="search-table tableSearch-c wp-70" style="min-width: 1200px;">
							Status - <span id="docStat">Ready</span>
			        	</table>
				   </div>
				   <div class="div-new"  style="text-align: right;">
				        <table cellpadding="5" class="search-table tableSearch-c wp-70" style="min-width: 1200px;">
							Last Updated by <span id="lastChngUser"></span>
			        	</table>
				   </div>
				   <div class="div-new"  style="text-align: right;">
				        <table cellpadding="5" class="search-table tableSearch-c wp-70" style="min-width: 1200px;">
							Last Updated Time : <span id="lastChngTime"></span>
			        	</table>
				   </div>
			</div>
		<div class="wp-70" id="detail_contents" style="margin-bottom: 10px; margin: auto;">
			<table class="tbl_100" style="margin-top: 5px;">
				<tr>
					<th class="subTit2" id="subTitAccn1" onClick="doAccordian(this.id)" >
						<span class="subTitIcon"><i class="fa fa-th-large fa-xs g-mr-5 tabColor" aria-hidden="true"></i>Business Information</span> 
						<img src="/lsdp/resources/jquery/easyui-1.4/themes/ui-pepper-grinder/images/datagrid_icons_close.png" class="subTitAccn" id="subTitAccn1_icon"/>
					</th>
				</tr>
			</table>
			<div id="subAccn1" style="padding-left: 27px; white-space: nowrap;">
			<table class="tbl_100">
				<tr>
					<td id="bold" style="width:11%;">
						<span data-item="LAB_007" class="fontChange2">Dealership Trade Name or DBA</span>
						<input type="easyui-textbox" class="newDealInput newDealInputL30" style="width:78%;" name="DealDba" id="DealDba" value="" required placeholder=""/>
					</td>
				</tr>
			</table>
			<table class="tbl_100">
				<tr>
					<td id="light" style="width:5%;">
						<span data-item="LAB_007"  class="fontChange">Principal Owner</span>
					</td>
					<td style="width:89%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputL30" style="width:100%;" name="PrclOwnr" id="PrclOwnr" value="" required  placeholder=""/>
					</td>
				</tr>
			</table>
			<table class="tbl_100">
				<tr>
					<td id="bold" style="width:11%;">
						<span data-item="LAB_007" class="fontChange2">Business Location Address</span>
					</td>
					<td style="width:89%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputL30" style="width:100%;" name="BLaddr" id="BLaddr" value="" required  placeholder=""/>
					</td>
				</tr>
			</table>
			<table class="tbl_100">
				<tr>
					<td id="light" style="width:0%;">
						<span data-item="LAB_007" class="fontChange">City : </span>
					</td>
					<td style="width:20%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="bizCity" id="bizCity" value="" required  placeholder=""/>
					</td>
					<td id="light" style="width:0%;">
						<span data-item="LAB_007" class="fontChange">State : </span>
					</td>
					<td style="width:20%;" id="bold">
						<select class="easyui-combobox" id="bizStat" style="width:100%;">
							<option value=""></option>
							<c:forEach var="item" items="${getApplCnty}">
									<option value="${item.CODE_NAME}">${item.CODE_NAME}</option>
							</c:forEach>
						</select>
					</td>
					<td id="light" style="width:0%;">
						<span data-item="LAB_007" class="fontChange">Zip : </span>
					</td>
					<td style="width:20%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="bizZip" id="bizZip" value="" required  placeholder=""/>
					</td>
					<td id="light" style="width:0%;">
						<span data-item="LAB_007" class="fontChange">County : </span>
					</td>
					<td style="width:20%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="bizCoty" id="bizCoty" value="" required  placeholder=""/>
					</td>
				</tr>
			</table>
			<table class="tbl_100">
				<tr>
					<td id="light" style="width:0%;">
						<span data-item="LAB_007" class="fontChange">Tel#</span>
					</td>
					<td style="width:1%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="bizTel" id="bizTel" value="" required  placeholder=""/>
					</td>
					<td id="light" style="width:0%;">
						<span data-item="LAB_007" class="fontChange">Fax</span>
					</td>
					<td style="width:1%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="bizFax" id="bizFax" value="" required  placeholder=""/>
					</td>
				</tr>
			</table>
			<table class="tbl_100">
				<tr>
					<td id="bold" style="width:0%;">
						<span data-item="LAB_007" class="fontChange2">Mailing Address</span>
					</td>
					<td style="width:1%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputL30" style="width:100%;" name="Mailaddr" id="Mailaddr" value="" required  placeholder=""/>
					</td>
				</tr>
			</table>
			<table class="tbl_100">
				<tr>
					<td id="light" style="width:1%;">
						<span data-item="LAB_007" class="fontChange">City : </span>
					</td>
					<td style="width:30%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="MailCity" id="MailCity" value="" required  placeholder=""/>
					</td>
					<td id="light" style="width:1%;">
						<span data-item="LAB_007" class="fontChange">State : </span>
					</td>
					<td style="width:30%;">
						<select class="easyui-combobox" id="MailStat" style="width:100%;">
							<option value=""></option>
								<c:forEach var="item" items="${getApplCnty}">
									<option value="${item.CODE_NAME}">${item.CODE_NAME}</option>
							</c:forEach>
						</select>
					</td>
					<td id="light" style="width:1%;">
						<span data-item="LAB_007" class="fontChange">Zip : </span>
					</td>
					<td style="width:30%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="MailZip" id="MailZip" value="" required  placeholder=""/>
					</td>
				</tr>
			</table>
			<table class="tbl_100">
				<tr>
					<td id="light" style="width:1%;">
						<span data-item="LAB_007" class="fontChange">Website</span>
					</td>
					<td style="width:40%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputL30" style="width:100%;" name="Website" id="Website" value="" required  placeholder=""/>
					</td>
					<td id="light" style="width:1%;">
						<span data-item="LAB_007" class="fontChange">Email</span>
					</td>
					<td style="width:40%;" id="bold"> 
						<input type="easyui-textbox" class="newDealInput newDealInputL30" style="width:100%;" name="Email" id="Email" value="" required  placeholder=""/>
					</td>
				</tr>
			</table>
			<table class="tbl_100">
				<tr id="light">
					<td style="width:1%;">
					<span data-item="LAB_007"  class="fontChange">Ownership Type:</span>
					<input type="hidden" id="OwnrShip" name="OwnrShip"/>
					<input onclick="fnChangeOwnrShip(this)" style="display: inline-block; width: 15px; margin-left: 10%;" type="checkbox" name="OwnrType" id="PO" value="PO"/>
					<label for="PO" class="fontChange">Proprietorship</label>
					<input onclick="fnChangeOwnrShip(this)" style="display: inline-block; width: 15px; margin-left: 10%;" type="checkbox" name="OwnrType" id="PA" value="PA"/>
					<label for="PA" class="fontChange">Partnership</label>
					<input onclick="fnChangeOwnrShip(this)" style="display: inline-block; width: 15px; margin-left: 10%;" type="checkbox" name="OwnrType" id="IN" value="IN"/>
					<label for="IN" class="fontChange">Incorporation</label>
					<input onclick="fnChangeOwnrShip(this)" style="display: inline-block; width: 15px; margin-left: 10%;" type="checkbox" name="OwnrType" id="Etc" value="Etc"/>
					<label for="Etc" class="fontChange">Etc</label>
					</td>
				</tr>
			</table>
			<table class="tbl_100">
				<tr>
					<td id="light" style="width:1%;">
						<span data-item="LAB_007"  class="fontChange">Parts Manager/Personnel</span>
					</td>
					<td style="width:30%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputL30" style="width:100%;" name="PartMang" id="PartMang" value="" required  placeholder=""/>
					</td>
					<td id="light" style="width:1%;">
						<span data-item="LAB_007" class="fontChange">Tel#</span>
					</td>
					<td style="width:30%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="PartTel" id="PartTel" value="" required  placeholder=""/>
					</td>
					<td id="light" style="width:1%;">
						<span data-item="LAB_007" class="fontChange">Email</span>
					</td>
					<td style="width:30%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="PartMail" id="PartMail" value="" required  placeholder=""/>
					</td>
				</tr>
			</table>
			<table class="tbl_100">
				<tr>
					<td id="light" style="width:1%;">
						<span data-item="LAB_007" class="fontChange">Service Manager/Personnel</span>
					</td>
					<td style="width:28.8%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputL30" style="width:100%;" name="SvcMang" id="SvcMang" value="" required  placeholder=""/>
					</td>
					<td id="light" style="width:1%;">
						<span data-item="LAB_007" class="fontChange">Tel#</span>
					</td>
					<td style="width:30%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="SvcTel" id="SvcTel" value="" required  placeholder=""/>
					</td>
					<td id="light" style="width:1%;">
						<span data-item="LAB_007" class="fontChange">Email</span>
					</td>
					<td style="width:30%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="SvcMail" id="SvcMail" value="" required  placeholder=""/>
					</td>
				</tr>
			</table>
			<table class="tbl_100">
				<tr>
					<td id="bold" style="width:40%;">
					    <span>▣</span>
						<span data-item="LAB_007" class="fontChange2">Delivery Address: (If the delivery address is different from the above business location address)</span>
					</td>
				</tr>
				<tr>
					<td style="width:40%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputL30" style="width:100%;" name="Deladdr" id="Deladdr" value="" required  placeholder=""/>
					</td>
				</tr>
			</table>
			<table class="tbl_100">
				<tr>
					<td id="light" style="width:1%;">
						<span data-item="LAB_007" class="fontChange">City : </span>
					</td>
					<td style="width:30%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="DelCity" id="DelCity" value="" required  placeholder=""/>
					</td>
					<td id="light" style="width:1%;">
						<span data-item="LAB_007" class="fontChange">State : </span>
					</td>
					<td style="width:30%;">
						<select class="easyui-combobox" id="DelStat" style="width:100%;">
							<option value=""></option>
								<c:forEach var="item" items="${getApplCnty}">
									<option value="${item.CODE_NAME}">${item.CODE_NAME}</option>
								</c:forEach>
						</select>
					</td>
					<td id="light" style="width:1%;">
						<span data-item="LAB_007" class="fontChange">Zip : </span>
					</td>
					<td style="width:30%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="DelZip" id="DelZip" value="" required  placeholder=""/>
					</td>
				</tr>
			</table>
			<table class="tbl_100">
				<tr>
					<td id="bold" style="width:40%;">
					<span>▣</span>
					<span data-item="LAB_007" class="fontChange2">Hours of operation</span>
					</td>
				</tr>
			</table>
			<table class="tbl_100">
				<tr>
					<td id="light" style="width:1%;">
						<span data-item="LAB_007" class="fontChange">Weekday : </span>
					</td>
					<td style="width:40%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="WeekHour" id="WeekHour" value="" required  placeholder=""/>
					</td>
					<td id="light" style="width:1%;">
						<span data-item="LAB_007" class="fontChange">Saturday : </span>
					</td>
					<td style="width:40%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="SatuHour" id="SatuHour" value="" required  placeholder=""/>
					</td>
					<td id="light" style="width:1%;">
						<span data-item="LAB_007" class="fontChange">Sunday : </span>
					</td>
					<td style="width:40%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="SunHour" id="SunHour" value="" required  placeholder=""/>
					</td>
				</tr>
			</table>
			<table class="tbl_100">
				<tr>
					<td id="bold" style="width:1%;">
					<span>▣</span>
					<span data-item="LAB_007" class="fontChange2">Loading Dock : </span>
					<input type="hidden" id="Chankey" name="Chankey" value=""/>
					<label for="Y" class="fontChange2">Yes</label>
					<input onclick="fnChangeStatus(this)" style="display: inline-block; width: 15px;" type="checkbox" name="status" id="Y" value="Y"/>
					<label for="N" class="fontChange2">/ No</label>
					<input onclick="fnChangeStatus(this)" style="display: inline-block; width: 15px;" type="checkbox" name="status" id="N" value="N"/>
					</td>
				</tr>
			</table>
			<table class="tbl_100">
				<tr>
					<td id="bold" style="width:1%;">
					<span>▣</span>
					<span data-item="LAB_007" class="fontChange2">Wells Fargo : </span>
					</td>
					<td id="light" style="width:1%;">
						<span data-item="LAB_007" class="fontChange">Account No. </span>
					</td>
					<td style="width:40%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%; background: #ffff0047;" name="WfAcnt" id="WfAcnt" value="" required  placeholder=""/>
					</td>
					<td id="light" style="width:1%;">
						<span data-item="LAB_007" class="fontChange">Credit Line : </span>
					</td>
					<td style="width:40%;" id="bold">
						<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%; background: #ffff0047;" name="WfCret" id="WfCret" value="" required  placeholder=""/>
					</td>
				</tr>
			</table>
			<table style="width: 100%;">
				<tr>
					<td id="bold" style="width:100%;">
						<input type="hidden" id="wfCashOpt" name="wfCashOpt" value=""/>
						<label for="cash" class="fontChange2" style="margin-left: 1.9%;">Option for Cash</label>
						<input onclick="fnChangewfCashType(this)" style="display: inline-block; width: 15px;" type="checkbox" name="wfCashType" id="Y" value="Y"/>
						<span style="margin-left: 1%;">Or</span>
						<label for="wf" class="fontChange2" style="margin-left: 1%;">Applying Wells Fargo</label>
						<input onclick="fnChangewfCashType(this)" style="display: inline-block; width: 15px;" type="checkbox" name="wfCashType" id="N" value="N"/>
					</td>
					<!-- <td style="width:40%;" id="bold" colspan="4">
						<input type="easyui-textbox" class="newDealInput newDealInputL30" style="width:100%; background: #ffff0047;" name="WfCashOpt" id="WfCashOpt" value="" required  placeholder=""/>
					</td> -->
				</tr>
			</table>
			</div>
			<!-- appl type에 따른 출력 여부 -->
			<c:forEach var="list" items="${getApplTypeList}"> 
				<c:if test="${list.applType eq 'R'}"> 
					<table class="tbl_100 subTitTop">
						<tr>
							<th class="subTit2" id="subTitAccn2" onClick="doAccordian(this.id)" >
								<span class="subTitIcon"> <i class="fa fa-th-large fa-xs g-mr-5 tabColor" aria-hidden="true"></i>Section A. Current Business Information</span>
								<img src="/lsdp/resources/jquery/easyui-1.4/themes/ui-pepper-grinder/images/datagrid_icons_open.png" class="subTitAccn" id="subTitAccn2_icon"/>
							</th>
						</tr>
					</table>
					<div id="subAccn2" style="white-space: nowrap; display:none;">
						<div style="padding-left: 27px;">
							<div id="light">
								<table class="tbl_100">
									<tr>
										<td style="width:10%;" class="fontChange">
											Type/Nature of Current Business 
										</td>
										<td style="width:90%;" id="bold">
											<input type="easyui-textbox" class="newDealInput newDealInputL30 tbl_100" name="bizCurtType1" id="bizCurtType1" value="" required  placeholder=""/>
										</td>
									</tr>
									<tr>
										<td colspan="2" id="bold">
											<input type="easyui-textbox" class="newDealInput newDealInputL tbl_100" name="bizCurtType2" id="bizCurtType2" value="" required  placeholder=""/>
										</td>
									</tr>
								</table>
								<table class="tbl_100">
									<tr>
		<!-- 								<td style="text-align:right;padding:4px 11px 4px 4px;"> -->
		<!-- 								    <a href="javascript:void(0)" class="easyui-linkbutton c6"  id="add-button3" data-item="BTN_007"  >Add</a> -->
		<!-- 								    <a href="javascript:void(0)" class="easyui-linkbutton c6"  id="del-button3" data-item="BTN_007"  >Del</a> -->
		<!-- 								</td> -->
									</tr>
								</table>
								<!-- <table id="Equipment" class="tbl_100" style="font-weight: bold;  font-size: 16px;  margin-bottom: -1px;">
									<tr>
										<th style="width:42%;">
											<U>Equipment Brands Currently Sold</U>
										</th>
										<th style="width:32%;">
											<U>Since Year</U>
										</th>
										<th style="width:30%;">
											<U>Approx. Annual $ Sales</U>
										</th>
									</tr>
									<tr>
										<td>
										<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:88%;" name="SoldBrad" id="SoldBrad0" value=""/>
										</td>
										<td>
										<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:85%;" name="SincYear" id="SincYear0" value=""/>
										</td>
										<td>
										<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="AnalSale" id="AnalSale0" value=""/>
										</td>
									</tr>
									<tr>
										<td>
										<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:88%;" name="SoldBrad2" id="SoldBrad1" value=""/>
										</td>
										<td>
										<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:85%;" name="SincYear2" id="SincYear1" value=""/>
										</td>
										<td>
										<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="AnalSale2" id="AnalSale1" value=""/>
										</td>
									</tr>
									<tr>
										<td>
										<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:88%;" name="SoldBrad3" id="SoldBrad2" value=""/>
										</td>
										<td>
										<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:85%;" name="SincYear3" id="SincYear2" value=""/>
										</td>
										<td>
										<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="AnalSale3" id="AnalSale2" value=""/>
										</td>
									</tr>
								</table> -->
								<table id="Equipment" class="f01Tbl" border="1" style="width:100%;height:350px;text-align:center;">
									<tr style="height: 25px; vertical-align: bottom;">
								 		<td rowspan="2">
								 			<span class="fontChange2">Equipment Brands Currently Sold</span>
								 		</td>
								 	 	<td rowspan="2">
								 			<span class="fontChange2">Since Year</span>
								 		</td>
								 		<td colspan="2">
								 			<span class="fontChange2">Approx. Annual Sales</span>
								 		</td>
								 	</tr>
								 	<tr>
								 		<td>
									 		<span class="fontChange2"># of units</span>
									 	</td>
									 	<td>
									 		<span class="fontChange2">$ Sales</span>
									 	</td>
								 	</tr>
								 	<tr style="height: 50px;">
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="SoldBrad" id="SoldBrad0" value="" required  placeholder=""/>
								 		</td>
								 	 	<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="SincYear" id="SincYear0" value="" required  placeholder=""/>
								 		</td>
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="AnalUnit" id="AnalUnit0" value="" required  placeholder=""/>
								 		</td>
								 		<td>
									 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="AnalSale" id="AnalSale0" value="" required  placeholder=""/>
									 	</td>
								 	</tr>
								 	<tr style="height: 50px;">
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="SoldBrad2" id="SoldBrad1" value=""/>
								 		</td>
								 	 	<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="SincYear2" id="SincYear1" value=""/>
								 		</td>
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="AnalUnit2" id="AnalUnit1" value=""/>
								 		</td>
								 		<td>
									 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="AnalSale2" id="AnalSale1" value=""/>
									 	</td>
								 	</tr>
								 	<tr style="height: 50px;">
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="SoldBrad3" id="SoldBrad2" value=""/>
								 		</td>
								 	 	<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="SincYear3" id="SincYear2" value=""/>
								 		</td>
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="AnalUnit3" id="AnalUnit2" value=""/>
								 		</td>
								 		<td>
									 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="AnalSale3" id="AnalSale2" value=""/>
									 	</td>
								 	</tr>
								 	<tr style="height: 50px;">
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="SoldBrad4" id="SoldBrad3" value=""/>
								 		</td>
								 	 	<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="SincYear4" id="SincYear3" value=""/>
								 		</td>
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="AnalUnit4" id="AnalUnit3" value=""/>
								 		</td>
								 		<td>
									 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="AnalSale4" id="AnalSale3" value=""/>
									 	</td>
								 	</tr>
								 	<tr style="height: 50px;">
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="SoldBrad5" id="SoldBrad4" value=""/>
								 		</td>
								 	 	<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="SincYear5" id="SincYear4" value=""/>
								 		</td>
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="AnalUnit5" id="AnalUnit4" value=""/>
								 		</td>
								 		<td>
									 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="AnalSale5" id="AnalSale4" value=""/>
									 	</td>
								 	</tr>
								 	<tr style="height: 50px;">
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="SoldBrad6" id="SoldBrad5" value=""/>
								 		</td>
								 	 	<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="SincYear6" id="SincYear5" value=""/>
								 		</td>
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="AnalUnit6" id="AnalUnit5" value=""/>
								 		</td>
								 		<td>
									 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="AnalSale6" id="AnalSale5" value=""/>
									 	</td>
								 	</tr>
							    </table>
								<table class="tbl_100">
									<tr style="height:15px;">
									</tr>
								</table>
								<table class="f01Tbl" border="1" style="width:100%;height:100px;text-align:center;font-weight: bold;">
									<tr style="height: 50px; vertical-align: bottom;">
								 		<td>
								 			<span class="fontChange2">Tractor Brand 1</span>
								 		</td>
								 	 	<td>
								 			<span class="fontChange2">Tractor Brand 2</span>
								 		</td>
								 		<td>
								 			<span class="fontChange2">Tractor Brand 3</span>
								 		</td>
								 	</tr>
								 	<tr style="height: 50px;">
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="TracBrad" id="TracBrad0" value="" required  placeholder=""/>
								 		</td>
								 	 	<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="TracBrad2" id="TracBrad1" value="" required  placeholder=""/>
								 		</td>
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="TracBrad3" id="TracBrad2" value="" required  placeholder=""/>
								 		</td>
								 	</tr>
							    </table>
								<table class="tbl_100">
									<tr style="height:15px;">
									</tr>
								</table>
								<table class="f01Tbl" border="1" style="width:100%;height:100px;text-align:center;font-weight: bold;">
									<tr style="height: 50px; vertical-align: bottom;">
								 		<td>
								 			<span class="fontChange2">Implements Brand 1</span>
								 		</td>
								 	 	<td>
								 			<span class="fontChange2">Implements Brand 2</span>
								 		</td>
								 		<td>
								 			<span class="fontChange2">Implements Brand 3</span>
								 		</td>
								 	</tr>
								 	<tr style="height: 50px;">
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="ImplBrad" id="ImplBrad0" value="" required  placeholder=""/>
								 		</td>
								 	 	<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="ImplBrad2" id="ImplBrad1" value="" required  placeholder=""/>
								 		</td>
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="ImplBrad3" id="ImplBrad2" value="" required  placeholder=""/>
								 		</td>
								 	</tr>
							    </table>
								<table class="tbl_100">
									<tr style="height:15px;">
									</tr>
								</table>
								<table class="f01Tbl" border="1" style="width:100%;height:100px;text-align:center;font-weight: bold;">
									<tr style="height: 50px; vertical-align: bottom;">
								 		<td>
								 			<span class="fontChange2">Compact Construction Equip. 1</span>
								 		</td>
								 	 	<td>
								 			<span class="fontChange2">Compact Construction Equip. 2</span>
								 		</td>
								 		<td>
								 			<span class="fontChange2">Compact Construction Equip. 3</span>
								 		</td>
								 	</tr>
								 	<tr style="height: 50px;">
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="CompEqup" id="CompEqup0" value="" required  placeholder=""/>
								 		</td>
								 	 	<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="CompEqup2" id="CompEqup1" value="" required  placeholder=""/>
								 		</td>
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="CompEqup3" id="CompEqup2" value="" required  placeholder=""/>
								 		</td>
								 	</tr>
							    </table>
								<table class="tbl_100">
									<tr style="height:15px;">
									</tr>
								</table>
								<table class="f01Tbl" border="1" style="width:100%;height:100px;text-align:center;font-weight: bold;">
									<tr style="height: 50px; vertical-align: bottom;">
								 		<td>
								 			<span class="fontChange2">UTV 1</span>
								 		</td>
								 	 	<td>
								 			<span class="fontChange2">UTV 2</span>
								 		</td>
								 		<td>
								 			<span class="fontChange2">UTV 3</span>
								 		</td>
								 	</tr>
								 	<tr style="height: 50px;">
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="Utv" id="Utv0" value="" required  placeholder=""/>
								 		</td>
								 	 	<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="Utv2" id="Utv1" value="" required  placeholder=""/>
								 		</td>
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="Utv3" id="Utv2" value="" required  placeholder=""/>
								 		</td>
								 	</tr>
							    </table>
								<table class="tbl_100">
									<tr style="height:15px;">
									</tr>
								</table>
								<table class="f01Tbl" border="1" style="width:100%;height:100px;text-align:center;font-weight: bold;">
									<tr style="height: 50px; vertical-align: bottom;">
								 		<td>
								 			<span class="fontChange2">Zero Turn Mower 1</span>
								 		</td>
								 	 	<td>
								 			<span class="fontChange2">Zero Turn Mower 2</span>
								 		</td>
								 		<td>
								 			<span class="fontChange2">Zero Turn Mower 3</span>
								 		</td>
								 	</tr>
								 	<tr style="height: 50px;">
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="ZeroMowr" id="ZeroMowr0" value="" required  placeholder=""/>
								 		</td>
								 	 	<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="ZeroMowr2" id="ZeroMowr1" value="" required  placeholder=""/>
								 		</td>
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="ZeroMowr3" id="ZeroMowr2" value="" required  placeholder=""/>
								 		</td>
								 	</tr>
							    </table>
								<table class="tbl_100">
									<tr style="height:15px;">
									</tr>
								</table>
								<table class="f01Tbl" border="1" style="width:100%;height:100px;text-align:center;font-weight: bold;">
									<tr style="height: 50px; vertical-align: bottom;">
								 		<td>
								 			<span class="fontChange2">Lawn & Garden Tractor 1</span>
								 		</td>
								 	 	<td>
								 			<span class="fontChange2">Lawn & Garden Tractor 2</span>
								 		</td>
								 	</tr>
								 	<tr style="height: 50px;">
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="LawnTrac" id="LawnTrac0" value="" required  placeholder=""/>
								 		</td>
								 	 	<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="LawnTrac2" id="LawnTrac1" value="" required  placeholder=""/>
								 		</td>
								 	</tr>
							    </table>
								<table class="tbl_100">
									<tr style="height:15px;">
									</tr>
								</table>
								<table class="f01Tbl" border="1" style="width:100%;height:100px;text-align:center;font-weight: bold;">
									<tr style="height: 50px; vertical-align: bottom;">
								 		<td>
								 			<span class="fontChange2">Snow Blower 1</span>
								 		</td>
								 	 	<td>
								 			<span class="fontChange2">Snow Blower 2</span>
								 		</td>
								 		<td>
								 			<span class="fontChange2">Snow Blower 3</span>
								 		</td>
								 	</tr>
								 	<tr style="height: 50px;">
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="SnowBlow" id="SnowBlow0" value="" required  placeholder=""/>
								 		</td>
								 	 	<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="SnowBlow2" id="SnowBlow1" value="" required  placeholder=""/>
								 		</td>
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="SnowBlow3" id="SnowBlow2" value="" required  placeholder=""/>
								 		</td>
								 	</tr>
							    </table>
								<table class="tbl_100">
									<tr style="height:15px;">
									</tr>
								</table>
								<table class="tbl_100">
									<tr>
										<td id="light" style="width:1%;">
										<span data-item="LAB_007" class="fontChange">Date business came under present management/ownership :</span>
										</td>
										<td id="light" style="width:1%;">
											<span style="margin-left:45px;" data-item="LAB_007" class="fontChange">Month</span>
										</td>
										<td style="width:20%;">
											<select class="easyui-combobox" id="r_trsfDate1" style="width:242px;" data-options="prompt:'Month'">
												<option value=""></option>
												<c:forEach var="item" items="${getMonth}">
													<option value="${item.CodeCd}">${item.CodeName}</option>
												</c:forEach>
										</select>
										</td>
										<td id="light" style="width:1%;">
											<span style="margin-left: 45px;" data-item="LAB_007" class="fontChange">Year</span>
										</td>
										<td style="width:25%;">
											<select class="easyui-combobox" id="r_trsfDate2" style="width:242px;" data-options="prompt:'Year'">
												<option value=""></option>
												<c:forEach var="item" items="${getYear}">
													<option value="${item.CodeCd}">${item.CodeName}</option>
												</c:forEach>
										</select>
										</td>
									</tr>
								</table>
								<table style=" margin-bottom: 2%">
									<tr>
										<td id="light" style="width:1%;">
											<span data-item="LAB_007" class="fontChange">Prior Employment and/or business ownership.</span>
										</td>
		<!-- 								<td style="text-align:right;padding:4px 11px 4px 4px;"> -->
		<!-- 								    <a href="javascript:void(0)" class="easyui-linkbutton c6"  id="add-button2" data-item="BTN_007"  >Add</a> -->
		<!-- 								    <a href="javascript:void(0)" class="easyui-linkbutton c6"  id="del-button2" data-item="BTN_007"  >Del</a> -->
		<!-- 								</td> -->
									</tr>
								</table>
								<div id="bold">
									<div id="cart_body_option2" class="order_cart_body" style="padding: 0 0 0 10px;">
									   <table id="ownership" border="1" style="width:100%; height:200px;text-align:center;">
										  <tr style="height: 50px; vertical-align: bottom;">
									 		<td>
									 			<span class="fontChange2">Position</span>
									 		</td>
									 	 	<td>
									 			<span class="fontChange2">Firm</span>
									 		</td>
									 		<td>
									 			<span class="fontChange2">City/State</span>
									 		</td>
									 		<td>
										 		<span class="fontChange2">From/To</span>
										 	</td>
										 	<td>
										 		<span class="fontChange2">Type of<br>Business</span>
										 	</td>
									 	 </tr>
									 	  <tr>
									 		<td>
									 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="BIZ_POST1" id="BIZ_POST0" value="" required  placeholder=""/>
									 		</td>
									 	 	<td>
									 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="BIZ_FIRM1" id="BIZ_FIRM0" value="" required  placeholder=""/>
									 		</td>
									 		<td>
									 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="BIZ_CITY_STAT1" id="BIZ_CITY_STAT0" value="" required  placeholder=""/>
									 		</td>
									 		<td>
										 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="BIZ_FROM_TO1" id="BIZ_FROM_TO0" value="" required  placeholder=""/>
										 	</td>
										 	<td>
										 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="BIZ_TYPE1" id="BIZ_TYPE0" value="" required  placeholder=""/>
										 	</td>
									 	 </tr>
									 	  <tr>
									 		<td>
									 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="BIZ_POST2" id="BIZ_POST1" value=""/>
									 		</td>
									 	 	<td>
									 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="BIZ_FIRM2" id="BIZ_FIRM1" value=""/>
									 		</td>
									 		<td>
									 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="BIZ_CITY_STAT2" id="BIZ_CITY_STAT1" value=""/>
									 		</td>
									 		<td>
										 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="BIZ_FROM_TO2" id="BIZ_FROM_TO1" value=""/>
										 	</td>
										 	<td>
										 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="BIZ_TYPE2" id="BIZ_TYPE1" value=""/>
										 	</td>
									 	 </tr>
									 	 <tr>
									 		<td>
									 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="BIZ_POST3" id="BIZ_POST2" value=""/>
									 		</td>
									 	 	<td>
									 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="BIZ_FIRM3" id="BIZ_FIRM2" value=""/>
									 		</td>
									 		<td>
									 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="BIZ_CITY_STAT3" id="BIZ_CITY_STAT2" value=""/>
									 		</td>
									 		<td>
										 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="BIZ_FROM_TO3" id="BIZ_FROM_TO2" value=""/>
										 	</td>
										 	<td>
										 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="BIZ_TYPE3" id="BIZ_TYPE2" value=""/>
										 	</td>
									 	 </tr>
								       </table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<table class="tbl_100 subTitTop">
						<tr>
							<th class="subTit2" id="subTitAccn3" onClick="doAccordian(this.id)" >
								<span class="subTitIcon"><i class="fa fa-th-large fa-xs g-mr-5 tabColor" aria-hidden="true"></i> Section B/ Business Infrastructure</span>
								<img src="/lsdp/resources/jquery/easyui-1.4/themes/ui-pepper-grinder/images/datagrid_icons_open.png" class="subTitAccn" id="subTitAccn3_icon"/>
							</th>
						</tr>
					</table>
					<div id="subAccn3" style="white-space: nowrap; display:none;">
						<div style="padding-left: 27px;">
							<div id="bold">
								<table class="tbl_100">
									<tr>
										<td style="width:100%;" class="fontChange2">
											Real Estate. Please provide detail information on all real estate owned by you/ or by the business.
										</td>
		<!-- 								<td style="text-align:right;padding:4px 9px 4px 4px;"> -->
		<!-- 								    <a href="javascript:void(0)" class="easyui-linkbutton c6"  id="add-button" data-item="BTN_007"  >Add</a> -->
		<!-- 								    <a href="javascript:void(0)" class="easyui-linkbutton c6"  id="del-button" data-item="BTN_007"  >Del</a> -->
		<!-- 								</td> -->
									</tr>
								</table>
								<div id="cart_body_option2" class="order_cart_body" style="padding: 0 0 0 10px;">
								   <table  id='Estate' border="1" style="width:100%; height:200px;text-align:center;">
									   <tr style="height: 50px; vertical-align: bottom;">
								 		<td>
								 			<span class="fontChange2">Description/Size<br>& Location</span>
								 		</td>
								 	 	<td>
								 			<span class="fontChange2">Date<br>Purchased</span>
								 		</td>
								 		<td>
								 			<span class="fontChange2">Name Titled</span>
								 		</td>
								 		<td>
									 		<span class="fontChange2">Purchase<br>Cost</span>
									 	</td>
									 	<td>
									 		<span class="fontChange2">Assessed<br>Value</span>
									 	</td>
									 	<td>
									 		<span class="fontChange2">Mortgage</span>
									 	</td>
								 	 </tr>
								 	 <tr id='Estate'>
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="DESC_SIZE_LOC1" id="DESC_SIZE_LOC0" value="" required  placeholder=""/>
								 		</td>
								 	 	<td>
								 	 		<input class="easyui-datebox" name="PURC_DATE1" id="PURC_DATE0" value="" data-options="width:200, height: 26" />
								 		</td>
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="ESTA_NAME1" id="ESTA_NAME0" value="" required  placeholder=""/>
								 		</td>
								 		<td>
									 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="PURC_COST1" id="PURC_COST0" value="" required  placeholder=""/>
									 	</td>
									 	<td>
									 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="ASSE_VAL1" id="ASSE_VAL0" value="" required  placeholder=""/>
									 	</td>
									 	<td>
									 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="ESTA_MORT1" id="ESTA_MORT0" value="" required  placeholder=""/>
									 	</td>
								 	 </tr>
								 	  <tr id='Estate2'>
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="DESC_SIZE_LOC2" id="DESC_SIZE_LOC1" value=""/>
								 		</td>
								 	 	<td>
								 			<input class="easyui-datebox" name="PURC_DATE2" id="PURC_DATE1" value="" data-options="width:200, height: 26" />
								 		</td>
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="ESTA_NAME2" id="ESTA_NAME1" value=""/>
								 		</td>
								 		<td>
									 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="PURC_COST2" id="PURC_COST1" value=""/>
									 	</td>
									 	<td>
									 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="ASSE_VAL2" id="ASSE_VAL1" value=""/>
									 	</td>
									 	<td>
									 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="ESTA_MORT2" id="ESTA_MORT1" value=""/>
									 	</td>
								 	 </tr>
								 	 <tr id='Estate3'>
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="DESC_SIZE_LOC3" id="DESC_SIZE_LOC2" value=""/>
								 		</td>
								 	 	<td>
								 			<input class="easyui-datebox" name="PURC_DATE3" id="PURC_DATE2" value="" data-options="width:200, height: 26" />
								 		</td>
								 		<td>
								 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="ESTA_NAME3" id="ESTA_NAME2" value=""/>
								 		</td>
								 		<td>
									 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="PURC_COST3" id="PURC_COST2" value=""/>
									 	</td>
									 	<td>
									 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="ASSE_VAL3" id="ASSE_VAL2" value=""/>
									 	</td>
									 	<td>
									 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="ESTA_MORT3" id="ESTA_MORT2" value=""/>
									 	</td>
								 	 </tr>
		<!-- 						 	 <tr id='Estate4'> -->
		<!-- 						 		<td> -->
		<!-- 						 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="DESC_SIZE_LOC4" id="DESC_SIZE_LOC3" value=""/> -->
		<!-- 						 		</td> -->
		<!-- 						 	 	<td> -->
		<!-- 						 			<input class="easyui-datebox" name="PURC_DATE4" id="PURC_DATE3" value="" data-options="width:200, height: 26" /> -->
		<!-- 						 		</td> -->
		<!-- 						 		<td> -->
		<!-- 						 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="ESTA_NAME4" id="ESTA_NAME3" value=""/> -->
		<!-- 						 		</td> -->
		<!-- 						 		<td> -->
		<!-- 							 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="PURC_COST4" id="PURC_COST3" value=""/> -->
		<!-- 							 	</td> -->
		<!-- 							 	<td> -->
		<!-- 							 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="ASSE_VAL4" id="ASSE_VAL3" value=""/> -->
		<!-- 							 	</td> -->
		<!-- 							 	<td> -->
		<!-- 							 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="ESTA_MORT4" id="ESTA_MORT3" value=""/> -->
		<!-- 							 	</td> -->
		<!-- 						 	 </tr> -->
		<!-- 						 	 <tr id='Estate5'> -->
		<!-- 						 		<td> -->
		<!-- 						 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="DESC_SIZE_LOC5" id="DESC_SIZE_LOC4" value=""/> -->
		<!-- 						 		</td> -->
		<!-- 						 	 	<td> -->
		<!-- 						 			<input class="easyui-datebox" name="PURC_DATE5" id="PURC_DATE4" value="" data-options="width:200, height: 26" /> -->
		<!-- 						 		</td> -->
		<!-- 						 		<td> -->
		<!-- 						 			<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="ESTA_NAME5" id="ESTA_NAME4" value=""/> -->
		<!-- 						 		</td> -->
		<!-- 						 		<td> -->
		<!-- 							 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="PURC_COST5" id="PURC_COST4" value=""/> -->
		<!-- 							 	</td> -->
		<!-- 							 	<td> -->
		<!-- 							 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="ASSE_VAL5" id="ASSE_VAL4" value=""/> -->
		<!-- 							 	</td> -->
		<!-- 							 	<td> -->
		<!-- 							 		<input type="easyui-textbox" class="newDealInput newDealInputC" style="width:100%;" name="ESTA_MORT3" id="ESTA_MORT2" value=""/> -->
		<!-- 							 	</td> -->
		<!-- 						 	 </tr> -->
							       </table>
								</div>
							</div>
							<table class="tbl_100">
									<tr style="height:40px;">
									</tr>
							</table>
							<div id="bold">
								<table class="tbl_100">
									<tr>
										<td style="width:100%;" class="fontChange2">
											Information about your business property and staff.
										</td>
									</tr>
								</table>
							</div>
							<div id="light">
								<table class="tbl_100">
									<tr>
										<td style="width:35%;" class="fontChange">
										Showroom Area
										</td>
										<td style="width:30%;" class="fontChange">
									    Covered
										<td style="text-align: right;" colspan ="2">
											<input type="hidden" id="Showroom" name="Showroom" value=""/>
											<label class="fontChange">Yes</label>
											<input onclick="fnChangeShowroomChk(this)" style="display: inline-block; width: 15px;" type="checkbox" name="Srchk" id="Srchk" value="Y"/>
											<label class="fontChange">No</label>
											<input onclick="fnChangeShowroomChk(this)" style="display: inline-block; width: 15px;" type="checkbox" name="Srchk" id="Srchk" value="N"/>
											<input type="easyui-textbox" class="newDealInput newDealInputC newDealInputBold" name="srarea" id="srarea" value=""/><span class="fontChange">sq. ft.</span>
										</td>
									</tr>
									<tr>
										<td class="fontChange">
										Display of Equipment
										</td>
										<td class="fontChange">
										Front Area
										</td>
										<td style="text-align: right;" colspan ="2">
											<input type="hidden" id="Display" name="Display" value=""/>
											<label class="fontChange">Yes</label>
											<input onclick="fnChangeDisplayChk(this)" style="display: inline-block; width: 15px;" type="checkbox" name="Dchk" id="Dchk" value="Y"/>
											<label class="fontChange">No</label>
											<input onclick="fnChangeDisplayChk(this)" style="display: inline-block; width: 15px;" type="checkbox" name="Dchk" id="Dchk" value="N"/>
											<input type="easyui-textbox" class="newDealInput newDealInputC newDealInputBold" name="darea" id="darea" value=""/><span class="fontChange">sq. ft.</span>
										</td>
									</tr>
									<tr>
										<td class="fontChange">
										Workshop Area
										</td>
										<td class="fontChange">
										Covered
										</td>
										<td style="text-align: right;" colspan ="2">
											<input type="hidden" id="Workshop" name="Workshop" value=""/>
											<label class="fontChange">Yes</label>
											<input onclick="fnChangeWorkshopChk(this)" style="display: inline-block; width: 15px;" type="checkbox" name="Wschk" id="Wschk" value="Y"/>
											<label class="fontChange">No</label>
											<input onclick="fnChangeWorkshopChk(this)" style="display: inline-block; width: 15px;" type="checkbox" name="Wschk" id="Wschk" value="N"/>
											<input type="easyui-textbox" class="newDealInput newDealInputC newDealInputBold" name="wsarea" id="wsarea" value=""/><span class="fontChange">sq. ft.</span>
										</td>
									</tr>
									<tr>
										<td class="fontChange">
										Parts Area
										</td>
										<td class="fontChange">
										Covered
										</td>
										<td style="text-align: right;" colspan ="2">
											<input type="hidden" id="Parts" name="Parts" value=""/>
											<label class="fontChange">Yes</label>
											<input onclick="fnChangePartsChk(this)" style="display: inline-block; width: 15px;" type="checkbox" name="Pchk" id="Pchk" value="Y"/>
											<label class="fontChange">No</label>
											<input onclick="fnChangePartsChk(this)" style="display: inline-block; width: 15px;" type="checkbox" name="Pchk" id="Pchk" value="N"/>
											<input type="easyui-textbox" class="newDealInput newDealInputC newDealInputBold" name="parea" id="parea" value=""/><span class="fontChange">sq. ft.</span>
										</td>
									</tr>
									<tr>
										<td class="fontChange">
										Number or Salesmen Employed
										</td>
										<td>
										<input type="easyui-textbox" class="newDealInput newDealInputC newDealInputBold" name="Salesmen" id="Salesmen" value="" required  placeholder=""/>
										</td>
										<td class="fontChange">
										Number of Service people
										</td>
										<td>
										<input type="easyui-textbox" class="newDealInput newDealInputC newDealInputBold" style="width:100%;" name="Service" id="Service" value="" required  placeholder=""/>
										</td>
									</tr>
									<tr>
										<td class="fontChange">
										Number of Parts people
										</td>
										<td>
										<input type="easyui-textbox" class="newDealInput newDealInputC newDealInputBold" name="Pasrts" id="Pasrts" value="" required  placeholder=""/>
										</td>
										<td class="fontChange">
										Number of Office staff
										</td>
										<td>
										<input type="easyui-textbox" class="newDealInput newDealInputC newDealInputBold" style="width:100%;" name="Office" id="Office" value="" required  placeholder=""/>
										</td>
									</tr>
									<tr>
										<td class="fontChange">
										Major Highway Access
										</td>
										<td>
											<input type="hidden" id="Major" name="Major" value=""/>
											<label class="fontChange">Yes</label>
											<input onclick="fnChangeMajorChk(this)" style="display: inline-block; width: 15px;" type="checkbox" name="Mchk" id="Mchk" value="Y"/>
											<label class="fontChange">No</label>
											<input onclick="fnChangeMajorChk(this)" style="display: inline-block; width: 15px;" type="checkbox" name="Mchk" id="Mchk" value="N"/>
										</td>
										<td class="fontChange">
										Miles from Highway
										</td>
										<td>
										<input type="easyui-textbox" class="newDealInput newDealInputC newDealInputBold" style="width:100%;" name="Mfw" id="Mfw" value="" required  placeholder=""/>
										</td>
									</tr>
									</table>
							</div>
							<div id="light">						
								<table>
									<tr id="bold">
										<td class="fontChange2">
											Do you have any plans to added on or change the appearance of your property, please give a brief description
										</td>
									</tr>
									<tr>
										<td style="width:40%;" id="bold">
											<input type="easyui-textbox" class="newDealInput newDealInputL" style="width:100%;" name="description1" id="description1" value="" required  placeholder=""/>
										</td>
									</tr>
									<tr>
										<td  id="bold">
											<input type="easyui-textbox" class="newDealInput newDealInputL" style="width:100%;" name="description2" id="description2" value="" required  placeholder=""/>
										</td>
									</tr>
									<tr>
										<td  id="bold">
											<input type="easyui-textbox" class="newDealInput newDealInputL" style="width:100%;" name="description3" id="description3" value="" required  placeholder=""/>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<table class="tbl_100 subTitTop">
						<tr>
							<th class="subTit2" id="subTitAccn4" onClick="doAccordian(this.id)" >
								<span class="subTitIcon"><i class="fa fa-th-large fa-xs g-mr-5 tabColor" aria-hidden="true"></i>Section C. Certification</span>
								<img src="/lsdp/resources/jquery/easyui-1.4/themes/ui-pepper-grinder/images/datagrid_icons_open.png" class="subTitAccn" id="subTitAccn4_icon"/>
							</th>
						</tr>
					</table>
					<div id="subAccn4" style="white-space: nowrap; display:none;">
						<div style="padding-left: 27px;">
							<div id="bold">
			<!-- 				<div id="cart_body_option2" class="order_cart_body" style="padding: 0 10px; border: 1px solid;"> -->
			<!-- 						  <table border="1" style="width:100%; height:200px"> -->
			<!-- 				          </table> -->
			<!-- 					</div> -->
							<table class="tbl_100">
								<tr>
									<td colspan="2" class="fontChange2" style="font-size: 18px !important;">
										I/We certify that the above information is true to the best of my/our knowledge and belief.
									</td>
			<!-- 						<td style="width:45%;"> -->
			<!-- 						</td> -->
			<!-- 						<td rowspan="7" align = "center" bgcolor="#00f3ff" style="width:80%; height:150px; border: 1px solid; vertical-align: bottom;"> -->
			<!-- 						For LS Tractor USA, LLC <br>Internal Use Only -->
			<!-- 						</td> -->
									
								</tr>
								<tr>
									<td colspan="2" class="fontChange2" style="font-size: 18px !important; letter-spacing: -0.7px;">
										I understand that LS Tractor USA, LLC may use the above information to make a decision about my Dealership application with LS Tractor USA, LLC.
									</td>
								</tr>
								<tr>
									<td id="bold" style="display: flex;">
										<span data-item="LAB_007" class="fontChange2" style="width: 10%;">Date</span>
										<div>
											<select class="easyui-combobox" id="crtiDate1" style="width:150px;" data-options="prompt:'Month'">
												<option value=""></option>
												<c:forEach var="item" items="${getMonth}">
													<option value="${item.CodeCd}">${item.CodeName}</option>
												</c:forEach>
											</select>
										</div>
										<div>
											<select class="easyui-combobox" id="crtiDate2"  style="width:150px;" data-options="prompt:'Day'">
												<option value=""></option>
												<c:forEach var="item" items="${getDay}">
													<option value="${item.CodeCd}">${item.CodeName}</option>
												</c:forEach>
											</select>
										</div>
										<div>
											<select class="easyui-combobox" id="crtiDate3"  style="width:150px;" data-options="prompt:'Year'">
												<option value=""></option>
												<c:forEach var="item" items="${getYear}">
													<option value="${item.CodeCd}">${item.CodeName}</option>
												</c:forEach>
											</select>
										</div>
										<!-- <input class="easyui-datebox" style="width:97%" name="Date1" id="Date1" value=""/>
										<input class="easyui-datebox" name="trsfDate" id="r_trsfDate"  data-options="width:1021,height:30" /> -->
									</td>
								</tr>
								<tr>
									<td id="bold" style="display: flex;">
										<span data-item="LAB_007" class="fontChange2" style="width: 10%;">Name</span>
										<input type="easyui-textbox" class="newDealInput newDealInputL30" style="width:90%;" name="crtiName" id="crtiName" value=""/>
									</td>
								</tr>
								<tr>
									<td id="bold" style="display: flex;">
										<span data-item="LAB_007" class="fontChange2" style="width: 10%;">Signature</span>
										<input type="easyui-textbox" class="newDealInput newDealInputL30" style="width:90%;" name="crtiSign" id="crtiSign" value=""/>
									</td>
								</tr>
								<tr>
									<td id="bold" style="text-align: left;" colspan="2">
										<span data-item="LAB_007" style="margin-left: 15%;" class="fontChange2">(Owner/Partner/Officer of the Company)</span>
									</td>
								</tr>
								<tr>
									<td style="height: 50px;">
									</td>
								</tr>
							</table>
					</div>
					<div id="light">
							<table>
								<tr>
									<td class="fontChange">
										<span class="fontChange2">Financial Information : </span>To process your application, please submit the following documents : <br>
										<span style="margin-left: 147px;" class="fontChange2"><i style="width: 25px;" class=" fa fa-info-circle tabColor" aria-hidden="true"></i>Personal Financial.</span> Please provide documents less than 6 months old for all principals (owners)</span> <br>
										<span style="margin-left: 170px; font-size: 18px;" class="fontChange2">'AND'</span><br>
										<span style="margin-left: 147px;" class="fontChange2"><i style="width: 25px;" class=" fa fa-info-circle tabColor" aria-hidden="true"></i>Business Financial.</span> Please provide financial statements (both the income statement and the balance sheet)<br>
										<span style="margin-left: 170px;">for two prior year-end and current year interim financial statements.<br></span>
										<span style="margin-left: 170px; font-size: 18px;" class="fontChange2">'OR'</span><br>
										<span style="margin-left: 147px;"><i style="width: 25px;" class=" fa fa-info-circle tabColor" aria-hidden="true"></i>Complete Business Tax Returns.</span>Entire returns for the last two years and all supporting schedules<br>
										<span class="fontChange2">Other Information : </span>Please include appropriate documents if your company is listed as follows: <br>
										<span style="margin-left: 148px;"><i style="width: 25px;" class=" fa fa-info-circle tabColor" aria-hidden="true"></i>Corporation – Articles of Incorporation</span><br>
										<span style="margin-left: 148px;"><i style="width: 25px;" class=" fa fa-info-circle tabColor" aria-hidden="true"></i>LLC – Operating Agreement</span><br>
										<span style="margin-left: 148px;"><i style="width: 25px;" class=" fa fa-info-circle tabColor" aria-hidden="true"></i>Partnership – Partnership Agreement</span><br>
									</td>
								</tr>
							</table>
							</div>
						</div>
					</div>
					
				</c:if>
			</c:forEach>
			<table class="tbl_100 subTitTop">
				<tr>
					<th class="subTit2" id="subTitAccn5" onClick="doAccordian(this.id)" >
						<span class="subTitIcon"><i class="fa fa-th-large fa-xs g-mr-5 tabColor" aria-hidden="true"></i>Comments</span>
						<img src="/lsdp/resources/jquery/easyui-1.4/themes/ui-pepper-grinder/images/datagrid_icons_close.png" class="subTitAccn" id="subTitAccn5_icon"/> 
					</th>
				</tr>
			</table>
			<div id="subAccn5" style="white-space: nowrap;">
			<div style="padding-left: 27px;">
				<table class="remarkDesign">
					<tr id="DEALER">
						<th style="vertical-align: top;" class="h"><span>Dealer</span></th>
						<td class="d">
							<textarea class="pdL10" rows="4" cols="30"  name="Dealremk" id="Dealremk"></textarea>
						</td>
					</tr>
					<tr id="LSTA">
						<th style="vertical-align: top;" class="h"><span>LSTA</span></th>
						<td class="d">
							<textarea class="pdL10" rows="4" cols="30"  name="LSremk" id="LSremk"></textarea>
						</td>
					</tr>
				</table>
			</div>
			</div>
			<fieldset class="div-line-new-sub div-line-new-sub-left">
		        <table cellpadding="5" class="search-table tableEtc-c" style="width:100%;">
		            <tr id="save">
						<td class="h" style="width: fit-content;  margin: auto; display: block; padding: 10px;">
					        <a href="javascript:void(0)" style="width:150px;" class="easyui-linkbutton c6" id="save-button" data-item="BTN_004" data-options="disabled:${UPD}" >Save</a>
					        <a href="javascript:void(0)" style="width:150px; margin-left:15px;" class="easyui-linkbutton c6" id="Submit-button" data-item="BTN_004" data-options="disabled:${AUS}" >Submit</a>
							<a href="javascript:void(0)" style="width:150px; margin-left:15px;" class="easyui-linkbutton c6"  id="Reviewed-button" data-item="BTN_004" data-options="disabled:${AU1}">Reviewed</a>
					        <a href="javascript:void(0)" style="width:150px; margin-left:15px;" class="easyui-linkbutton c6" id="Arequest-button" data-item="BTN_004" data-options="disabled:${AU3}" >Approval request</a>
					        <c:if test="${fn:indexOf(gsSpcAuthCode,'APPR') > -1}">
								<a href="javascript:void(0)" style="width:150px; margin-left:15px;" class="easyui-linkbutton c8"  id="Approve-button" data-item="BTN_003" data-options="disabled:${AU5}">Approve</a>
							</c:if>
							<a href="javascript:void(0)" style="width:150px; margin-left:15px;" class="easyui-linkbutton c6"  id="Checked-button" data-item="BTN_004" data-options="disabled:${AU1}">Checked</a>
						</td>
		            </tr>
		             <tr id="Srequest">
						<td class="h" style="width: fit-content;  margin: auto; display: block; padding: 10px;">
<%-- 					        <a href="javascript:void(0)" style="width:150px;" class="easyui-linkbutton c6" id="Cancel-button" data-item="BTN_029" data-options="disabled:${AU3}" >Cancel</a> --%>
					        <a href="javascript:void(0)" style="width:150px;" class="easyui-linkbutton c6"  id="Srequest-button" data-item="BTN_003" data-options="disabled:${AU2}">Document request</a>
<%-- 					        <a href="javascript:void(0)" style="width:150px; margin-left:15px;" class="easyui-linkbutton c6" id="Reject-button" data-item="BTN_004" data-options="disabled:${AU4}" >Reject</a> --%>
						</td>
		            </tr>
		            <tr>
		            	<td class="h" style="width: fit-content;  margin: auto; display: block; padding: 10px;">
		            		<a href="javascript:doBack()" style="width:150px;" class="easyui-linkbutton c6" id="back-button"  data-item="BTN_002"  data-options="">Go To List</a>
		            		<a href="javascript:doPrint()" style="width:150px; margin-left:15px;" class="easyui-linkbutton c6" id="print-button"  data-item="BTN_002"  data-options="">Print</a>
						</td>
					</tr>
		        </table>
			</fieldset>
			<table class="tbl_100 subTitTop">
				<tr>
					<th class="subTit2" id="subTitAccn6" onClick="doAccordian(this.id)" >
						<span class="subTitIcon"><i class="fa fa-th-large fa-xs g-mr-5 tabColor" aria-hidden="true"></i>History</span> 
						<img src="/lsdp/resources/jquery/easyui-1.4/themes/ui-pepper-grinder/images/datagrid_icons_close.png" class="subTitAccn" id="subTitAccn6_icon"/>
					</th>
				</tr>
			</table>
			<div id="subAccn6" style="white-space: nowrap;">
				<div style="padding-left: 27px;">
				<div id="light">
					<table>
						<tr>
							<td>
							<span id="chngHist"></span>
						</td>
						</tr>
					</table>
					</div>
				</div>
			</div>
			</div>
		</div><!-- 들여쓰기 -->
	</form>
</div>

	<div class="orderTabs" id="appl_list_option">
		<div class="orderTabs" id="appl_deal_option">
			<div style="font-size: 17px; color:black; font-weight: bold;">
				ID: <span id="dealId"></span>
			</div>
			<div style="font-size: 15px; color:black; word-break: break-all;">
			   <span id="dealShip"></span>
		    </div>
		</div>
		<div class="order_cart_header" style="height: 45px; padding: 10px;">
			<div style="height: 25px; font-size: 15px; color:black; ">
				<i class="fa fa-clone fa-xs g-mr-5 tabColor" aria-hidden="true"></i>
				Application List <%-- ${fn:length(ordrMastList)} --%>
			</div>
		</div>
		<div id="cart_body_option" class="order_cart_body" style="padding: 0 10px;">
			<c:forEach var="list" items="${getApplList}">  
				<table id ="appl_list_body" style="cursor:pointer; font-weight: 600; width: 100%;" title="${list.applName}">
					<c:if test="${list.applId eq 'F01'}"><tr onclick="pageMoveList('${list.applId}')" style="background:#deebf7; color:#0070c0"; ></c:if>
					    <c:if test="${list.applId ne 'F01'}"><tr onclick="pageMoveList('${list.applId}')"></c:if>
						<c:if test="${list.STAT ne NULL}">
							 <c:if test="${list.STAT eq 'Reviewed'}">
							    <td style="color:#0070c0";>${list.applIdView}</td>
							    <td style="color:#0070c0";>${list.STAT}</td>
						    </c:if>
						     <c:if test="${list.STAT ne 'Reviewed'}">
							    <td>${list.applIdView}</td>
							    <td>${list.STAT}</td>
						    </c:if>
					    </c:if>
					   
					    <c:if test="${list.Documents ne NULL}">
						    <td style="color:#ff003a";>${list.applIdView}</td>
						    <td style="color:#ff003a";>${list.Documents}</td>
					    </c:if>
					 </tr>
				</table>
			</c:forEach>
		</div>
	</div>
	
<div id="reject-check-dialog" class="wui-dialog" style="border-top-width:1px; display:none;">
	<div data-options="region:'center',border:false" style="height: 179px;">
		<div class="div-line-new" style="padding-top: 5px; font-weight: 600; font-size: 16px; text-align: center; height: 110px;">
			<div style="height: 35px; margin-top:15px;">Do you want to Reject it?</div>
			<table class="popup-search-table">
				<tr>
					<th><span style="color:red;">*Reason</span></th>
					<td>
						<input class="easyui-textbox" name="rejectReason" id="rejectReason" value="" data-options="width:350, height: 26"/>
					</td>
				</tr>
			</table>
	   </div>
	   <div style="width:100%; display: inline-block; margin-top: 3px; text-align: center;">
	 		<a href="javascript:void(0)" style="margin-right: 10px; display: inline-block;" class="easyui-linkbutton c6" id="reject-check-ok-button" data-item="BTN_035">Ok</a>
	 		<a href="javascript:void(0)" class="easyui-linkbutton c6" id="reject-check-close-button" data-item="BTN_036">Cancel</a>
	   </div>
	</div>
</div>

<div id="cancel-check-dialog" class="wui-dialog" style="border-top-width:1px; display:none;">
	<div data-options="region:'center',border:false" style="height: 179px;">
		<div class="div-line-new" style="padding-top: 5px; font-weight: 600; font-size: 16px; text-align: center; height: 110px;">
			<div style="height: 35px; margin-top:15px;">Do you want to Cancel it?</div>
			<table class="popup-search-table">
				<tr>
					<th><span style="color:red;">*Reason</span></th>
					<td>
						<input class="easyui-textbox" name="cancelReason" id="cancelReason" value="" data-options="width:350, height: 26"/>
					</td>
				</tr>
			</table>
	   </div>
	   <div style="width:100%; display: inline-block; margin-top: 3px; text-align: center;">
	 		<a href="javascript:void(0)" style="margin-right: 10px; display: inline-block;" class="easyui-linkbutton c6" id="cancel-check-ok-button" data-item="BTN_035">Ok</a>
	 		<a href="javascript:void(0)" class="easyui-linkbutton c6" id="cancel-check-close-button" data-item="BTN_036">Cancel</a>
	   </div>
	</div>
</div>
<!-- [LAYOUT] end -->

<!-- 엑셀  진행상태 -->
<div id="progress-popup" class="wui-dialog" style="display:none">
    <br></br>
    <center><img src="<%=request.getContextPath() %>/resources/images/ajax_loader_red_48.gif"/></center>
</div>

<!-- PDF 출력 조회 -->
<!-- <div id="pdf-dialog" class="easyui-layout" style="width:1024px;height:720px">
<iframe id="pdf-redirect" src=""  frameborder="0" style="width:100%;height:672px"></iframe>
</div> -->

<!-- BODY 하단 INCLUDE -->
<%@ include file="/WEB-INF/views/include/body.foot.jsp"%>

<form name="ReportViewForm">
    <input type="hidden" id="viewReportUrl" name="viewReportUrl" />
</form>

</html>
