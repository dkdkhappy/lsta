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
<!-- BUSINESS JAVASCRIPT -->
<script type="text/javascript">
	/*  doInit({
		domain: '<spring:eval expression="@app['domain.user']"/>'
	}); */
</script>
<script type="text/javascript" src="<c:url value="/resources/js/dealer/newdealercreate.js?v=1129B" />"></script>
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

::-webkit-scrollbar{width: 15px !important;}
::-webkit-scrollbar-track {background-color:#f1f1f1 !important;}
::-webkit-scrollbar-thumb {background-color:#e0e0e0;border-radius: 10px !important;}

input {padding-right: 10px; border:none;}
.div-line-new-sub{ border-bottom: 0px; box-shadow: 0 0px 0px rgba(0,0,0,0.0);}
.panel{ box-shadow: 0 0px 0px rgba(0,0,0,0); }
.popup-search-table th,td{ padding: 2px; }

.textbox .textbox-text{font-size: 16px !important;}
.l-btn-text {font-size: 15px; font-weight:500 !important;}
.popup-search-table th, td{padding: 3px 6px 3px 6px;}
.popup-search-table th, td:first-of-type {padding-right: 30px;}
.search-label-h {
    width: 7%;
    min-width: 100px;
}

/* #detail {color: black; border-color: #9c9c9c; background: #cbc7bd; border-radius: 3px !important;} */
/* #detail:hover {color: #ffffff; border-color: #9c9c9c; background: #878787;} */

#cart_body_option{
    padding: 0px; 
    height: 85%;
	margin-bottom: 15px;
    overflow-y: auto;
}
#appl_list_body td {
   border-top: none !important;
}
#appl_list_body:first-of-type td {
   border-top: 1px solid #e9dede !important;
}

#borderstyle {border-top: 1px solid #c7c7c7;}

.td-width tr td{
	width: 0%;
} 
.tableSearch-c {
    margin-top: -4px;
    margin-bottom: 1px;
}
.tbl_100 {width: calc(100% - 10px);}
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
/*     border-bottom: 1px solid black; */
    border-radius: 0px;
    box-shadow: none;
}
:focus-visible {outline: none;}

span.textbox.combo {
	margin-right: -30px !important;
}

/* 221118 양윤지 추가 */
.dealer-status-bar {
	position: relative;
	margin: 30px auto 40px;
	border-top: 2px solid #0070c0;
	border-bottom: 2px solid #0070c0;
	padding: 30px 0 10px 0;
	background: #f2f2f2;
}
.dealer-status-bar::before {
	content: '';
	display: block;
	width: 89%;
	height: 4px;
	background: #acacac;
	margin: 0 auto;
}
.dealer-status-text {
	width: 100%;
	display: flex;
}
.dealer-status-text p {
	font-size: 16px;
	text-align: center;
	width: calc(100% / 8);
	letter-spacing: -0.5px;
	padding-top: 20px;
	position: relative;
	margin: 0;
}
.dealer-status-color {
	display: block;
	position: absolute;
	background-color: #fff;
	width: 25px;
	height: 25px;
	border: 3px solid #acacac;
	top: -15px;
	left: 50%;
	border-radius: 50%;
	transform: translate(-50%, 0);
}
.newdealer-guide {
	font-size: 17px;
	font-weight: bold;
	padding-left: 10px;
	margin-bottom: 0;
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
	<input type="hidden" name="gsUserType" id="gsUserType" value="${gsUserType}" />
	<input type="hidden" name="showYn" id="showYn" value="${showYn}" />
	<input type="hidden" name="applStat" id="r_applStat" value="${appl_stat.APPL_STAT}" />
	<input type="hidden" name="gsSpcAuthCode" id="gsSpcAuthCode" value="${gsSpcAuthCode}" />
	<input type="hidden" name="gsUserId" id="gsUserId" value="${gsUserId}" />
	<input type="hidden" name="regnYn" id="regnYn" value="${getRegnBmYn}" />
	<div style="width:1565px; margin-left: 155px;">
	
	<div class="wp-70 dealer-status-bar">
		<div class="dealer-status-text">
			<p>
				<input type="hidden" value="" class="dealer-status-icon"/>
				<span class="dealer-status-color"></span>
				<span class="dealer-status-texts">Create<br /> Application</span>
			</p>
			<p>
				<input type="hidden" value="" class="dealer-status-icon"/>
				<span class="dealer-status-color"></span>
				<span class="dealer-status-texts">Fill out the<br /> Application</span>
			</p>
			<p>
				<input type="hidden" value="" class="dealer-status-icon"/>
				<span class="dealer-status-color"></span>
				<span class="dealer-status-texts">Pre-application<br /> review</span>
			</p>
			<p>
				<input type="hidden" value="" class="dealer-status-icon"/>
				<span class="dealer-status-color"></span>
				<span class="dealer-status-texts">Pre-application<br /> approval</span>
			</p>
			<p>
				<input type="hidden" value="" class="dealer-status-icon"/>
				<span class="dealer-status-color"></span>
				<span class="dealer-status-texts">Fill out the<br /> Regular-application</span>
			</p>
			<p>
				<input type="hidden" value="" class="dealer-status-icon"/>
				<span class="dealer-status-color"></span>
				<span class="dealer-status-texts">Regular-application<br /> review</span>
			</p>
			<p>
				<input type="hidden" value="" class="dealer-status-icon"/>
				<span class="dealer-status-color"></span>
				<span class="dealer-status-texts">Regular-application<br /> approval</span>
			</p>
			<p>
				<input type="hidden" value="" class="dealer-status-icon"/>
				<span class="dealer-status-color"></span>
				<span class="dealer-status-texts">Complete</span>
			</p>
		</div>
	</div>
	
	<div id="search-toolbar" class="wui-toolbar" style="width: 70%;margin-left: 15%;">
		<form id="search-form">
			<div class="div-new"  style="text-align: center;padding-bottom: 20px;">
		        <table cellpadding="5" class="search-table tableSearch-c wp-70" style="min-width: 1200px;">
					<tr><span class="subTitIcon" style="font-weight: bold; font-size: 20px; color: #0070c0;">New Dealer Application</span>
	        	</table>
		   </div>
		</form>
	</div>
	
	<div class="wp-70" id="detail_contents" style="margin: 0 auto 10px;">
		<div id="subAccn1" style="text-align: left;">
		<table id="bold" class="tbl_100">
			<tr>
				<td style="background: #f2f2f2; border:1px solid #c7c7c7; width:28%;">
				    <span data-item="LAB_007">Dealership ( Legal Name )</span>
				</td>
				<td style="border-bottom:1px solid #c7c7c7;border-top: 1px solid #c7c7c7;" colspan="3">
					<input type="easyui-textbox" style="width:100%;" name="DealNm" id="DealNm" value=""/>
				</td>
			</tr>
			<tr>
				<td id="bold" style="background: #f2f2f2; border:1px solid #c7c7c7;">
				    <span data-item="LAB_007">Application Type</span>
				</td>
				<td style="border-bottom:1px solid #c7c7c7;border-top: 1px solid #c7c7c7; color:red;">
					<select class="easyui-combobox" name="ApplType" ID="ApplType" data-options="width:340, height: 26, panelHeight:'auto'" readonly>
						<c:forEach var="item" items="${getApplType}">
							<option value="${item.CODE_CD}">${item.CODE_NAME}</option>
						</c:forEach>
					</select>
				</td> 
					<td style="background: #f2f2f2; border:1px solid #c7c7c7; text-align: center; width:11%;">
					    <span data-item="LAB_007">Country</span>
					</td>
					<td style="border-bottom:1px solid #c7c7c7;border-top: 1px solid #c7c7c7;">
					<select class="easyui-combobox" name="ApplCnty" ID="ApplCnty" data-options="width:340, height: 26, panelHeight:'auto'">
						<c:forEach var="item" items="${getCodeLists}">
							<c:if test="${item.CODE_GRUP eq 'CNTY_CODE' }">
								<option value="${item.CODE_CD}">${item.CODE_CD}</option>
							</c:if>
						</c:forEach>
					</select>
					</td>
			</tr>
			<tr>
				<td style="background: #f2f2f2; border:1px solid #c7c7c7;">
				    <span data-item="LAB_007">DBA ( if applicable )</span>
				</td>
				<td style="border-bottom:1px solid #c7c7c7;border-top: 1px solid #c7c7c7;" colspan="3">
					<input type="easyui-textbox" style="width:100%;" name="ApplDba" id="ApplDba" value="">
				</td>
			</tr>
			<tr>
				<td style="background: #f2f2f2; border:1px solid #c7c7c7;">
				    <span data-item="LAB_007">Business Manager</span>
				</td>
				<td id="bold" style="border-bottom:1px solid #c7c7c7;border-top: 1px solid #c7c7c7;" colspan="3">
					<c:if test="${gsOrgAuthCode eq 'BM'}">
						 <select class="easyui-combobox" name="ApplBm" id="ApplBm" style="width: 805px; height: 24px;" readOnly>
                           <option value="${gsUserId}">${gsUserId}</option>
                           	<c:forEach var="item" items="${getBmList}">
                                  <option value="${item.USER_ID}">${item.USER_ID}</option>
                            </c:forEach>
                       </select>
                    </c:if>
	              	<c:if  test="${gsOrgAuthCode ne 'BM'}">
                     <select class="easyui-combobox" name="ApplBm" id="ApplBm" style="width: 805px; height: 24px;">
                           <option value=""></option>
                           <c:forEach var ="item" items="${getBmList}">
                               <option value="${item.USER_ID}">${item.USER_ID}</option>
                           </c:forEach>
                       </select>
                     </c:if>
				</td>
			</tr>
			<tr>
				<td style="background: #f2f2f2; border:1px solid #c7c7c7;">
				    <span data-item="LAB_007">Application Date</span>
				</td>
				<td id="bold" style="border-bottom:1px solid #c7c7c7;border-top: 1px solid #c7c7c7;" colspan="3">
					<input class="easyui-datebox datebox-f combo-f textbox-f" value="${nowTo}" style=" display: none; width: 805px" id="ApplDate" name="ApplDate"/>
				</td>
			</tr>
			<tr>
				<td style="background: #f2f2f2; border:1px solid #c7c7c7;">
				    <span data-item="LAB_007">E-Mail (Real Contact Email)</span>
				</td>
				<td style="border-bottom:1px solid #c7c7c7;border-top: 1px solid #c7c7c7;" colspan="3">
					<input type="easyui-textbox" style="width:100%;" name="ApplMail" id="ApplMail" value=""/>
				</td>
			</tr>
			<tr>
				<td style="background: #f2f2f2; border:1px solid #c7c7c7;">
				    <span data-item="LAB_007">Temporary ID</span>
				</td>
				<td style="border-bottom:1px solid #c7c7c7;border-top: 1px solid #c7c7c7;">
					<input type="easyui-textbox" style="width:50%;" name="TempId" id="TempId" value="${tempId}"/>
				</td>
				<td id= "append">
					<a href="javascript:void(0)" style="width: 80px; height: 22px; margin-left: -350px;" id="append-button" class="easyui-linkbutton cgray" data-item="BTN_001" data-options="">Create ID</a>
				</td>
				<c:if test="${appl_stat.APPL_STAT eq '400' || appl_stat.APPL_STAT eq '500' || appl_stat.APPL_STAT eq '600'}">
					<td style="background: #f2f2f2; border:1px solid #c7c7c7; text-align: center;">
					    <span data-item="LAB_007">Dealer Code</span>
					</td>
					<td style="border-bottom:1px solid #c7c7c7;border-top: 1px solid #c7c7c7;">
						<input type="easyui-textbox" style="width:250px;" name="dealCode" id="dealCode" value="" readonly/>
					</td>
				</c:if>
			</tr>
			<tr>
				<td style="background: #f2f2f2; border:1px solid #c7c7c7;">
				    <span data-item="LAB_007">Status</span>
				</td>
			 <c:if test="${appl_stat.APPL_STAT eq '600'}">
				<td style="border-bottom:1px solid #c7c7c7;border-top: 1px solid #c7c7c7;" colspan="3">
					<input type="easyui-textbox" style="width:100%; color:red;" name="ApplStat" id="ApplStat" value="Approved" readonly/>
				</td>
			 </c:if>
			 <c:if test="${appl_stat.APPL_STAT ne '600'}">
				<td style="border-bottom:1px solid #c7c7c7;border-top: 1px solid #c7c7c7;" colspan="3">
					<input type="easyui-textbox" style="width:100%;" name="ApplStat" id="ApplStat" value="Create" readonly/>
				</td>
			 </c:if>
			</tr>
		</table>
		<div data-options="region:'south',border:false" style="height:80px;text-align:center;">
			<div class="popup-bottom-areaBackground" style="margin-bottom:13px;height:0px;background: none;"></div>
			<table class="popup-bottom-areaTable">
				<tr>
					<td class="h" style="width: fit-content;  margin: auto; display: block; padding: 5px;">
					    <a href="javascript:void(0)" style="width:230px;font-size:15px" class="easyui-linkbutton c6" id="create-button" data-item="BTN_025" data-options="disabled:${INS}" >Create Pre-Application</a>
					     <c:if test="${(gsUserType eq 'C')}">
					    	<a href="javascript:void(0)" style="width:255px;font-size:15px" class="easyui-linkbutton c6" id="list-button" data-item="BTN_025" data-options="disabled:${AUS}" >Create Dealer Application</a>
					    </c:if>
					</td>
	            </tr>
				<tr>
					<td class="h" style="width: fit-content;  margin: auto; display: block; padding: 5px;">
						<a href="javascript:void(0)" class="easyui-linkbutton c6" id="deal-save-button"  data-item="BTN_002" style="width:120px;" data-options="disabled:${INS}">Save</a>
						<a href="javascript:doBack()" class="easyui-linkbutton c6" id="back-button"  data-item="BTN_002" style="width:120px; margin-left:15px;" data-options="disabled:${AUP}">Go To List</a>
					</td>
				</tr> 
			</table>
		</div>
		</div>
		<div id= "newApplList">
		<p class="newdealer-guide">If you have any questions about the documents below, contact your Business Manager to review.</p>
		<table class="tbl_100 subTitTop" style="padding: 0 10px !important; margin-top: 10px;">
			<tr>
				<th class="subTit2" id="subTitAccn2" onClick="doAccordian(this.id)" >
					<span class="subTitIcon"> <i class="fa fa-th-large fa-xs g-mr-5 tabColor" aria-hidden="true"></i>Application List</span>
					<img src="/lsdp/resources/jquery/easyui-1.4/themes/ui-pepper-grinder/images/datagrid_icons_close.png" class="subTitAccn" id="subTitAccn2_icon"/>
				</th>
			</tr>
		</table>
		<div id="subAccn2" style="white-space: nowrap;">
			<div>
				<div id="light">
					<div id="cart_body_option" class="order_cart_body" style="padding: 0 10px;">
						<c:forEach var="list" items="${getNewApplList}">
							<div id ="appl_list_body">
								<input type="hidden" name="applicationStatus" value="${list.STAT}"></input>
							</div>
							<table id ="appl_list_body" style="height: 30px; line-height: 30px;">
								<colgroup>
									<col width="10%" />
									<col width="68%" />
									<col width="12%" />
									<col width="10%" />
								</colgroup>
								<tr>
								    <td style="text-align: center;">${list.applIdView}</td>
								    <td style="white-space: pre;">${list.codeDesc}</td>
								<c:if test="${list.STAT ne NULL}">
									 <c:if test="${list.STAT eq 'Reviewed'}">
									    <td style="color:#0070c0;font-weight: 600;">${list.STAT}</td>
								    </c:if>
								     <c:if test="${list.STAT ne 'Reviewed'}">
									    <td>${list.STAT}</td>
								    </c:if>
						        </c:if>
							    <c:if test="${list.Documents ne NULL}">
								    <td style="color:#ff003a;font-weight: 600;">${list.Documents}</td>
							    </c:if>
								    <td><a onclick="pageMoveList('${list.applId}')"; style="width: 100px; height:25px;" class="easyui-linkbutton c6 l-btn l-btn-small" id="detail2" data-item="BTN_001" data-options=""><span class="l-btn-text detailText">Go To Details</span></a></td>
								</tr>
							</table>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		</div>
		<c:if test="${appl_stat.APPL_STAT eq '400' || appl_stat.APPL_STAT eq '500' || appl_stat.APPL_STAT eq '600'}">
		<div id="checkList">
			<table class="tbl_100 subTitTop">
				<tr>
					<th class="subTit2" id="subTitAccn3" onClick="doAccordian(this.id)" >
						<span class="subTitIcon"> <i class="fa fa-th-large fa-xs g-mr-5 tabColor" aria-hidden="true"></i>Check List after final approval</span>
						<img src="/lsdp/resources/jquery/easyui-1.4/themes/ui-pepper-grinder/images/datagrid_icons_close.png" class="subTitAccn" id="subTitAccn3_icon" />
					</th>
				</tr>
			</table>
			<div id="subAccn3" style="white-space: nowrap;">
				<div>
					<div id="light">
					<div id="cart_body_option" class="order_cart_body" style="padding: 0 10px;">
						<c:forEach var="list" items="${getNewApplCheckList}">  
							<table id ="appl_list_body" style="height: 30px; line-height: 30px;">
								<colgroup>
									<col width="10%" />
									<col width="55.5%" />
									<col width="13.2%" />
									<col width="12.3%" />
									<col width="10%" />
								</colgroup>
								<tr>
									<td style="text-align: center;">${list.codeCd}</td>
									<td style="white-space: pre;">${list.codeName}</td>
									<td id="date${list.codeCd}">${list.checkDate}</td>
									<c:choose>
										<c:when test="${list.codeDesc eq 'Checked' || list.codeDesc eq 'Sent'}">
											<td id="stat${list.codeCd}" style="color:blue;">${list.codeDesc}</td>
										</c:when>
										<c:when test="${list.codeDesc eq 'Ready'}">
											<td id="stat${list.codeCd}">${list.codeDesc}</td>
										</c:when>
										<c:otherwise>
											<td id="stat${list.codeCd}" style="color:red;">${list.codeDesc}</td>
										</c:otherwise>
									</c:choose>
									<td style="width: 95px;"><a onclick="doCheckList($(this))"; style="width: 100px; height:25px;" class="easyui-linkbutton c6" id="detail" data-item="BTN_001" data-value="${list.codeCd}" data-options="disabled:${AU5}">${list.extChr01}</a></td>
								</tr>
							</table>
						</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:if>
		<table class="tbl_100 subTitTop">
			<tr>
				<th class="subTit2"  id="subTitAccn5" onClick="doAccordian(this.id)">
					<span class="subTitIcon"><i class="fa fa-th-large fa-xs g-mr-5 tabColor" aria-hidden="true"></i>Comments</span> 
					<img src="/lsdp/resources/jquery/easyui-1.4/themes/ui-pepper-grinder/images/datagrid_icons_close.png" class="subTitAccn"  id="subTitAccn5_icon"/>
				</th>
			</tr>
		</table>
		<div id="subAccn5">
			<div>
				<table class="remarkDesign">
					<tr id="LSTA">
						<th style="vertical-align: top; width: 9.8%;" class="h"><span>LSTA</span></th>
						<td class="d">
							<textarea rows="4" cols="30"  name="LSremk" id="LSremk" style="width: 970.42px;"></textarea>
						</td>
					</tr>
					<tr id="DEALER">
						<th style="vertical-align: top; width: 9.8%;" class="h"><span>Dealer</span></th>
						<td class="d">
							<textarea rows="4" cols="30"  name="Dealremk" id="Dealremk" style="width: 970.42px;"></textarea>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<fieldset class="div-line-new-sub div-line-new-sub-left">
	        <table cellpadding="5" class="search-table tableEtc-c" style="width:100%;">
	            <tr>
					<td class="h" style="width: fit-content;  margin: auto; display: block; padding: 10px;">
				        <a href="javascript:void(0)" style="width:150px;" class="easyui-linkbutton c6" id="save-button" data-item="BTN_026" data-options="disabled:${UPD}" >Save</a>
						<a href="javascript:void(0)" style="width:150px; margin-left:15px;" class="easyui-linkbutton c6"  id="Reviewed-button" data-item="BTN_027" data-options="disabled:${AU1}">Reviewed</a>
						<a href="javascript:void(0)" style="width:150px; margin-left:15px;" class="easyui-linkbutton c6" id="Arequest-button" data-item="BTN_029" data-options="disabled:${AU3}" >Approval request</a>
						<c:if test="${fn:indexOf(gsSpcAuthCode,'APPR') > -1}">
							<a href="javascript:void(0)" style="width:150px; margin-left:15px;" class="easyui-linkbutton c8" id="Approve-button" data-item="BTN_031" data-options="disabled:${AU5}">Approve</a>
						</c:if>
					</td>
	            </tr>
	             <tr id="appr_area">
					<td class="h" style="width: fit-content;  margin: auto; display: block; padding: 10px;">
						<a href="javascript:void(0)" style="width:150px;" class="easyui-linkbutton c6" id="Cancel-button" data-item="BTN_029" data-options="disabled:${AU3}" >Cancel</a>
				        <a href="javascript:void(0)" style="width:150px; margin-left:15px;" class="easyui-linkbutton c6"  id="Srequest-button" data-item="BTN_028" data-options="disabled:${AU2}">Document request</a>
				        <c:if test="${fn:indexOf(gsSpcAuthCode,'APPR') > -1}">
				        	<a href="javascript:void(0)" style="width:150px; margin-left:15px;" class="easyui-linkbutton c6" id="Reject-button" data-item="BTN_030" data-options="disabled:${AU4}" >Reject</a>
						</c:if>
					</td>
	            </tr>
	             <tr>
	            	<td class="h" style="width: fit-content;  margin: auto; display: block; padding: 10px;">
				        <a href="javascript:doBack()" style="width:150px;" class="easyui-linkbutton c6" id="back-button2"  data-item="BTN_002"  data-options="disabled:${AUP}">Go To List</a>
					</td>
				</tr>
	        </table>
		</fieldset>
		<table class="tbl_100 subTitTop">
			<tr>
				<th class="subTit2" id="subTitAccn6" onClick="doAccordian(this.id)" >
					<span class="subTitIcon"><i class="fa fa-th-large fa-xs g-mr-5 tabColor" aria-hidden="true"></i>History</span> 
					<img src="/lsdp/resources/jquery/easyui-1.4/themes/ui-pepper-grinder/images/datagrid_icons_close.png" class="subTitAccn" id="subTitAccn6_icon" />
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
	 		<a href="javascript:void(0)" class="easyui-linkbutton c6" id="cancel-check-close-button" data-item="BTN_037">Cancel</a>
	   </div>
	</div>
</div>

<div id="regist-dialog" class="wui-dialog" style="border-top-width:1px;display:none">
	<div data-options="region:'center',border:false">
		<div  style="height: 25px;padding-top:10px;">
	        <table cellpadding="5" class="search-table tableSearch-c">
	        	<thead>
		            <tr>
						<th class="h table-Search-h"><span data-item="LAB_008"> </span></th>
					</tr>
				</thead>
	        </table>
	   </div>
		<div style="padding-top:10px;">
			<form id="search-form2" method="post" enctype="multipart/form-data">
				<input type="hidden" id="h_codeCd" name="codeCd" value="" />
				<input type="hidden" id="h_codeGrup" name="codeGrup" value="" />
				<input type="hidden" id="h_atchGrup" name="atchGrup" value="DA" />
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
		   		<a href="javascript:void(0)" style="margin-right: 5px;" class="easyui-linkbutton c6" id="send-button" data-item="BTN_038"  >Send</a>
		 		<a href="javascript:void(0)" class="easyui-linkbutton c6" id="send-close-button" data-item="BTN_039" data-options="width:90">Cancel</a>
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
