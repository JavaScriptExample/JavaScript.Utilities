/// <reference path="D:\Source\Repos\JavaScript.Utilities\YanZhiwei.JavaScript.Utilities\jquery/jquery-1.9.1.js" />
/// <reference path="../bootstrap-jqPaginator/jqPaginator.min.js" />

var Templet = {
    pageClick: function (pageIndex, pageSize) {
        var _query = "../BackHandler/BaseHandler.ashx?action=getLocationList";
        pageSize = pageSize == undefined ? 10 : pageSize;
        var _paramter = {};
        _paramter["PageIndex"] = pageIndex;
        _paramter["PageSize"] = pageSize;
        jqUtils.Ajax.post(_query, _paramter, function (data) {
            var Html = "";
            if (data != undefined && data.PagedList.length > 0) {
                $(data.PagedList).each(function (i, item) {
                    Html += "<tr class=\"odd gradeX\">";
                    Html += "<td><input type=\"checkbox\" name=\"user_item\" class=\"checkboxes\" value=\"" + item.OrderID + "\"/></td>";
                    Html += "<td>" + (i + 1) + "</td>";
                    Html += "<td>" + item.OrderID + "</td>";
                    Html += "<td>" + item.OrderDate + "</td>";
                    Html += "<td>" + item.ShipName + "</td>";
                    Html += "<td>" + item.ShipCity + "</td>";
                    Html += "<td>" + item.ShipRegion + "</td>";
                    Html += "<td>" + item.ShipPostalCode + "</td>";
                    Html += "<td>" + item.ShipCountry + "</td>";
                    Html += "<td>";

                    Html += "<a class=\"icon-edit\" href=\"javascript:void(0)\" onclick=\"Location.Add('" + item.OrderID + "')\" title=\"编辑\"></a>&nbsp;&nbsp;";
                    Html += "<a class=\"icon-remove\" href=\"javascript:void(0)\" onclick=\"Location.Delete('" + item.OrderID + "')\" title=\"删除\"></a>&nbsp;&nbsp;";

                    //if (item.IsForbid == 1) {
                    //    Html += "<a class=\"icon-lock\" href=\"javascript:void(0)\" onclick=\"Location.Audit('" + item.OrderID + "',0)\" title=\"禁用\"></a>";
                    //}
                    //else {
                    Html += "<a class=\"icon-unlock\" href=\"javascript:void(0)\" onclick=\"Location.Audit('" + item.OrderID + "',1)\" title=\"解除\"></a>";
                    // }
                    Html += "</td>";
                    Html += "</tr>";
                });
            }
            $("#tabInfo tbody").html(Html);
            $('#mypager').jqPaginator({
                totalPages: data.TotalPageCount,
                visiblePages: 10,
                currentPage: pageIndex,
                activeClass: 'active',
                prev: '<li class="prev"><a href="javascript:;">上一页</a></li>',
                next: '<li class="next"><a href="javascript:;">下一页</a></li>',
                page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
                last: '<li class="last"><a href="javascript:;">尾页</a></li>',
                first: '<li class="first"><a href="javascript:;">首页</a></li>',
                onPageChange: function (num, type) {
                    if (type != 'init')
                        Templet.pageClick(num, pageSize);
                }
            });
        });
    },
    selectAll: function (item) {
        var flag = $(item).prop("checked");
        $("input[name='user_item']").prop("checked", flag);
    },
    ToExcel: function () {
        var _query = "../BackHandler/BaseHandler.ashx?action=exportLocationExcel";
        jqUtils.Ajax.post(_query, null, function (result) {
            if (result.Type == 'Success') {
                if (result.Data != undefined && result.Data != "") {
                    var path = unescape(result.Data);
                    window.location.href = path;
                    return true;
                } else {
                    alert("导出EXCEL失败，请稍后重试！");
                    return true;
                }
            }
        });
        return true;
    }
};