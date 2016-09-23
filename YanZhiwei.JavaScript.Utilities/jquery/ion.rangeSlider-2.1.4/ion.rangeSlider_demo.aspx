<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ion.rangeSlider_demo.aspx.cs" Inherits="YanZhiwei.JavaScript.Utilities.jquery.ion.rangeSlider_2._1._4.ion_rangeSlider_demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="css/ion.rangeSlider.css" rel="stylesheet" />
    <link href="css/ion.rangeSlider.skinFlat.css" rel="stylesheet" />
    <script src="../jquery-1.9.1.js"></script>
    <script src="js/ion-rangeSlider/ion.rangeSlider.js"></script>
    <script src="rangeSlider.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            UIRangeSlider.initCommon('energySaveSilder', 1, 255, 1, '档', null, function (value) {
                return value == 255 ? "无极调光" : value;
            });
            UIRangeSlider.initCommon('energySaveSilder2', 1, 255, 1, '档');
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input id="silderEnergySaver" type="text" name="energySaveSilder" value="128" /><br />
            <input id="silderEnergySaver2" type="text" name="energySaveSilder2" value="128" />
        </div>
    </form>
</body>
</html>
