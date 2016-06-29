<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jqUtilsDemo.aspx.cs" Inherits="YanZhiwei.JavaScript.Utilities.jqUtilsDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>jqUtils Demo</title>
    <script src="jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="jqUtils.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.getJSON("BackHandler/QueryHandler.ashx?action=queryperson", function (data) {
                var table = document.createElement('table');
                table.id = "jsonTable";
                table.style = "border-collapse: collapse;";
                table.border = "1";
                table.cellPadding = "5";
                $('#container').append(table);
                // document.body.appendChild(table);
                jqUtils.UITable.createTable('jsonTable', data);
            });
            $.getJSON("BackHandler/QueryHandler.ashx?action=queryperson", function (data) {
                var table = document.createElement('table');
                table.id = "jsonTable2";
                table.style = "border-collapse: collapse;";
                table.border = "1";
                table.cellPadding = "5";
                $('#container').append(table);
                //  document.body.appendChild(table);
                jqUtils.UITable.createTable('jsonTable2', data);
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: 20px auto; width: 500px;" id="container">
            <%--   <table id="jsonTable" style="border-collapse: collapse;" border="1" cellpadding="5">
            </table>--%>
        </div>
    </form>
</body>
</html>
