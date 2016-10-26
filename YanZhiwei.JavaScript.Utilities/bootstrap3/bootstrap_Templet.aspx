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
    <script src="bootstrap-jqPaginator/jqPaginator.min.js"></script>
    <script src="page/templet.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            Templet.pageClick(1, 10);
        });
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

                        <div class="row">

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
                                    <th class="hidden-480">订单序号</th>
                                    <th class="hidden-480">订单日期</th>
                                    <th class="hidden-480">船名</th>
                                    <th class="hidden-480">货主所在城市</th>
                                    <th class="hidden-480">货主所在地区</th>
                                    <th class="hidden-480">货主邮编</th>
                                    <th class="hidden-480">货主所在国家</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                        <ul class="pagination" id="mypager"></ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
