<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bootstrap-touchspinDemo.aspx.cs" Inherits="YanZhiwei.JavaScript.Utilities.bs.v3.bootstrap_touchspinDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>bootstrap-touchspin Demo</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="bootstrap-touchspin/bootstrap.touchspin.min.css" rel="stylesheet" />
    <script src="../../jquery/jquery-1.9.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="bootstrap-touchspin/bootstrap.touchspin.min.js"></script>
    <script src="touchSpin.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            UITouchSpin.initCommon('RemoteSignNo', 1, 100);
        });
    </script>
</head>
<body>
    <div class="container">
        <form role="form" class="form-horizontal form-bordered">
            <div class="form-body">
                <div class="form-group">
                    <label class="col-md-4 control-label">模拟量号:</label>
                    <div class="col-md-6">
                        <input id="txtRemoteSignNo" type="text" value="1" name="RemoteSignNo" />
                    </div>
                    <div class="col-md-2">
                        <label id="lblLampNoError" style="color: red;"></label>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
