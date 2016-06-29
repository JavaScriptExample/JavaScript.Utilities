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
                jqUtils.UITable.createTable('jsonTable', data);
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: 20px auto; width: 500px;">
            <table id="jsonTable" style="border-collapse: collapse;" border="1" cellpadding="5">
            </table>

        </div>
    </form>
</body>
</html>
