<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dataTables_example6.aspx.cs" Inherits="YanZhiwei.JavaScript.Utilities.jquery.datatables._1._10._2.dataTables_example6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>jquery Datables Examples</title>
    <link href="../../../bs/v3/css/bootstrap.min.css" rel="stylesheet" />
    <link href="media/css/jquery.dataTables.min.css" rel="stylesheet" />

    <script src="media/js/jquery.js" type="text/javascript"></script>
    <script src="../../../bs/v3/js/bootstrap.min.js"></script>
    <script src="media/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="../../../Scripts/handlebars.min.js"></script>

    <script src="../../../jsUtils.js"></script>
    <script src="datatablesUtils.js" type="text/javascript"></script>
    <script type="text/javascript">
        var data = [
    {
        "name": "rfswitch1",
        "ip": "192.168.1.1",
        "group": "A"
    },
   {
       "name": "rfswitch2",
       "ip": "192.168.1.1",
       "group": "B"
   },
	{
	    "name": "rfswitch3",
	    "ip": "192.168.1.2",
	    "group": "C"
	},
	{
	    "name": "rfswitch4",
	    "ip": "192.168.1.3",
	    "group": "D"
	},
	{
	    "name": "rfswitch5",
	    "ip": "192.168.1.4",
	    "group": "A"
	},
	{
	    "name": "rfswitch6",
	    "ip": "192.168.1.5",
	    "group": "B"
	},
	{
	    "name": "rfswitch7",
	    "ip": "192.168.1.6",
	    "group": "C"
	},
	{
	    "name": "rfswitch8",
	    "ip": "192.168.1.7",
	    "group": "D"
	},
	{
	    "name": "rfswitch9",
	    "ip": "192.168.1.8",
	    "group": "A"
	},
	{
	    "name": "rfswitch10",
	    "ip": "192.168.1.9",
	    "group": "B"
	},
	{
	    "name": "rfswitch11",
	    "ip": "192.168.1.10",
	    "group": "C"
	},
	{
	    "name": "rfswitch12",
	    "ip": "192.168.1.11",
	    "group": "D"
	}
        ];
        $(document).ready(function () {
            var tpl = $("#tpl").html();//get template
            //compile template
            var template = Handlebars.compile(tpl);
            var _columns = [
               { "data": "name", "title": "姓名", "class": "center", "width": "25%" },
               { "data": "ip", "title": "IP", "class": "center", "width": "25%" },
               { "data": "group", "title": "类别", "class": "center", "width": "25%" },
               {
                   "title": "编辑",
                   "mData": null,
                   "bSortable": false,
                   "width": "25%",
                   "mRender": function (data, type, row) {
                       var context =
                        {
                            func: [
                                { "name": "  编辑 ", "fn": "edit(\'" + row.name + "\',\'" + row.ip + "\',\'" + row.group + "\')", "type": "primary" },
                                { "name": "删除", "fn": "del(\'" + row.name + "\',\'" + row.ip + "\',\'" + row.group + "\')", "type": "danger" }
                            ]
                        };
                       var html = template(context);//匹配内容
                       return html;
                   }
               }
            ];

            $('#tableLog').executeQuery(_columns);
            $('#tableLog').addJson(data);
        });

        function edit(name, ip, group) {
            //console.log(name);
            editFlag = true;
            $("#myModalLabel").text("Edit");
            $("#name").val(name);//为什么也有作用
            $("#ip").val(ip).attr("disabled", true);
            $("#group").val(group);
            //应该获得数据也就是要进行更新处理
            $("#myModal").modal("show");
        }
        function del(name, ip, group) {
            //这个地方也好弄，可以获取数据
            alert(name + ip + group);
        }

        function save() {
            var flag = $("#myModalLabel").text();
            //var flag = Edit;
            if (flag == "Edit") {
                //get input and ajax
                alert("Edit");
                return;
            }
            alert("add");//get input and ajax
            var addJson = {
                "name": $("#name").val(),
                "ip": $("#ip").val(),
                "group": $("#group").val(),
            };
            return;
        }
    </script>
</head>
<body>
    <div class="container">
        <table id="tableLog" class="table table-striped table-bordered"></table>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">ADD</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <input type="text" class="form-control" id="name" placeholder="please input rfswitch name" />
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="ip" placeholder="please input rfswitch ip" />
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="group" placeholder="please input rfswitch group" />
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                    <button type="button" class="btn btn-primary" id="save">save</button>
                </div>
            </div>
        </div>
    </div>
    <!--定义操作列按钮模板-->
    <script id="tpl" type="text/x-handlebars-template">
        {{#each func}}
    <button type="button" class="btn btn-{{this.type}} btn-sm" onclick="{{this.fn}}">{{this.name}}</button>
        {{/each}}
    </script>
</body>
</html>
