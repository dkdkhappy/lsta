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
<%-- SAR History 화면이다.                                     					--%>
<%--                                                                        --%>
<%-- @author C-NODE                                                         --%>
<%-- @version 1.0 2022/07/07                                                --%>
<%-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<!-- JAVASCRIPT AND STYLE INCLUDE -->
<%@ include file="/WEB-INF/views/include/common.jsp" %>
<!-- BUSINESS JAVASCRIPT -->
<script type="text/javascript">
	 /* doInit({
		domain: '<spring:eval expression="@app['domain.user']"/>'
	}); */
</script>
<script type="text/javascript" src="<c:url value="/resources/js/sar/sarhistory.js?v=1207A" />"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
#account-layout{min-width:1200px !important;}
.search-label-h2 {
    width: 128px;
}

#excel-button, #excel-button .l-btn-text { width: 130px;}
#excelUp-button, #excelUp-button .l-btn-text { width: 200px;}
#print-button, #print-button .l-btn-text { width: 80px;}
#working-popup, #working-popup2, #working-popup3{
	width: 98%;
	height: 92%;
	position: absolute;
	background: rgba(0,0,0,0.1);
	z-index: 9050;
}
#working-popup img, #working-popup2 img, #working-popup3 img {position: absolute;top: 40%;margin-left: -25px;margin-top: -75px;}
.req{color: red;font-size: 10px;}

.darDiv{height:205px;overflow-x:scroll;}
.darTable{width:100%}
.darTable thead{background-color: #E6EBF1;}
.darTable thead th{text-align: center;height: 25px;border: 1px solid lightgray;}
.darTable tbody td{border: 1px solid lightgray;}
.darTable tbody td:nth-of-type(3), .darTable tbody td:nth-of-type(4), .darTable tbody td:nth-of-type(5) {
	text-align: center;
}
.layout-panel-south{position:absolute !important;}

.datagrid-header-row, .datagrid-row{height: 30px !important;}
.datagrid-header, .datagrid-htable {height: 60px !important;}

.popup-search-table label {
	margin-bottom: 0;
}

.popup-search-table tr:last-of-type th, .popup-search-table tr:last-of-type td {
	padding-bottom: 0;
}

.popup-search-table table td, .popup-search-table table th {
	padding: 0;
	width: 97px;
}
.popup-search-table tr:nth-of-type(3) table td, .popup-search-table tr:nth-of-type(3) table th,
.popup-search-table tr:nth-of-type(4) table td, .popup-search-table tr:nth-of-type(4) table th {
	width: 100px;
}

.width-auto td:nth-of-type(4) {
	width: 140px !important;
}
.width-auto td:last-of-type {
	width: auto;
}
.width-auto2 td:nth-of-type(3), .width-auto2 td:nth-of-type(4), .width-auto2 td:nth-of-type(5){
	width: 125px;
}
.width-auto2 td:last-of-type {
	width: auto;
}

.width-auto3 td, .width-auto4 td{
	width: 90px !important;
}

.width-auto4 td:nth-of-type(5) {
	width: 130px !important;
}

/* .width-auto4 td:first-of-type, .width-auto4 td:nth-of-type(5){
	width: 130px;
} */

/* 221208 탭메뉴 추가 */
.tab_menu .state {
	position: absolute;
	display: none;
}
.menu_tabs {
	overflow: hidden;
}
.menu_tabs label {
	float: left;
	margin-right: 2px;
	margin-bottom: 0;
	font-size: 12px;
	padding: 7px 50px;
	background: #878787;
	display: inline-block;
	color: #fff;
	text-decoration: none;
	-webkit-border-radius: 4px 4px 0 0;
	-moz-border-radius: 4px 4px 0 0;
	border-radius: 4px 4px 0 0;
	-webkit-transition: all 0.3s ease;
	-o-transition: all 0.3s ease;
	transition: all 0.2s ease;
}
.menu_tabs label:hover {
	background: #414a68;
	cursor: pointer;
}

#tab-1:checked ~ .menu_tabs #tab-l1, #tab-2:checked ~ .menu_tabs #tab-l2,
#tab-3:checked ~ .menu_tabs #tab-l3, #tab-4:checked ~ .menu_tabs #tab-l4,
#tab-5:checked ~ .menu_tabs #tab-l5, #tab-6:checked ~ .menu_tabs #tab-l6 {
	color: #333b48;
	background: #fff;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
}

.tab_menu {
	margin: 10px;
	position: relative;
}
.menu_panel {
	padding: 1em;
	position: relative;
	height: 230px;
	z-index: 400;
	background: #fff;
	-webkit-border-radius: 0 4px 4px 4px;
	-moz-border-radius: 0 4px 4px 4px;
	border-radius: 0 4px 4px 4px;
}

.menu_panel .panel {
	display: none;
	position: relative;
}

.menu_panel .panel h3 {
	font-size: 1.8em;
	color: #333b48;
	border-bottom: 1px solid #d9d9d9;
	padding-bottom: 5px;
	margin-bottom: 12px;
}
.menu_panel .panel p {
	font-size: 1.3em;
	line-height: 1.6em;
	color: #76716f;
}

#tab-1:checked ~ .menu_panel #tab_p1, #tab-2:checked ~ .menu_panel #tab_p2,
#tab-3:checked ~ .menu_panel #tab_p3, #tab-4:checked ~ .menu_panel #tab_p4,
#tab-5:checked ~ .menu_panel #tab_p5, #tab-6:checked ~ .menu_panel #tab_p6 {
	display: block;
}
/* #tab_p4 .darDiv .popup-search-table:nth-of-type(1) tr:nth-of-type(2) th {
	text-align: center;
} */
.popup-search-table td input[type=checkbox]{
	display: inline-block;
	width: 13px;
}
.customer-wrap {
	overflow: hidden;
	height: auto;
	background: #fff; 
	margin: 10px; 
	border-radius: 3px; 
	padding: 10px;
	display: flex;
}
.addBtnDesign {
	width: auto;
    font-size: 22px;
    color: #222;
    font-weight: 600;
    top: 0;
    position: absolute;
    right: 0;
}
.addBtnDesign:hover{
	color: #337ab7;
	transition: all ease 0.2s;
}
tr.hide {
	display: none;
}

tr.show {
	display: table-column;
}
.popup-search-table.customer-table > tbody > tr > td:first-of-type {
	width: 370px;
}
.popup-search-table.customer-table td{
	padding-left: 3px;
	width: 250px;
}
.popup-search-table.customer-table th{
	width: 150px;
}
/* CSS */
.loadingBox .dim {
	position:fixed; 
	left:0; top:0; 
	width:100%; 
	height:100%; 
}
.loadingBox .dim::before {
    content: '';
    width: 100px;
    height: 100px;
    background-image: url(<%=request.getContextPath() %>/resources/images/emblem.png);
    display: block;
    position: absolute;
    left: 50.2%;
    top: 50%;
    background-repeat: no-repeat;
    background-size: 50px;
    border-radius: 50em;
    background-position: center;
    transform: translate(-50%, -50%);
}
.loadingBox .circle {
	position:fixed; 
	left:50%; 
	top:50%; 
	transform:translate(-50%, -50%); 
	width:100px; 
	height:100px; 
	border:8px solid transparent; 
	border-top:8px solid #afafaf; 
	border-radius:50em; 
	transition:all .2s;
    animation-name:spinCircle;
    animation-duration:1.0s;
    animation-iteration-count:infinite;
    animation-timing-function:linear;
}

@keyframes spinCircle {
    from {
        transform:translate(-50%, -50%) rotate(0);
    }
    to {
        transform:translate(-50%, -50%) rotate(360deg);
    }
}
</style>
</head>

<!-- BODY 상단 INCLUDE -->
<%@ include file="/WEB-INF/views/include/body.head.jsp" %>
<%@ include file="/WEB-INF/views/include/topnav.jsp" %>

<!-- 화면 첫 로딩시 필요한 ProgressBar -->
<div id="loadingProgressBar">
    <%-- <br></br>
    <center><img src="<%=request.getContextPath() %>/resources/images/ajax_loader_red_48.gif"></img></center> --%>
    <div class="loadingBox">
	    <div class="dim"></div>
	    <div class="circle"></div>
	</div>
</div>
<input type="hidden" id="s_prev" name="prev" value="${dateprev}" />
<input type="hidden" id="s_today" name="today" value="${datecreate}" />
<input type="hidden" id="gsUserType" name="gsUserType" value="${gsUserType}"/>
<input type="hidden" id="gsUserId" name="gsUserId" value="${gsUserId}"/>

<!-- [LAYOUT] start -->
<div class="easyui-layout" data-options="fit:true" id="account-layout" style="display:none">
<table id="search-grid">
	<thead data-options="frozen:true">
		<tr>
			<th data-options="field:'ck',checkbox:true,halign:'center',align:'center'" rowspan="2"></th>
			<th data-options="field:'diagDate', halign:'center', width:120, align:'center', data_item:'GRD_001', sortable:true" rowspan="2">진단일자</th>
			<th data-options="field:'bizOfic',  halign:'center', width:120, align:'center', data_item:'GRD_002', sortable:true" rowspan="2">영업소명</th>
			<th data-options="field:'agncOfic', halign:'center', width:120, align:'center', data_item:'GRD_003', sortable:true" rowspan="2">대리점명</th>
			<th data-options="field:'diagStaf', halign:'center', width:120, align:'center', data_item:'GRD_004', sortable:true" rowspan="2">진단담당</th>
			<th data-options="field:'custName', halign:'center', width:120, align:'center', data_item:'GRD_005', sortable:true" rowspan="2">고객성명</th>
			<th data-options="field:'modlCode', halign:'center', width:120, align:'center', data_item:'GRD_006', sortable:true" rowspan="2">모델명</th>
			<th data-options="field:'evalStat', halign:'center', width:100, align:'center', data_item:'GRD_007', sortable:true" rowspan="2">평가상태</th>
			<th data-options="field:'admNo',    halign:'center', width:120, align:'center', data_item:'GRD_008', sortable:true" rowspan="2">관리번호</th>
			<!-- <th data-options="field:'custHp',   halign:'center', width:120, align:'center', data_item:'GRD_006', sortable:true" rowspan="2">고객연락처</th>
			<th data-options="field:'custAddr', halign:'center', width:400, align:'left',   data_item:'GRD_007', sortable:true" rowspan="2">고객주소</th> -->
		</tr>
		<tr>
		</tr>
	</thead>
	<thead>
		<tr>
			<th colspan="2">진단기(1)</th>
			<th colspan="2">육안(소음) 점검(4)</th>
			<th colspan="2">기능 점검(7)</th>
			<th colspan="2">엔진/미션/차축(11)</th>
			<th colspan="2">기타점검/조치(1)</th>
		</tr>
		<tr>
			<th data-options="field:'AOk', halign:'center', width:60, align:'center', data_item:'GRD_008', sortable:true">OK</th>
			<th data-options="field:'ANg', halign:'center', width:60, align:'center', data_item:'GRD_009', sortable:true">NG</th>
			<th data-options="field:'BOk', halign:'center', width:60, align:'center', data_item:'GRD_010', sortable:true">OK</th>
			<th data-options="field:'BNg', halign:'center', width:60, align:'center', data_item:'GRD_011', sortable:true">NG</th>
			<th data-options="field:'COk', halign:'center', width:60, align:'center', data_item:'GRD_012', sortable:true">OK</th>
			<th data-options="field:'CNg', halign:'center', width:60, align:'center', data_item:'GRD_013', sortable:true">NG</th>
			<th data-options="field:'DOk', halign:'center', width:60, align:'center', data_item:'GRD_014', sortable:true">OK</th>
			<th data-options="field:'DNg', halign:'center', width:60, align:'center', data_item:'GRD_015', sortable:true">NG</th>
			<th data-options="field:'EOk', halign:'center', width:60, align:'center', data_item:'GRD_016', sortable:true">OK</th>
			<th data-options="field:'ENg', halign:'center', width:60, align:'center', data_item:'GRD_017', sortable:true">NG</th>
		</tr>
	</thead>
</table>


<div id="search-toolbar" class="wui-toolbar">
	<form id="search-form">
		<fieldset class="Remake-div-line-new">
	        <table cellpadding="5" class="search-table tableSearch-c" >
	        	<tr>
	        		<th class="h table-Search-hRe"><span data-item="LAB_001">진단일자</span></th>
					<td class="d" style="min-width: 300px;">
						<input class="easyui-datebox" name="date1" id="date1" value="${dateprev}" data-options="width:120, height: 26"/> ~
						<input class="easyui-datebox" name="date2" id="date2" value="${datecreate}" data-options="width:120, height: 26"/>
					</td>
					<th class="h table-Search-hRe"><span data-item="LAB_002">고객성명</span></th>
					<td class="d">
						<input class="easyui-textbox" name="custName" id="custName" value="" data-options="width:120, height: 26"/>
					</td>
					<th class="h table-Search-hRe"><span data-item="LAB_003">모델명</span></th>
					<td class="d">
						<input class="easyui-textbox" name="modlCode" id="modlCode" value="" data-options="width:120, height: 26"/>
						<%-- <select class="easyui-combobox" name="modlCode" ID="modlCode" data-options="width:120, height: 26,editable:false,panelHeight:'auto'">
							<option value="">전체</option>
							<c:forEach var="item" items="${getCodeLists}">
								<c:if test="${item.CODE_GRUP eq 'MODL_CODE'}">
									<option value="${item.CODE_CD}">${item.CODE_NAME}</option>
								</c:if>
							</c:forEach>
						</select> --%>
					</td>
					<th class="h table-Search-hRe"><span data-item="LAB_004">평가상태</span></th>
					<td class="d">
						<select class="easyui-combobox" name="evalStat" ID="evalStat" data-options="width:120, height: 26,panelHeight:'auto'">
							<option value="">전체</option>
							<c:forEach var="item" items="${getStatLists}">
								<option value="${item.codeName}">${item.codeName}</option>
							</c:forEach>
						</select>
					</td>
					<td class="b w-a" colspan="2" style="text-align: left;">
						<a href="javascript:void(0)" style="width: 80px; height: 26px;" id="search-button" class="easyui-linkbutton cgray" data-item="BTN_001" data-options="">조회</a>
						<a href="javascript:void(0)" style="width: 80px; height: 26px;" id="clear-button"  class="easyui-linkbutton c12" data-item="BTN_002" data-options="">초기화</a>
						<a href="javascript:void(0)" style="width: 30px; height: 26px;" id="updown-button" class="easyui-linkbutton c12">
							<i id="arrow-icon" class="fa fa-arrow-circle-down fa-rotate-180 fa-lg"></i>
						</a>
					</td>
				</tr>
	            <tr>
	            	<th class="h table-Search-hRe"><span data-item="LAB_005">진단담당</span></th>
					<td class="d">
						<select class="easyui-combobox" name="diagStaf" ID="diagStaf" data-options="width:255, height: 26">
							<option value="">전체</option>
							<c:forEach var="item" items="${getInspLists}">
								<option value="${item.codeCd}">${item.dispName}</option>
							</c:forEach>
						</select>
					</td>
					<th class="h table-Search-hRe"><span data-item="LAB_006">영업소명</span></th>
					<td class="d">
						<select class="easyui-combobox" name="bizOfic" id="bizOfic" data-options="width:120, height: 26">
							<option value=""></option>
							<c:forEach var="item" items="${getCodeLists}">
								<c:if test="${item.CODE_GRUP eq 'BIZ_OFIC'}">
									<option value="${item.CODE_CD}">${item.CODE_NAME}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<th class="h table-Search-hRe"><span data-item="LAB_007">대리점명</span></th>
					<td class="d">
						<select class="easyui-combobox" name="agncOfic" id="agncOfic" data-options="width:120, height: 26">
							<option value=""></option>
							<c:forEach var="item" items="${getCodeLists}">
								<c:if test="${item.CODE_GRUP eq 'AGNC_OFIC'}">
									<option value="${item.CODE_CD}">${item.CODE_NAME}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<th class="h table-Search-hRe"><span data-item="LAB_008">관리번호</span></th>
					<td class="d">
						<input class="easyui-textbox" name="admNo" id="admNo" value="" data-options="width:120, height: 26"/>
					</td>					
	            	<!-- <th class="h table-Search-hRe"><span data-item="LAB_005">State</span></th>
					<td class="d">
						<select class="easyui-combobox" name="addrRegn" ID="addrRegn" data-options="width:120, height: 26,editable:false">
							<option value="">ALL</option>
							<c:forEach var="item" items="${getCodeLists}">
								<c:if test="${item.CODE_GRUP eq 'AREA_CODE'}">
									<option value="${item.CODE_CD}">${item.CODE_NAME}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<th class="h table-Search-hRe"><span data-item="LAB_006">Ass. Author</span></th>
					<td class="d">
						<select class="easyui-combobox" name="assName" ID="assName" data-options="width:120, height: 26, panelHeight:'auto',editable:false">
							<option value="">ALL</option>
							<c:forEach var="item" items="${getInspLists}">
								<option value="${item.codeCd}">${item.codeName}</option>
							</c:forEach>
							<%-- <c:if test="${getMyUserType eq 'A'}">
								<option value="">ALL</option>
								<c:forEach var="item" items="${getInspLists}">
									<option value="${item.codeCd}">${item.codeName}</option>
								</c:forEach>
							</c:if>
							<c:if test="${getMyUserType ne 'A'}">
								<c:forEach var="item" items="${getInspLists}">
									<c:if test="${item.codeCd eq gsUserId}">
										<option value="${item.codeCd}" selected>${item.codeName}</option>
									</c:if>
								</c:forEach>
							</c:if> --%>
						</select>
					</td>
					<th class="h table-Search-hRe"><span data-item="LAB_007">Current SM</span></th>
					<td class="d">
						<select class="easyui-combobox" name=smName ID="smName" data-options="width:120, height: 26, panelHeight:'auto',editable:false">
							<c:if test="${gsUserType eq 'A'}">
								<option value="">ALL</option>
								<c:forEach var="item" items="${getInspLists}">
									<option value="${item.codeCd}">${item.dispName}</option>
								</c:forEach>
							</c:if>
							<c:if test="${gsUserType ne 'A'}">
								<c:forEach var="item" items="${getInspLists}">
									<c:if test="${item.codeCd eq gsUserId}">
										<option value="${item.codeCd}" selected>${item.dispName}</option>
									</c:if>
								</c:forEach>
							</c:if>
						</select>
					</td> -->
	            </tr>
	            <!-- <tr>
	            	<th class="h table-Search-hRe"><span data-item="LAB_008">Dealer Type</span></th>
					<td class="d">
						<select class="easyui-combobox" name="dealType" ID="dealType" data-options="width:120, height: 26,editable:false">
							<option value="">ALL</option>
							<c:forEach var="item" items="${getCodeLists}">
								<c:if test="${item.CODE_GRUP eq 'DAR_DEAL_TYPE'}">
									<option value="${item.CODE_CD}">${item.CODE_NAME}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
	            </tr> -->
	        </table>
		</fieldset>

		<fieldset class="div-line-new-sub div-line-new-sub-left">
	    	<table cellpadding="5" class="search-table tableEtc-c" style="width:100%;">
	        	<tr>
					<td class="h">
						<a href="javascript:void(0)" class="easyui-linkbutton c6" id="append-button" data-item="BTN_003" data-options="disabled:${INS}">생성</a>
						<a href="javascript:void(0)" class="easyui-linkbutton c6" id="remove-button" data-item="BTN_004" data-options="disabled:${DEL}">삭제</a>
					    <a href="javascript:void(0)" class="easyui-linkbutton c4" iconCls="icon-excel" id="excel-button" data-item="BTN_005">엑셀 다운로드</a>
					    <a href="javascript:void(0)" class="easyui-linkbutton c4" iconCls="icon-print" id="print-button" data-item="BTN_008" >출력</a>
					</td>
	            </tr>
	        </table>
		</fieldset>
	</form>
</div>
<!-- [LAYOUT] end -->
</div>

<!-- 등록 팝업 -->
<div id="regist-dialog" class="wui-dialog" style="border-top-width:1px; display:none;">
	<div id="working-popup" style="display:none;">
	    <%-- <br></br>
	    <center><img src="<%=request.getContextPath() %>/resources/images/ajax_loader_red_48.gif"/></center> --%>
	    <div class="loadingBox">
		    <div class="dim"></div>
		    <div class="circle"></div>
		</div>
	</div>
	<div class="easyui-layout"  data-options="fit:true">
		<div data-options="region:'center',border:false" style="text-align:center;">
			<fieldset class="div-line-new" style="height:auto;margin:0;padding-bottom:0;">
				<input type="hidden" id="cOper" name="oper" value="I" />
				<input type="hidden" id="cEvalYear" name="evalYear" value="" />
				<input type="hidden" id="cEvalSeq" name="evalSeq" value="" />
				<input type="hidden" id="cDarNo" name="darNo" value="" />
				<input type="hidden" id="cDarRev" name="darRev" value="" />
				<input type="hidden" id="hAdmNo" name="hAdmNo" value="" />
				<input type="hidden" id="cDealType" name="dealType" value="Active" />
				<div class="popup-table-alignCenter" style="overflow: hidden;">
					<div class="customer-wrap">
						<table class="popup-search-table customer-table" style="margin:0px;">
							<tr>
								<th>진단(점검) 일자</th>
								<td>
									<input class="easyui-datebox" name="diagDate" id="cDiagDate" value="${datecreate}" style="width:200px"/>
								</td>
								<th>진담(점검) 담당</th>
								<td>
									<c:forEach var="item" items="${getInspLists}">
										<input type="hidden" id="dispName" value="${item.dispName}"/>
									</c:forEach>
									<select class="easyui-combobox" name="diagStaf" id="cDiagStaf" data-options="width:200,onChange:function(){
											var value = $('#cDiagStaf').combobox('getValue');
											$.ajax({
										        url: getUrl('/sar/sarhistory/getComDeptLists.json'),
										        dataType: 'json',
										        async: false,
										        type: 'post',
										        data: {userId: value},
										        success: function(result) {
										        	$('#cBizOfic').combobox('setValue',result.rows[0].comName);
										        	$('#cAgncOfic').combobox('setValue',result.rows[0].deptName);
										        },
										        error:  function(result) {
										        	
										        }
										    });
										}">
										<option value=""></option>
										<c:forEach var="item" items="${getInspLists}">
											<option value="${item.codeCd}">${item.codeName}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>영업소명</th>
								<td>
									<select class="easyui-combobox" name="bizOfic" id="cBizOfic" data-options="width:200">
										<option value=""></option>
										<c:forEach var="item" items="${getCodeLists}">
											<c:if test="${item.CODE_GRUP eq 'BIZ_OFIC'}">
												<option value="${item.CODE_CD}">${item.CODE_NAME}</option>
											</c:if>
										</c:forEach>
									</select>
								</td>
								<th>대리점명</th>
								<td>
									<select class="easyui-combobox" name="agncOfic" id="cAgncOfic" data-options="width:200">
										<option value=""></option>
										<c:forEach var="item" items="${getCodeLists}">
											<c:if test="${item.CODE_GRUP eq 'AGNC_OFIC'}">
												<option value="${item.CODE_CD}">${item.CODE_NAME}</option>
											</c:if>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>고객성명</th>
								<td>
									<input class="easyui-textbox" name="custName" id="cCustName" value="" data-options="width:200"/>
								</td>
								<th>고객연락처</th>
								<td>
									<input class="easyui-textbox" name="custHp" id="cCustHp" value="" data-options="width:200"/>
								</td>
							</tr>
							<tr>
								<th>고객이메일</th>
								<td colspan="3">
									<input class="easyui-textbox" name="custEmail1" id="cCustEmail1" value="" data-options="width:200"/>&nbsp;@ 
									<input class="easyui-textbox" name="custEmail2" id="cCustEmail2" value="" data-options="width:297"/>
									<select class="easyui-combobox" id="cCustEmailChoice" data-options="width:202, panelHeight:120, onChange: function(){
											var value = $('#cCustEmailChoice').combobox('getValue');
											if(value == '직접입력'){
												$('#cCustEmail2').textbox('textbox').focus();
												$('#cCustEmail2').textbox('setValue', '');
											} else {
												$('#cCustEmail2').textbox('setValue', value);
											}
										}">
										<c:forEach var="item" items="${getCodeLists}">
											<c:if test="${item.CODE_GRUP eq 'MAIN_EMAIL'}">
												<option value="${item.CODE_NAME}">${item.CODE_NAME}</option>
											</c:if>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>고객주소</th>
								<td colspan="3">
									<input class="easyui-textbox" name="custAddr1" id="cCustAddr1" value="" data-options="width:516" readonly/>
									<input class="easyui-textbox" name="custAddr2" id="cCustAddr2" value="" data-options="width:185" prompt="상세 주소"/>
									<a onclick="javascript:addrSearch()">
										<i class="fa fa-search" aria-hidden="true" style="color: black; cursor: pointer"></i>
									</a>
								</td>
							</tr>
							<tr>
								<th>고객연령대</th>
								<td colspan="3">
									<select class="easyui-combobox" name="ageGrup" id="cAgeGrup" data-options="width:200">
										<option value=""></option>
										<c:forEach var="item" items="${getCodeLists}">
											<c:if test="${item.CODE_GRUP eq 'AGE_GRUP'}">
												<option value="${item.CODE_CD}">${item.CODE_NAME}</option>
											</c:if>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="4" style="padding: 0;">
									<div style="width: 95%; height: 1px; background: #ccc; margin: 10px 0;"></div>
								</td>
							</tr>
							<tr>
								<th>모델명</th>
								<td>
									<input class="easyui-textbox" name="modlName" id="cModlName" value="" data-options="width:200"/>
									<!-- <select class="easyui-combobox" name="modlName" id="cModlName" data-options="width:200, onChange:onChgModl">
										<option value=""></option>
										<c:forEach var="item" items="${getCodeLists}">
											<c:if test="${item.CODE_GRUP eq 'MODL_CODE'}">
												<option value="${item.CODE_CD}">${item.CODE_NAME}</option>
											</c:if>
										</c:forEach>
										<option value="ZZZ">기타</option>
									</select> -->
								</td>
								<!-- <th>
									<span id="cModlDiv" style="display:none;"><input class="easyui-textbox" name="modlEtc" id="cModlEtc" value="" data-options="width:90"/></span>
								</th> -->
								<th>차대번호</th>
								<td>
									<input class="easyui-textbox" name="vehiNum1" id="cVehiNum1" value="" data-options="width:93.5"/> /
									<input class="easyui-textbox" name="vehiNum2" id="cVehiNum2" value="" data-options="width:93.5"/>
								</td>
							</tr>
							<tr>
								<th>구입연도</th>
								<td>
									<select class="easyui-combobox" name="purcYear" ID="cPurcYear" data-options="width:200">
										<c:forEach var="item" items="${getPurcYearLists}">
											<option value="${item.CODE_CD}">${item.CODE_NAME}</option>
										</c:forEach>
									</select>
								</td>
								<th>사용시간</th>
								<td>
									<input class="easyui-textbox" name="usePeri" id="cUsePeri" value="" data-options="width:178"/>&nbsp;Hr
								</td>
							</tr>
							<tr>
								<th>구매형태</th>
								<td colspan="3">
									<table>
										<tr>
											<input type="hidden" value="" id="cPurcType" name="purcType"/>
											<c:forEach var ="item" items="${getCodeLists}">
												<c:if test="${item.CODE_GRUP eq 'PURC_TYPE'}">
													<c:set var="i" value="${i + 1}" />
													<td style="width: 120px;">
														<input onclick="fnChangePurcType(this)" type="checkbox" id="purcTypeList${i}" name="purcTypeList" value="${item.CODE_CD}"/>
										        		<label for="purcTypeList${i}" style="font-weight: 600; font-size: 13px;">${item.CODE_NAME}</label>
									        		</td>
									        	</c:if>
											</c:forEach>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<th>구매경로</th>
								<td colspan="3">
									<table>
										<tr>
											<input type="hidden" value="" id="cPurcPath" name="purcPath"/>
											<c:forEach var ="item" items="${getCodeLists}">
												<c:if test="${item.CODE_GRUP eq 'PURC_PATH'}">
													<c:set var="i" value="${i + 1}" />
													<td style="width: 120px;">
														<input onclick="fnChangePurcPath(this)" type="checkbox" id="purcPathList${i}" name="purcPathList" value="${item.CODE_CD}"/>
														<label for="purcPathList${i}" style="font-weight: 600; font-size: 13px;">${item.CODE_NAME}</label>
													</td>
									        	</c:if>
											</c:forEach>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<th>기타 사항</th>
								<td colspan="3">
									<textarea id="bascRemk" cols="80" style="border: 1px solid #ccc; border-radius: 4px; width: calc(100% - 46px);"></textarea>
								</td>
							</tr>
						</table>
						<div class="popup-button-wrap">
							<!-- <a href="javascript:void(0)" style="width: 80px; height: 26px;" class="easyui-linkbutton c6" id="img-open-button" data-item="BTN_009" data-options="disabled:${UPD}" >Picture</a>&nbsp;&nbsp;&nbsp; -->
							<a href="javascript:void(0)" style="width: 80px; height: 26px;" class="easyui-linkbutton c6" id="save-create-button" data-item="BTN_006" data-options="disabled:${UPD}" >저장</a>&nbsp;
							<a href="javascript:void(0)" style="width: 80px; height: 26px;" class="easyui-linkbutton c6" id="close-create-button" data-item="BTN_007">닫기</a>
							<a href="javascript:void(0)" style="width: 30px; height: 26px;" id="updown-button2" class="easyui-linkbutton c12">
								<i id="arrow-icon2" class="fa fa-arrow-circle-down fa-rotate-180 fa-lg"></i>
							</a>
						</div>
					</div>
					<div class="tab_menu">
						<input class="state" type="radio" title="tab-1" name="tabs-state" id="tab-1" checked />
						<input class="state" type="radio" title="tab-2" name="tabs-state" id="tab-2" />
						<input class="state" type="radio" title="tab-3" name="tabs-state" id="tab-3" />
						<input class="state" type="radio" title="tab-4" name="tabs-state" id="tab-4" />
						<input class="state" type="radio" title="tab-5" name="tabs-state" id="tab-5" />
						<div class="menu_tabs">
							<label id='tab-l1' for='tab-1'><i class=""></i> 진단 정보</label>
							<label id='tab-l2' for='tab-2'><i class=""></i> 영농 정보</label>
							<label id='tab-l3' for='tab-3'><i class=""></i> 보유 작업기</label>
							<label id='tab-l4' for='tab-4'><i class=""></i> 보유 트랙터</label>
						</div>
						<section class="menu_panel">
							<article id="tab_p1" class="panel active">
								<div class="darDiv">
									<table id="darTable" class="darTable">
										<thead>
											<tr>
												<th style="width:33%" colspan="3">점검 항목</th>
												<th style="width:3%">OK</th>
												<th style="width:3%">NG</th>
												<th style="width:27%">설명</th>
												<th style="width:31%">기타 사항</th>
												<th style="width:3%">첨부</th>
											</tr>
										</thead>
										<tbody id="darEvalTable">
										</tbody>
									</table>
								</div>
							</article>
							<article id="tab_p2" class="panel">
								<div class="darDiv">
									<table class="popup-search-table" style="margin:0px; width: 100%;">
										<colgroup>
											<col width="12%"/>
											<col width="88%"/>
										</colgroup>
										<tr>
											<th>영농 주체</th>
											<td>
												<input type="hidden" value="" id="cFarmEnty" name="farmEnty"/>
												<table>
													<tr>
														<c:forEach var ="item" items="${getCodeLists}">
															<c:if test="${item.CODE_GRUP eq 'FARM_ENTY'}">
																<c:set var="i" value="${i + 1}" />
																<td>
																	<input onclick="fnChangeFarmEnty(this)" type="checkbox" id="farmEntyList${i}" name="farmEntyList" value="${item.CODE_CD}"/>
																	<label for="farmEntyList${i}" style="font-weight: 600; font-size: 13px;">${item.CODE_NAME}</label>
																</td>
												        	</c:if>
														</c:forEach>
														<td style="width: auto;">
															<span style="font-weight: 600; font-size: 13px; padding-right: 5px;">기타</span>
															<input class="easyui-textbox" name="farmEtc" id="cFarmEtc" value="" data-options="width:455"/>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<th>영농 유형</th>
											<td>
												<input type="hidden" value="" id="cFarmType" name="farmType"/>
												<table>
													<tr>
														<c:forEach var ="item" items="${getCodeLists}">
															<c:if test="${item.CODE_GRUP eq 'FARM_TYPE'}">
																<c:set var="i" value="${i + 1}" />
																<td>
																	<input onclick="fnChangeFarmType(this)" type="checkbox" id="farmTypeList${i}" name="farmTypeList" value="${item.CODE_CD}"/>
																	<label for="farmTypeList${i}" style="font-weight: 600; font-size: 13px;">${item.CODE_NAME}</label>
												        		</td>
												        	</c:if>
														</c:forEach>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<th>주요 작업 <input type="hidden" id="cKeyWorkGrup" name="keyWorkGrup" value="KEY_WORK"/></th>
											<td>
												<table>
													<tr>
														<c:forEach var ="item" items="${getCodeLists}">
															<c:if test="${item.CODE_GRUP eq 'KEY_WORK'}">
																<td>
																	<c:set var="i" value="${i + 1}" />
																	<input type="hidden" id="keyWorkCode${i - 1}" name="keyWorkCode" data-name="${item.CODE_NAME}" value="${item.CODE_CD}"/>
																	<span style="font-weight: 600; font-size: 13px; padding-right: 5px;">${item.CODE_NAME}</span>
																	<input class="easyui-textbox" name="keyWorkSub" id="cKeyWork${i - 1}" value="" data-options="width:35"/>
																	<span style="font-weight: 600; font-size: 13px;">${item.CODE_DESC}</span>
																</td>
												        	</c:if>
														</c:forEach>
													</tr>
												</table>
												<!-- <input type="hidden" value="" id="c_keyWork" name="keyWork"/>
												<input onclick="fnChangeKeyWork(this)" style="display: inline-block; width: 13px;" type="checkbox" name="typeKey" id="key_A" value="A" />
												<span style="font-weight: 600; font-size: 13px; padding-right: 20px;">베일링</span>
												<input onclick="fnChangeKeyWork(this)" style="display: inline-block; width: 13px;" type="checkbox" name="typeKey" id="key_B" value="B" />
												<span style="font-weight: 600; font-size: 13px; padding-right: 20px;">로터리</span>
												<input onclick="fnChangeKeyWork(this)" style="display: inline-block; width: 13px;" type="checkbox" name="typeKey" id="key_C" value="C" />
												<span style="font-weight: 600; font-size: 13px; padding-right: 20px;">쟁기</span>
												<input onclick="fnChangeKeyWork(this)" style="display: inline-block; width: 13px;" type="checkbox" name="typeKey" id="key_D" value="D" />
												<span style="font-weight: 600; font-size: 13px; padding-right: 20px;">하우스</span>
												<input onclick="fnChangeKeyWork(this)" style="display: inline-block; width: 13px;" type="checkbox" name="typeKey" id="key_E" value="E" />
												<span style="font-weight: 600; font-size: 13px; padding-right: 20px;">밭 특용작물(인삼,고구마,양파,마늘)</span>
												<input onclick="fnChangeKeyWork(this)" style="display: inline-block; width: 13px;" type="checkbox" name="typeKey" id="key_Z" value="Z" />
												<span style="font-weight: 600; font-size: 13px; padding-right: 20px;">기타</span>
												<span id="cKeyDiv" style="display:none;"><input class="easyui-textbox" name="keyEtc" id="cKeyEtc" value="" style="width:150px;" /></span>
												 -->
											</td>
										</tr>
										<tr>
											<th>영농 형태 <input type="hidden" value="" id="cFarmFormGrup" name="farmFormGrup" value="${item.CODE_GRUP}"/></th>
											<td style="padding-right: 0;">
												<table>
													<tr class="width-auto">
														<c:forEach var ="item" items="${getCodeLists}">
															<c:if test="${item.CODE_GRUP eq 'FARM_FORM'}">
																<td>
																	<c:set var="i" value="${i + 1}" />
																	<span style="font-weight: 600; font-size: 13px; padding-right: 5px;">${item.CODE_NAME}</span>
																	<input class="easyui-textbox" name="farmFormSub" id="cFarmForm${i - 1}" value="" data-options="width:35"/>
																	<span style="font-weight: 600; font-size: 13px;">${item.CODE_DESC}</span>
																</td>
												        	</c:if>
														</c:forEach>
														<td style="width: auto;">
															<span style="font-weight: 600; font-size: 13px;">기타</span>
															<input class="easyui-textbox" name="farmForm" id="cFarmForm" value="" data-options="width:508"/>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<th rowspan="3">경작형태<input type="hidden" value="" id="cCultForm" name="cultForm"/></th>
											<td>
												<table>
													<tr>
														<th>1 모작</th>
														<c:forEach var ="item" items="${getCodeLists}">
															<c:if test="${item.CODE_GRUP eq 'CULT_FORM' && item.CODE_DESC eq '1'}">
																<c:set var="i" value="${i + 1}" />
																<td>
																	<input onclick="fnChangeCultForm(this)" type="checkbox" id="cultFormList${i}" name="cultFormList" value="${item.CODE_CD}"/>
																	<label for="cultFormList${i}" style="font-weight: 600; font-size: 13px;">${item.CODE_NAME}</label>
																</td>
												        	</c:if>
											        	</c:forEach>
													</tr>
												</table>
								        	</<td>
										</tr>
										<tr>
											<td>
												<table>
													<tr>
														<th>2 모작</th>
														<c:forEach var ="item" items="${getCodeLists}">
															<c:if test="${item.CODE_GRUP eq 'CULT_FORM' && item.CODE_DESC eq '2'}">
																<c:set var="i" value="${i + 1}" />
																<td>
																	<input onclick="fnChangeCultForm(this)" type="checkbox" id="cultFormList${i}" name="cultFormList" value="${item.CODE_CD}"/>
																	<label for="cultFormList${i}" style="font-weight: 600; font-size: 13px;">${item.CODE_NAME}</label>
																</td>
												        	</c:if>
											        	</c:forEach>
													</tr>
												</table>
								        	</<td>
										</tr>
										<tr>
											<td style="padding-right: 0;">
												<span style="font-weight: 600; font-size: 13px;">기타</span>
												<input class="easyui-textbox" name="cultEtc" id="cCultEtc" value="" data-options="width:948"/>
											</td>
										</tr>
										<tr>
											<th>연간 베일 생산</th>
											<td>
												<select class="easyui-combobox" name="analVeilProd" id="cAnalVeilProd" data-options="width:200,panelHeight:'auto'">
													<c:forEach var="item" items="${getCodeLists}">
														<c:if test="${item.CODE_GRUP eq 'ANAL_VEIL_PROD'}">
															<option value="${item.CODE_CD}">${item.CODE_NAME}</option>
														</c:if>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<th>농업 투입 비용(연간) <input type="hidden" value="" id="cFarmInpCostGrup" name="farmInpCostGrup" value="${item.CODE_GRUP}"/></th>
											<td style="padding-right: 0;">
												<table>
													<tr class="width-auto2">
														<c:forEach var ="item" items="${getCodeLists}">
															<c:if test="${item.CODE_GRUP eq 'FARM_INP_COST'}">
																<td style="width: 145px;">
																	<c:set var="i" value="${i + 1}" />
																	<span style="font-weight: 600; font-size: 13px; padding-right: 5px;">${item.CODE_NAME}</span>
																	<input class="easyui-textbox" name="farmInpCostSub" id="cFarmInpCost${i}" value="" data-options="width:60"/>
																	<span style="font-weight: 600; font-size: 13px;">${item.CODE_DESC}</span>
																</td>
												        	</c:if>
														</c:forEach>
														<td>
															<span style="font-weight: 600; font-size: 13px; padding-right: 5px;">기타</span>
															<input class="easyui-textbox" name="farmInpCost" id="cFarmInpCost" value="" data-options="width:218"/>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<th>기타 사항</th>
											<td colspan="3">
												<textarea id="farmRemk" style="border: 1px solid #ccc; border-radius: 4px; height: 100px; width: 974.6px;"></textarea>
											</td>
										</tr>
									</table>
								</div>
							</article>
							<article id="tab_p3" class="panel">
								<div class="darDiv">
									<table class="popup-search-table"  style="margin:0px; width: 100%;">
										<colgroup>
											<col width="11%"/>
											<col width="89%"/>
										</colgroup>
										<tr>
											<th rowspan="2">보유 작업기</th>
											<td>
												<input type="hidden" value="" id="cPossWork" name="possWork"/>
												<table>
													<tr class="width-auto3">
														<c:forEach var ="item" items="${getCodeLists}">
															<c:if test="${item.CODE_GRUP eq 'POSS_WORK'}">
																<c:set var="i" value="${i + 1}" />
																<td>
																	<input onclick="fnChangePossWork(this)" type="checkbox" id="possWorkList${i}" name="possWorkList" value="${item.CODE_CD}"/>
																	<label for="possWorkList${i}" style="font-weight: 600; font-size: 13px;">${item.CODE_NAME}</label>
																</td>
												        	</c:if>
														</c:forEach>
													</tr>
												</table>
											</td>
											<!-- <td colspan="5">
												<input class="easyui-textbox" name="possWork" id="cPossWork" value="" style="width:610px;" readonly data-options="prompt:'MC F5600 1대, Welger 3135  1대, 로타리 WR 280 RFW  2대'" />
												<a onclick="javascript:doOpenPossTrac('work')"> <i class="fa fa-pencil g-mr-5" style="cursor: pointer; color:black;" aria-hidden="true"></i> </a>
											</td>  -->
										</tr>
										<tr>
											<td style="width: auto;">
												<span style="font-weight: 600; font-size: 13px; padding-right: 5px;">기타</span>
												<input class="easyui-textbox" name="possWorkEtc" id="cPossWorkEtc" value="" data-options="width:952"/>
											</td>
										</tr>
										<tr>
											<th>축산 작업기</th>
											<td>
												<input type="hidden" value="" id="cAnmlWork" name="anmlWork"/>
												<table>
													<tr class="width-auto4">
														<c:forEach var ="item" items="${getCodeLists}">
															<c:if test="${item.CODE_GRUP eq 'ANML_WORK'}">
																<c:set var="i" value="${i + 1}" />
																<td>
																	<input onclick="fnChangeAnmlWork(this)" type="checkbox" id="anmlWorkList${i}" name="anmlWorkList" value="${item.CODE_CD}"/>
																	<label for="anmlWorkList${i}" style="font-weight: 600; font-size: 13px;">${item.CODE_NAME}</label>
																</td>
												        	</c:if>
														</c:forEach>
														<td style="width: auto !important;">
															<span style="font-weight: 600; font-size: 13px; padding-right: 5px;">기타</span>
															<input class="easyui-textbox" name="anmlWorkEtc" id="cAnmlWorkEtc" value="" data-options="width:462"/>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<th>기타 사항</th>
											<td colspan="3">
												<textarea id="workRemk" style="border: 1px solid #ccc; border-radius: 4px; height: 144px; width: 985px;"></textarea>
											</td>
										</tr>
									</table>
								</div>
							</article>
							<article id="tab_p4" class="panel">
								<div class="darDiv">
									<table class="popup-search-table tractor-list" style="margin:0px; width: 100%;">
										<colgroup>
											<col width="5.5%">
											<col width="19.5%">
											<col width="5.5%">
											<col width="19.5%">
											<col width="5.5%">
											<col width="19.5%">
											<col width="5.5%">
											<col width="19.5%">
											<col width="1%">
										</colgroup>
										<tr>
											<th colspan="9">트랙터</th>
										</tr>
									 	<c:forEach var="trac" items="${getCodeLists}" begin="0" end="9" varStatus="st">
									 		<c:set var="i" value="${st.index + 1}" />
									 		<c:choose>
									 			<c:when test="${st.index eq '0'}">
										 			<tr>
														<th>제조사</th>
														<td>
															<input class="easyui-textbox" name="madeTrac" id="cMadeTrac" value="" data-options="width:180"/>
														</td>
														<th>모델</th>
														<td>
															<input class="easyui-textbox" name="modlTrac" id="cModlTrac" value="" data-options="width:180"/>
														</td>
														<th>마력</th>
														<td>
															<input class="easyui-textbox" name="horsepower" id="cHorsepower" value="" data-options="width:180"/>
														</td>
														<th>구입연도</th>
														<td>
															<select class="easyui-combobox" name="purcYearTrac" id="cPurcYearTrac" data-options="width:175">
																<c:forEach var="item" items="${getPurcYearLists}">
																	<option value="${item.CODE_CD}">${item.CODE_NAME}</option>
																</c:forEach>
															</select>
														</td>
														<td style="position: relative;">
															<a href="javascript:addTractor(${i})" class="addBtnDesign">
																<i class="fa fa-plus-circle" aria-hidden="true"></i>
															</a>
														</td>
													</tr>
										 		</c:when>
										 		<c:otherwise>
										 			<tr class="hide">
														<th>제조사</th>
														<td>
															<input class="easyui-textbox" name="madeTrac" id="cMadeTrac" value="" data-options="width:140"/>
														</td>
														<th>모델</th>
														<td>
															<input class="easyui-textbox" name="modlTrac" id="cModlTrac" value="" data-options="width:140"/>
														</td>
														<th>마력</th>
														<td>
															<input class="easyui-textbox" name="horsepower" id="cHorsepower" value="" data-options="width:140"/>
														</td>
														<th>구입연도</th>
														<td>
															<select class="easyui-combobox" name="purcYearTrac" id="cPurcYearTrac" data-options="width:150">
																<c:forEach var="item" items="${getPurcYearLists}">
																	<option value="${item.CODE_CD}">${item.CODE_NAME}</option>
																</c:forEach>
															</select>
														</td>
														<td style="position: relative;">
															<a href="javascript:addTractor(${i})" class="addBtnDesign">
																<i class="fa fa-plus-circle" aria-hidden="true"></i>
															</a>
														</td>
													</tr>
										 		</c:otherwise>
									 		</c:choose>
									 	</c:forEach>
									</table>
									<table class="popup-search-table" style="margin-top: 10px; margin-bottom: 0; width: 100%; border-top: 1px solid #ccc; padding-top: 5px;">
										<colgroup>
											<col width="14%"/>
											<col width="26%"/>
											<col width="14%"/>
											<col width="50%"/>
										</colgroup>
										<tr>
											<th colspan="9">주 사용 트랙터</th>
										</tr>
										<tr>
											<th>모델</th>
											<td>
												<input class="easyui-textbox" name="mainTracModl" id="cMainTracModl" value="" data-options="width:183"/>
											</td>
											<th>주요 작업</th>
											<td>
												<input class="easyui-textbox" name="mainTracWork" id="cMainTracWork" value="" data-options="width:770"/>
											</td>
										</tr>
									</table>
									<table class="popup-search-table" style="margin-top: 10px; margin-bottom: 0; width: 100%; border-top: 1px solid #ccc; padding-top: 5px;">
										<colgroup>
											<col width="100%"/>
										</colgroup>
										<tr>
											<th>기타 사항</th>
										</tr>
										<tr>
											<td>
												<textarea id="tracRemk" style="border: 1px solid #ccc; border-radius: 4px; height: 97px; width: 1111px;"></textarea>
											</td>
										</tr>
									</table>
								</div>
							</article>
						</section>
					</div>
				</div>
		   	</fieldset>
		</div>
		<div data-options="region:'south',border:false" style="height:100px;">
			<div class="popup-bottom-areaBackground" style="margin-bottom:10px;height:1px;"></div>
			<span style="padding-left:25px;font-weight:bold;">본 서비스는 뉴홀랜드 전문 서비스 센터 개업기념으로 고객의 제품상태를 진단하여  기본적인 예방보전 서비스를 무상으로 제공받고</span><br/>
			<span style="padding-left:25px;font-weight:bold;">그 진단결과에 대해 서비스 담당으로부터 충분한 설명을 들었습니다.    상기의 진단결과 및 개인정보 수집에 동의 합니다</span><br/>
			<span style="padding-left:25px;font-weight:bold;">개인정보 수집에 동의 합니다 <input style="display: inline-block; width: 13px;" type="checkbox" name="infoAgre" id="cInfoAgre" /></span><br/>
			<span style="padding-left:25px;font-weight:bold;">(서비스)점검자 &nbsp;&nbsp;<input class="easyui-textbox" name="cherSign" id="cCherSign" value="" style="width:100px;" />
			<a href="javascript:void(0)" style="width: 80px; height: 26px;" class="easyui-linkbutton c6" id="cher-sign-button" data-item="BTN_011" data-options="disabled:${INS}" >서명</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고객명 &nbsp;&nbsp;<input class="easyui-textbox" name="custSign" id="cCustSign" value="" style="width:100px;" />
			<a href="javascript:void(0)" style="width: 80px; height: 26px;" class="easyui-linkbutton c6" id="cust-sign-button" data-item="BTN_012" data-options="disabled:${INS}" >서명</a></span>
		</div>
	</div>
</div>

<div id="possTrac-dialog" class="wui-dialog" style="overflow:auto;height:600px;border-top-width:1px;text-align:center;display:none">	
	<div id="possTracTable" style="padding:10px 20px;height:145px;overflow:auto;">
	</div>
	<div style="width:100%; display: inline-block; margin-top: 5px; text-align: center;">
		<a href="javascript:doPossTrac()" class="easyui-linkbutton c6" data-item="BTN_009" >확인</a>&nbsp;&nbsp;&nbsp;
 		<a href="javascript:doClose2()" class="easyui-linkbutton c6" data-item="BTN_010" data-options="width:100">취소</a>
   </div>
</div>

<div id="sign-dialog" class="wui-dialog" style="border-top-width:1px; display:none;">
	<div id="working-popup3" style="display:none;">
	    <%-- <br></br>
	    <center><img src="<%=request.getContextPath() %>/resources/images/ajax_loader_red_48.gif"/></center> --%>
	    <div class="loadingBox">
		    <div class="dim"></div>
		    <div class="circle"></div>
		</div>
	</div>
	<div class="easyui-layout"  data-options="fit:true">
		<div data-options="region:'center',border:false" style="overflow: auto;">
			<input type="hidden" id="cSignType" name="signType" value="" />
			<div style="text-align: center;">
				<canvas id="canvas" style="background-color:aliceblue" width="500" height="200"></canvas>
			</div>
		</div>
		<div data-options="region:'south',border:false" style="height:60px;text-align:center;">
			<div class="popup-bottom-areaBackground" style="margin-bottom:13px;height:1px;"></div>
			<table class="popup-bottom-areaTable">
				<tr>
					<a href="javascript:void(0)" class="easyui-linkbutton c6" id="save-sign-button" data-item="BTN_007" data-options="disabled:${UPD}" >저장</a>&nbsp;&nbsp;&nbsp;
					<a href="javascript:void(0)" class="easyui-linkbutton c6" id="close-sign-button" data-item="BTN_008">취소</a>
				</tr>
			</table>
		</div>
	</div>
</div>

<div id="file-dialog" class="wui-dialog" style="overflow:scroll;height:850px;border-top-width:1px;display:none">
	<div data-options="region:'center',border:false">
		<div  style="height: 25px;">
	        <table cellpadding="5" class="search-table tableSearch-c">
	        	<thead>
		            <tr>
						<th class="h table-Search-h"><span data-item="LAB_008"> </span></th>
					</tr>
				</thead>
	        </table>
		</div>
		<div>
			<form id="search-form2" method="post" enctype="multipart/form-data">
				<input type="hidden" id="h_codeCd" name="codeCd" value="" />
				<input type="hidden" id="h_codeGrup" name="codeGrup" value="" />
				<input type="hidden" id="h_atchGrup" name="atchGrup" value="AF" />
				<input type="hidden" id="h_atchNo" name="atchNo" value="" />
				<input type="hidden" id="h_oper" name="oper" value="I" />
		        <table cellpadding="5" class="search-table tableSearch-c" style="margin-left:12px;">
			        <tr>
						<th class="d">
							<span class="textbox"style="width: 100%;">
								<input class="easyui-filebox" name="excelFile" id="s_excelFile" style="width:300px"/>
								<span id="upload-frame"></span>
							</span>
						</td>
				    </tr>
		        </table>
	        </form>
	   </div>
		   <div style="text-align: center; margin-top: 25px;">
		   		<a href="javascript:void(0)" style="margin-right: 5px;" class="easyui-linkbutton c6" id="save-file-button" data-item="BTN_009">저장</a>
		 		<a href="javascript:void(0)" class="easyui-linkbutton c6" id="close-file-button" data-item="BTN_010" data-options="width:100">취소</a>
		   </div>
	</div>
</div>

<!-- Image 팝업 -->
<div id="image-dialog" class="wui-dialog" style="border-top-width:1px; display:none;">
	<div id="working-popup2" style="display:none;">
	    <br></br>
	    <%-- <center><img src="<%=request.getContextPath() %>/resources/images/ajax_loader_red_48.gif"/></center> --%>
	    <div class="loadingBox">
		    <div class="dim"></div>
		    <div class="circle"></div>
		</div>
	</div>
	<div class="easyui-layout"  data-options="fit:true">
		<div data-options="region:'center',border:false" style="text-align:center;overflow:auto;">
			<fieldset class="div-line-new" style="height:auto;margin:0">
				<div>
					<table  style="margin-left: 40px;margin-right: 40px;">
						<tr>
							<td><input type="file" style="width:179px;" name="uploadImg1" id="uploadImg1" onchange="setCanvImg(this.id)" /></td>
							<td><input type="file" style="width:179px;" name="uploadImg2" id="uploadImg2" onchange="setCanvImg(this.id)" /></td>
							<td><input type="file" style="width:179px;" name="uploadImg3" id="uploadImg3" onchange="setCanvImg(this.id)" /></td>
						</tr>
						<tr>
							<td style="width:33%; position: relative;"><canvas id="canvas1" style="background-color:aliceblue" width="171" height="256" onclick = "javascript:popupImage(this.id);"></canvas>
								<span id="imgCloseBtn1" style="position:absolute; top: 0px; right: 10px; font-size: 22px; z-index: 5; display: none;">
									<a href="javascript:deleteImg(1)"><i class="fa fa-times"></i></a>
								</span>
							</td>
							<td style="width:33%; position: relative;"><canvas id="canvas2" style="background-color:aliceblue" width="171" height="256" onclick = "javascript:popupImage(this.id);"></canvas>
								<span id="imgCloseBtn2" style="position:absolute; top: 0px; right: 10px; font-size: 22px; z-index: 5; display: none;">
									<a href="javascript:deleteImg(2)"><i class="fa fa-times"></i></a>
								</span>
							</td>
							<td style="width:33%; position: relative;"><canvas id="canvas3" style="background-color:aliceblue" width="171" height="256" onclick = "javascript:popupImage(this.id);"></canvas>
								<span id="imgCloseBtn3" style="position:absolute; top: 0px; right: 10px; font-size: 22px; z-index: 5; display: none;">
									<a href="javascript:deleteImg(3)"><i class="fa fa-times"></i></a>
								</span>
							</td>
						</tr>
						<!-- <tr>
							<td><input type="file" style="width:179px;" name="uploadImg4" id="uploadImg4" onchange="setCanvImg(this.id)" /></td>
							<td><input type="file" style="width:179px;" name="uploadImg5" id="uploadImg5" onchange="setCanvImg(this.id)" /></td>
							<td><input type="file" style="width:179px;" name="uploadImg6" id="uploadImg6" onchange="setCanvImg(this.id)" /></td>
						</tr>
						<tr>
							<td style="width:33%; position: relative;"><canvas id="canvas4" style="background-color:aliceblue" width="171" height="256" onclick = "javascript:popupImage(this.id);"></canvas>
								<span id="imgCloseBtn4" style="position:absolute; top: 0px; right: 10px; font-size: 22px; z-index: 5; display: none;">
									<a href="javascript:deleteImg(4)"><i class="fa fa-times"></i></a>
								</span>
							</td>
							<td style="width:33%; position: relative;"><canvas id="canvas5" style="background-color:aliceblue" width="171" height="256" onclick = "javascript:popupImage(this.id);"></canvas>
								<span id="imgCloseBtn5" style="position:absolute; top: 0px; right: 10px; font-size: 22px; z-index: 5; display: none;">
									<a href="javascript:deleteImg(5)"><i class="fa fa-times"></i></a>
								</span>
							</td>
							<td style="width:33%; position: relative;"><canvas id="canvas6" style="background-color:aliceblue" width="171" height="256" onclick = "javascript:popupImage(this.id);"></canvas>
								<span id="imgCloseBtn6" style="position:absolute; top: 0px; right: 10px; font-size: 22px; z-index: 5; display: none;">
									<a href="javascript:deleteImg(6)"><i class="fa fa-times"></i></a>
								</span>
							</td>
						</tr>
						<tr>
							<td><input type="file" style="width:179px;" name="uploadImg7" id="uploadImg7" onchange="setCanvImg(this.id)" /></td>
							<td><input type="file" style="width:179px;" name="uploadImg8" id="uploadImg8" onchange="setCanvImg(this.id)" /></td>
							<td><input type="file" style="width:179px;" name="uploadImg9" id="uploadImg9" onchange="setCanvImg(this.id)" /></td>
						</tr>
						<tr>
							<td style="width:33%; position: relative;"><canvas id="canvas7" style="background-color:aliceblue" width="171" height="256" onclick = "javascript:popupImage(this.id);"></canvas>
								<span id="imgCloseBtn7" style="position:absolute; top: 0px; right: 10px; font-size: 22px; z-index: 5; display: none;">
									<a href="javascript:deleteImg(7)"><i class="fa fa-times"></i></a>
								</span>
							</td>
							<td style="width:33%; position: relative;"><canvas id="canvas8" style="background-color:aliceblue" width="171" height="256" onclick = "javascript:popupImage(this.id);"></canvas>
								<span id="imgCloseBtn8" style="position:absolute; top: 0px; right: 10px; font-size: 22px; z-index: 5; display: none;">
									<a href="javascript:deleteImg(8)"><i class="fa fa-times"></i></a>
								</span>
							</td>
							<td style="width:33%; position: relative;"><canvas id="canvas9" style="background-color:aliceblue" width="171" height="256" onclick = "javascript:popupImage(this.id);"></canvas>
								<span id="imgCloseBtn9" style="position:absolute; top: 0px; right: 10px; font-size: 22px; z-index: 5; display: none;">
									<a href="javascript:deleteImg(9)"><i class="fa fa-times"></i></a>
								</span>
							</td>
						</tr>
						<tr>
							<td><input type="file" style="width:179px;" name="uploadImg10" id="uploadImg10" onchange="setCanvImg(this.id)" /></td>
							<td><input type="file" style="width:179px;" name="uploadImg11" id="uploadImg11" onchange="setCanvImg(this.id)" /></td>
							<td><input type="file" style="width:179px;" name="uploadImg12" id="uploadImg12" onchange="setCanvImg(this.id)" /></td>
						</tr>
						<tr>
							<td style="width:33%; position: relative;"><canvas id="canvas10" style="background-color:aliceblue" width="171" height="256" onclick = "javascript:popupImage(this.id);"></canvas>
								<span id="imgCloseBtn10" style="position:absolute; top: 0px; right: 10px; font-size: 22px; z-index: 5; display: none;">
									<a href="javascript:deleteImg(10)"><i class="fa fa-times"></i></a>
								</span>
							</td>
							<td style="width:33%; position: relative;"><canvas id="canvas11" style="background-color:aliceblue" width="171" height="256" onclick = "javascript:popupImage(this.id);"></canvas>
								<span id="imgCloseBtn11" style="position:absolute; top: 0px; right: 10px; font-size: 22px; z-index: 5; display: none;">
									<a href="javascript:deleteImg(11)"><i class="fa fa-times"></i></a>
								</span>
							</td>
							<td style="width:33%; position: relative;"><canvas id="canvas12" style="background-color:aliceblue" width="171" height="256" onclick = "javascript:popupImage(this.id);"></canvas>
								<span id="imgCloseBtn12" style="position:absolute; top: 0px; right: 10px; font-size: 22px; z-index: 5; display: none;">
									<a href="javascript:deleteImg(12)"><i class="fa fa-times"></i></a>
								</span>
							</td>
						</tr> -->
					</table>
				</div>
		   	</fieldset>
		</div>
		<div data-options="region:'south',border:false" style="height:60px;text-align:center;">
			<div class="popup-bottom-areaBackground" style="margin-bottom:13px;height:1px;"></div>
			<table class="popup-bottom-areaTable">
				<tr>
					<a href="javascript:void(0)" class="easyui-linkbutton c6" id="save-image-button" data-item="BTN_010" data-options="disabled:${INS}" >저장</a>&nbsp;&nbsp;&nbsp;
					<a href="javascript:void(0)" class="easyui-linkbutton c6" id="close-image-button" data-item="BTN_011">취소</a>
				</tr>
			</table>
		</div>
	</div>
</div>

<!-- 엑셀  진행상태 -->
<div id="progress-popup" class="wui-dialog" style="display:none">
    <br></br>
    <%-- <center><img src="<%=request.getContextPath() %>/resources/images/ajax_loader_red_48.gif"/></center> --%>
    <div class="loadingBox">
	    <div class="dim"></div>
	    <div class="circle"></div>
	</div>
</div>

<!-- 이미지 상세 -->
<div id="image-popup" class="wui-dialog" style="display:none">
    <center><img id="imgDetl" src=""></img></center>
</div>

<!-- 이미지 임시 -->
<div id="temp-popup" style="display:none">
	<canvas id="imgTemp0" width="513" height="770"></canvas>
	<canvas id="imgTemp1" width="513" height="770"></canvas>
	<canvas id="imgTemp2" width="513" height="770"></canvas>
	<canvas id="imgTemp3" width="513" height="770"></canvas>
	<canvas id="imgTemp4" width="513" height="770"></canvas>
	<canvas id="imgTemp5" width="513" height="770"></canvas>
	<canvas id="imgTemp6" width="513" height="770"></canvas>
	<canvas id="imgTemp7" width="513" height="770"></canvas>
	<canvas id="imgTemp8" width="513" height="770"></canvas>
	<canvas id="imgTemp9" width="513" height="770"></canvas>
	<canvas id="imgTemp10" width="513" height="770"></canvas>
	<canvas id="imgTemp11" width="513" height="770"></canvas>
	
	
</div>

<!-- 업로드  진행상태 -->
<div id="progress-popup2" class="wui-dialog" style="display:none">
    <br></br>
    <center><img src="<%=request.getContextPath() %>/resources/images/ajax_loader_red_48.gif"></img></center>
</div>

<!-- BODY 하단 INCLUDE -->
<%@ include file="/WEB-INF/views/include/body.foot.jsp" %>




</html>