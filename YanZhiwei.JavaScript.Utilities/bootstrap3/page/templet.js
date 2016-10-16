/// <reference path="D:\Source\Repos\JavaScript.Utilities\YanZhiwei.JavaScript.Utilities\jquery/jquery-1.9.1.js" />

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
                    Html += "<td><input type=\"checkbox\" name=\"user_item\" class=\"checkboxes\" value=\"" + item.LocalNum + "\"/></td>";
                    Html += "<td>" + (i + 1) + "</td>";
                    Html += "<td>" + item.LocalNum + "</td>";
                    Html += "<td>" + item.LocalName + "</td>";
                    Html += "<td>" + item.StorageName + "</td>";
                    Html += "<td>" + item.LocalType + "</td>";
                    Html += "<td>" + item.IsForbid + "</td>";
                    Html += "<td>" + item.IsDefault + "</td>";
                    Html += "<td>" + item.CreateTime + "</td>";
                    Html += "<td>";

                    Html += "<a class=\"icon-edit\" href=\"javascript:void(0)\" onclick=\"Location.Add('" + item.LocalNum + "')\" title=\"编辑\"></a>&nbsp;&nbsp;";
                    Html += "<a class=\"icon-remove\" href=\"javascript:void(0)\" onclick=\"Location.Delete('" + item.LocalNum + "')\" title=\"删除\"></a>&nbsp;&nbsp;";

                    if (item.IsForbid == 1) {
                        Html += "<a class=\"icon-lock\" href=\"javascript:void(0)\" onclick=\"Location.Audit('" + item.LocalNum + "',0)\" title=\"禁用\"></a>";
                    }
                    else {
                        Html += "<a class=\"icon-unlock\" href=\"javascript:void(0)\" onclick=\"Location.Audit('" + item.LocalNum + "',1)\" title=\"解除\"></a>";
                    }
                    Html += "</td>";
                    Html += "</tr>";
                });
            }
            $("#tabInfo tbody").html(Html);
            $("#mypager").pager({ pagenumber: pageIndex, recordCount: data.TotalItemCount, pageSize: pageSize, buttonClickCallback: Templet.pageClick });
        });
    },
    selectAll: function (item) {
        var flag = $(item).prop("checked");
        $("input[name='user_item']").prop("checked", flag);
    },
    ToExcel: function () {
        var _query = "../BackHandler/BaseHandler.ashx?action=exportLocationExcel";
        jqUtils.Ajax.post(_query, null, function (data) {
            if (data.StatusCode == 200) {
                if (data.Content != undefined && data.Content != "") {
                    var path = unescape(data.Content);
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