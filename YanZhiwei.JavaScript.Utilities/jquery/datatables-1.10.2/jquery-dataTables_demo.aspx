<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jquery-dataTables_demo.aspx.cs" Inherits="YanZhiwei.JavaScript.Utilities.jquery.datatables_1._10._2.jquery_dataTables_demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../jquery-ui-1.12.0/jquery-ui.min.css" rel="stylesheet" />
    <script src="../jquery-1.9.1.js"></script>
    <script src="../jquery-ui-1.12.0/jquery-ui.js"></script>
    <script src="media/js/jquery.dataTables.js"></script>
    <script src="../../jsUtils.js"></script>
    <script src="datatablesUtils.js"></script>
    <style type="text/css">
        /*table.dataTable tbody tr.selected {
            background-color: lightgreen;
        }*/
        .ui-tooltip {
            white-space: pre-line;
        }
    </style>

    <script type="text/javascript">

        $(document).ready(function () {

            var _columns = [
                       {
                           "mData": null,
                           "bSortable": false,
                           "width": "10%",
                           "mRender": function (data, type, row) {
                               return '<input type="checkbox" id="someCheckbox" name="someCheckbox" checked />';
                           }
                       },
                       { "data": "time", "title": "时间", "class": "center", "width": "20%" },
                       { "data": "log", "title": "日志", "class": "center", "width": "50%" },
                       { "data": "status", "title": "状态", "class": "center", "width": "10%" },
                       {
                           "mData": null,
                           "bSortable": false,
                           "width": "10%",
                           "mRender": function (data, type, row) {
                               return '<a href=#/' + data.time + '>' + '编辑' + '</a>';
                           }
                       }
            ];

            $('#tableLog').executeQuery(_columns);

        });
        function AddJson() {
            /// <summary>
            /// 添加JSON数据
            /// </summary>
            var _jsonObj =
                [{ "time": "2015-10-11", "log": "test", "status": "正常" },
                 { "time": "2015-10-12", "log": "test", "status": "正常" },
                 { "time": "2015-10-13", "log": "test", "status": "正常" }
                ];

            $('#tableLog').dataTable().addJson(_jsonObj);

            //var _jsonString = JSON.stringify(_jsonObj);
            //$('#tableLog').dataTable().addJson(_jsonString);
        }
        function RowClick() {
            /// <summary>
            /// 行选中事件处理
            /// </summary>
            $('#tableLog').dataTable().rowClickEvent(function (rowData) {
                alert(rowData.time);
            });
        }
        function HightSingleRow() {
            /// <summary>
            /// 单行高亮选中
            /// </summary>
            $('#tableLog').dataTable().hightSingleRow();

        }
        function HightMutilRow() {
            /// <summary>
            /// 多行高亮选中
            /// </summary>
            $('#tableLog').dataTable().hightMutilRow();
        }
        function getSelectedRowIndex() {
            /// <summary>
            /// 获取选中行索引
            /// </summary>
            var _selectedIndex = $('#tableLog').dataTable().getSelectedRowIndex();
            alert(_selectedIndex);
        }
        function getSelectedRowsData() {
            /// <summary>
            /// 获取选中行数据
            /// </summary>
            var _selectedData = $('#tableLog').dataTable().getSelectedRowsData();
            alert(_selectedData[0].time);
        }
        function updateRowByIndex() {
            /// <summary>
            /// 按照索引更新数据
            /// </summary>
            var data = { "time": "2015-10-8", "log": " update test", "status": "正常" };
            $('#tableLog').dataTable().updateRowByIndex(0, data);
        }
        function deleteRowByIndex() {
            /// <summary>
            /// 按照索引删除数据
            /// </summary>
            $('#tableLog').dataTable().deleteRowByIndex(0);
        }
        function getAllRows() {
            /// <summary>
            /// 获取全行数据
            /// </summary>
            var _allRowsData = $('#tableLog').dataTable().getAllRows();
            alert(_allRowsData[0].time);
        }
        function getRowCount() {
            /// <summary>
            /// 获取行数
            /// </summary>
            var _rowCount = $('#tableLog').dataTable().getRowCount();
            alert(_rowCount);
        }
        function foreach() {
            /// <summary>
            /// 遍历行
            /// </summary>
            var table = $('#tableLog').dataTable();
            table.foreach(function (data) {
                alert(data.time);
            })
        }
        function getRowByParam() {
            /// <summary>
            /// 根据参数查询行
            /// </summary>
            var table = $('#tableLog').dataTable();
            var _row = table.getRowByParam('time', '2015-10-11');
            alert(_row.data().time);
        }
        function deleteRowByParam() {
            /// <summary>
            /// 根据参数删除行
            /// </summary>
            var table = $('#tableLog').dataTable();
            table.deleteRowByParam('time', '2015-10-11');
        }
        function getRowIndexByParam() {
            /// <summary>
            /// 根据参数获取索引
            /// </summary>
            var table = $('#tableLog').dataTable();
            var _rowIndex = table.getRowIndexByParam('time', '2015-10-11');
            alert(_rowIndex);
        }
        function getRowHtmlByParam() {
            /// <summary>
            /// 获取行HRML元素根据参数
            /// </summary>
            var table = $('#tableLog').dataTable();
            var _row = table.getRowHtmlByParam('time', '2015-10-11');
            $(_row).css("background-color", "red");
            setTimeout(function () {
                var _row = table.getRowHtmlByParam('time', '2015-10-11');
                $(_row).css("background-color", "green");
            }, 2000);
        }
        function addRowTooltip() {
            /// <summary>
            /// 添加行Tooltip
            /// </summary>
            $('#tableLog tbody tr').each(function (i, row) {
                var sTitle;
                var nTds = $('td', this);
                var sBrowser = $(nTds[1]).text();
                this.setAttribute('title', sBrowser + "\n" + "cccc");
                //获取rowData方式；
                //var _rowdata = $('#tableCabChTotalView').dataTable().fnGetData($(row)[0]);
            });

            var oTable = $('#tableLog').dataTable();
            /* Apply the tooltips */
            oTable.$('tr').tooltip({
                "delay": 0,
                "track": true,
                "fade": 250
            });
        }
    </script>
</head>
<body>
    <table id="tableLog"></table>
    <input type="button" value="addJson" onclick="AddJson()" /><br />
    <input type="button" value="rowClick" onclick="RowClick()" /><br />
    <input type="button" value="hightSingleRow" onclick="HightSingleRow()" /><br />
    <input type="button" value="hightMutilRow" onclick="HightMutilRow()" /><br />
    <input type="button" value="getSelectedRowsData" onclick="getSelectedRowsData()" /><br />
    <input type="button" value="getSelectedRowIndex" onclick="getSelectedRowIndex()" /><br />
    <input type="button" value="updateRowByIndex" onclick="updateRowByIndex()" /><br />
    <input type="button" value="deleteRowByIndex" onclick="deleteRowByIndex()" /><br />
    <input type="button" value="clearAllRows" onclick="clearAllRows()" /><br />
    <input type="button" value="getAllRows" onclick="getAllRows()" /><br />
    <input type="button" value="getRowCount" onclick="getRowCount()" /><br />
    <input type="button" value="foreach" onclick="foreach()" /><br />
    <input type="button" value="getRowByParam" onclick="getRowByParam()" /><br />
    <input type="button" value="getRowIndexByParam" onclick="getRowIndexByParam()" /><br />
    <input type="button" value="deleteRowByParam" onclick="deleteRowByParam()" /><br />
    <input type="button" value="getRowHtmlByParam" onclick="getRowHtmlByParam()" /><br />
    <input type="button" value="addRowTooltip" onclick="addRowTooltip()" /><br />
</body>
</html>
