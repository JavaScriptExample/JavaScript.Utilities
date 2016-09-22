<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dataTables_executePageQuery.aspx.cs" Inherits="YanZhiwei.JavaScript.Utilities.jquery.datatables._1._10._2.dataTables_executePageQuery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="media/js/jquery.js" type="text/javascript"></script>
    <script src="media/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="datatablesUtils.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            var _columns = [
                  { "data": "Id", "title": "用户Id", "class": "center", "width": "50%" },
                  { "data": "Name", "title": "用户名称", "class": "center", "width": "50%" }
            ];
            $('#example').executePageQuery(_columns, '../../../BackHandler/BaseHandler.ashx');

        });
    </script>
</head>
<body>
    <form id="Form1" runat="server">
        <table border="0" class="display" id="example">
        </table>
    </form>
</body>
</html>