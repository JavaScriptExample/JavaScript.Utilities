<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bootstrap_Templet.aspx.cs" Inherits="YanZhiwei.JavaScript.Utilities.bootstrap3.bootstrap_Templet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />

    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <script src="../jquery/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../jsUtils.js"></script>
    <script src="../jqUtils.js"></script>
    <script src="page/templet.js"></script>
    <style>
        .pager {
            margin: @baseLineHeight 0;
            list-style: none;
            text-align: center;
            .clearfix();
        }

            .pager li {
                display: inline;
            }

                .pager li > a,
                .pager li > span {
                    display: inline-block;
                    padding: 5px 14px;
                    background-color: #fff;
                    border: 1px solid #ddd;
                    .border-radius(15px);
                }

                    .pager li > a:hover {
                        text-decoration: none;
                        background-color: #f5f5f5;
                    }

            .pager .next > a,
            .pager .next > span {
                float: right;
            }

            .pager .previous > a,
            .pager .previous > span {
                float: left;
            }

            .pager .disabled > a,
            .pager .disabled > a:hover,
            .pager .disabled > span {
                color: @grayLight;
                background-color: #fff;
                cursor: default;
            }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            Templet.pageClick(1, 10);
        });
        /**************************************************************************************************************/
        /***************************************************分页插件*************************************************/
        /*
        *参数说明
        *options.recordCount 总数
        *options.pageSize  每页大小
        *options.pagenumber  当前页数
        *options.customerText 是否自定义文本，默认不显示
        *options.buttonClickCallback 分页的回调函数
        * 用法 ：$("#mypager").pager({ pagenumber: pageclickednumber, recordCount: recordCount, pageSize: pageSize,cKey:value, buttonClickCallback: PageClick})
        */
        ; (function ($) {
            $.fn.pager = function (options) {
                var opts = $.extend({}, $.fn.pager.defaults, options);
                var pagecount = GetPageCount(parseInt(opts.recordCount), parseInt(opts.pageSize));
                opts.pagecount = pagecount;
                $(this).empty();
                $(this).append(renderpager(parseInt(opts.pagenumber), pagecount, parseInt(opts.pageSize), parseInt(opts.recordCount), opts.customerText, opts.buttonClickCallback));

                if (opts.buttonClickCallback != undefined && opts.buttonClickCallback != null) {
                    $(this).find(".pager_items").children("li").click(function () {
                        var data = $(this).attr("data");
                        if (data > 0) {
                            opts.buttonClickCallback(data, opts.pageSize);
                        }
                    });

                    $(this).find(".pageselectpage").change(function () {
                        var size = $(this).val();
                        opts.buttonClickCallback(1, size);
                    });
                }
            };

            //获得总页数
            function GetPageCount(recordCount, pageSize) {
                if (recordCount <= 0) return 1;
                if (recordCount % pageSize == 0)
                    return parseInt(recordCount / pageSize);
                else
                    return parseInt(recordCount / pageSize) + 1;
            }
            //pagenumber
            function renderpager(pagenumber, pagecount, pageSize, recordCount, customerText, buttonClickCallback) {
                var items = [5, 10, 15, 20, 30, 50];
                var $pager = "";
                $pager += "<div class=\"paget\">";
                //$pager += "<div class=\"dataTables_info\">当前页 " + pagenumber + " / " + pagecount + "&nbsp; 共 " + recordCount + " 行 ,每页";
                $pager += "<div class=\"dataTables_info\">共 " + recordCount + " 行 ,每页";
                $pager += "<select class=\"input-small pageselectpage\" style='width:60px;'>";

                for (var i = 0; i < items.length; i++) {
                    if (items[i] == pageSize) {
                        $pager += "<option selected=\"selected\" value=\"" + items[i] + "\">" + items[i] + "</option>";
                    } else {
                        $pager += "<option value=\"" + items[i] + "\">" + items[i] + "</option>";
                    }
                }
                $pager += "</select>行</div>";
                $pager += "</div>";
                $pager += "<div class=\"pagen\">";
                $pager += "<div class=\"dataTables_paginate paging_bootstrap pagination\">";
                $pager += "<ul class='pager_items'>";

                if (pagenumber <= 1) {
                    $pager += "<li class=\"prev disabled\" data=\"1\"><a href=\"javascript:void(0)\">首页</a></li>";
                } else {
                    $pager += "<li class=\"prev\" data=\"1\"><a href=\"javascript:void(0)\">首页</a></li>";
                }

                var start = pagenumber - 3;
                start = start <= 1 ? 1 : start;
                if (start > 1) {
                    $pager += "<li data=\"0\"><a href=\"javascript:void(0)\">...</a></li>";
                }
                for (var i = start; i < pagenumber; i++) {
                    $pager += "<li data=\"" + i + "\"><a href=\"javascript:void(0)\">" + i + "</a></li>";
                }
                $pager += "<li class=\"active\" data=\"" + pagenumber + "\"><a href=\"javascript:void(0)\">" + pagenumber + "</a></li>";

                var end = pagenumber + 3;
                end = end >= pagecount ? pagecount : end;

                for (var i = pagenumber + 1; i <= end; i++) {
                    $pager += "<li data=\"" + i + "\"><a href=\"javascript:void(0)\">" + i + "</a></li>";
                }
                if (pagecount > end) {
                    $pager += "<li data=\"0\"><a href=\"javascript:void(0)\">...</a></li>";
                }

                if (pagenumber >= pagecount) {
                    $pager += "<li class=\"next disabled\" data=\"" + pagecount + "\"><a href=\"javascript:void(0)\">尾页</a></li>";
                } else {
                    $pager += "<li class=\"next\" data=\"" + pagecount + "\"><a href=\"javascript:void(0)\">尾页</a></li>";
                }
                $pager += "</ul>";
                $pager += "</div>";
                $pager += "</div>";
                return $pager;
            }


            function GetPageNum() {
                alert("请输入要跳转的页码！");
            }

            $.fn.pager.defaults = {
                pagenumber: 1,
                pagecount: 1,
                recordCount: 100,
                pageSize: 10
            };
        })(jQuery);
    </script>

</head>
<body class="fixed-top">

    <div class="container">

        <div class="row-fluid">
            <div class="span12">
                <div class="widget box light-grey">
                    <div class="widget-title">
                        <h4><i class="icon-globe"></i>库位管理</h4>
                        <div class="actions">
                            <a class="btn btn-primary" href="javascript:void(0)" onclick="Templet.Add()"><i class="icon-pencil"></i>&nbsp;新增</a>
                            <a class="btn btn-info" href="javascript:void(0)" onclick="Templet.ToExcel()"><i class="icon-download"></i>&nbsp;导出</a>
                        </div>
                    </div>
                    <div class="widget-body">

                        <div class="row-fluid">

                            <form class="form-horizontal" action="javascript:void(0)">
                                <div class="control-group">

                                    <div class="controls">
                                        仓库
                                                <select id="ddlStorageName" name="ddlStorageName">
                                                    <option>产品仓库</option>
                                                </select>
                                        类型
                                                <select id="ddlLocalType" name="ddlLocalType">
                                                    <option>正式库区</option>
                                                    <option>报损库区</option>
                                                    <option>待出库区</option>
                                                    <option>待检库区</option>
                                                    <option>待入库区</option>
                                                </select>
                                        库位<input id="txtLocalName" name="txtLocalName" type="text" />
                                        <a id="gritter-remove-all" class="btn btn-info" href="javascript:void(0)" onclick="Location.PageClick(1,10)"><i class="icon-search"></i>&nbsp;搜索</a>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <table class="table table-striped table-bordered table-hover" id="tabInfo">
                            <thead>
                                <tr class="widget-title">
                                    <th style="width: 8px;">
                                        <input type="checkbox" class="group-checkable" onclick="Templet.selectAll(this)" /></th>
                                    <th class="hidden-480">序号</th>
                                    <th class="hidden-480">库位编号</th>
                                    <th class="hidden-480">库位名</th>
                                    <th class="hidden-480">所在仓库</th>
                                    <th class="hidden-480">库位类型</th>
                                    <th class="hidden-480">是否禁用</th>
                                    <th class="hidden-480">是否默认</th>
                                    <th class="hidden-480">创建时间</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                        <div class="row-fluid" id="mypager">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
