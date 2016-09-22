<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jqGrid_demo.aspx.cs" Inherits="YanZhiwei.JavaScript.Utilities.jquery.jqGrid_4._4._3.jqGrid_demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../jquery-ui-1.12.0/jquery-ui.min.css" rel="stylesheet" />
    <link href="css/ui.jqgrid.css" rel="stylesheet" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="../jquery-ui-1.12.0/jquery-ui.min.js"></script>
    <script src="js/jquery.jqGrid.min.js"></script>
    <script src="jqGridUtils.js" type="text/javascript"></script>
    <script type="text/javascript">
        function initExt() {
            /// <summary>
            /// 扩展初始化
            /// </summary>
            var colNames = ['序号', '箱名称', '回路名称', '启用', '回路控制(DO)', '回路(DI)', '是否上锁', '运行方式'];
            var colModel = [
                     { name: 'CID', index: 'CID', width: 120 },
                     { name: 'CCabName', index: 'CCabName', width: 120 },
                     { name: 'CChName', index: 'CChName', width: 120 },
                     { name: 'CEnable', index: 'CEnable', width: 120 },
                     { name: 'CDoValue', index: 'CDoValue', width: 80 },
                     { name: 'CDiValue', index: 'CDiValue', width: 80 },
                     { name: 'CIsLocked', index: 'CIsLocked', width: 80 },
                     { name: 'CRunType', index: 'CRunType', width: 80 }
            ];
            var jqrid = $('#ctuStatus');

            jqrid.initExt(300, 800, colNames, colModel, '测试');
            for (var i = 0; i < 10; i++) {
                var item = { CID: i, CCabName: '测试' + i, CChName: '回路' + i, CEnable: '可用', CDoValue: '打开', CDiValue: '打开', CIsLocked: '锁定', CRunType: '自主运行' };
                jqrid.addRowData(i, item);
            }
            jqrid.setCell(1, 2, '', { 'background': 'red' });
        }
        function updateBlinkRow() {
            var jqrid = $('#ctuStatus');
            for (var i = 0; i < 10; i++) {
                var item = { CID: i, CCabName: '测试' + i, CChName: '回路' + i, CEnable: '可用', CDoValue: '打开', CDiValue: '打开', CIsLocked: '锁定', CRunType: '自主运行' };
                jqrid.updateBlinkRow(i, item, 3, 'green');
            }
        }
        function highlightRow() {
            var jqrid = $('#ctuStatus');
            jqrid.highlightRow(3, 'red');
        }
        function getRowDataByColNameValue() {
            var jqrid = $('#ctuStatus');
            var rowdata = jqrid.getRowDataByColNameValue('CID', 1);
            if (rowdata) {
                alert('fined:' + rowdata.CCabName);
            }
            else {
                alert('not fined.');
            }
        }
        function getRowIndex() {
            var jqrid = $('#ctuStatus');
            var rowIndex = jqrid.getRowIndex('CID', 1);
            alert(rowIndex);
        }
        function getCellIndex() {
            var jqrid = $('#ctuStatus');
            var cellIndex = jqrid.getCellIndex('CEnable');
            alert(cellIndex);
        }
        function blinkRow() {
            var jqrid = $('#ctuStatus');
            jqrid.blinkRow(3, 10, 'red');
        }
        function blinkCell() {
            var jqrid = $('#ctuStatus');
            jqrid.blinkCell(3, 3, 10, 'green');
        }
    </script>
</head>
<body>
    <table id="ctuStatus"></table>
    <br />
    <input id="Button1" type="button" value="initExt" onclick="initExt()" /><br />
    <input id="Button2" type="button" value="updateBlinkRow" onclick="updateBlinkRow()" /><br />
    <input id="Button3" type="button" value="highlightRow" onclick="highlightRow()" /><br />
    <input id="Button4" type="button" value="getRowDataByColNameValue" onclick="getRowDataByColNameValue()" /><br />
    <input id="Button5" type="button" value="getRowIndex" onclick="getRowIndex()" /><br />
    <input id="Button6" type="button" value="getCellIndex" onclick="getCellIndex()" /><br />
    <input id="Button7" type="button" value="blinkRow" onclick="blinkRow()" /><br />
    <input id="Button8" type="button" value="blinkCell" onclick="blinkCell()" /><br />
</body>
</html>