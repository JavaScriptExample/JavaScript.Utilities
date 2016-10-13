<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bootstrap_Templet.aspx.cs" Inherits="YanZhiwei.JavaScript.Utilities.bootstrap3.bootstrap_Templet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <script src="../jquery/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../jsUtils.js"></script>
    <script src="../jqUtils.js"></script>
    <script src="page/templet.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            Templet.pageClick(1, 10);
        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <table class="table table-striped table-bordered table-hover" id="tabInfo">
                <thead>
                    <tr class="widget-title">
                        <th style="width: 8px;">
                            <input type="checkbox" class="group-checkable" onclick="Templet.SelectAll(this)" /></th>
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
        </div>
    </form>
</body>
</html>
