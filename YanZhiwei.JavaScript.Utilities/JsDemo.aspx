<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JsDemo.aspx.cs" Inherits="YanZhiwei.JavaScript.Utilities.JsDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Js Demo</title>
    <script src="jsUtils.js"></script>
    <script type="text/javascript">
        function getFriendlyStringDemo() {
            var _time = '2011-10-12 09:14:12';
            _time = jsUtils.datetime.parseDateTime(_time);
            console.log("getFriendlyString：" + jsUtils.datetime.getFriendlyString(_time));
        }
        function getUrlParamterDemo() {
            var _url = window.location.href;
            var _value = jsUtils.url.get(_url, 'keyid');
            alert(_value);

        }
        //关于 javascript 委托 示例
        function delegate() {
            var ClassA = function () {
                var _color = "red";
                return {
                    getColor: function () {
                        alert("Color: " + _color);
                    },
                    setColor: function (color) {
                        _color = color;
                    }
                };
            };
            var a = new ClassA();
            var d = jsUtils.delegate(a, a.setColor);
            d("blue");
            a.getColor();

        }
        function urlget() {
            var url = "yUtilsTest.html?Name='测试'";
            var value = jsUtils.url.get(url, 'Name');
            alert(value);
        }
        function jsonSerializeTest() {
            var person = new Object();
            person.name = "yanzhiwei";
            person.age = 20;
            var _json = jsUtils.json.serialize(person);
            alert(_json);

        }
        function addHoursTest() {
            alert(jsUtils.datetime.addHours(new Date(), 2));
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input id="Button1" type="button" value="getFriendlyString" onclick="getFriendlyStringDemo()" /><br />
            <input id="Button2" type="button" value="getUrl" onclick="getUrlParamterDemo()" /><br />
            <input id="Button3" type="button" value="delegate" onclick="delegate()" /><br />>
            <input id="Button5" type="button" value="is" onclick="isTest()" /><br />
            <input id="Button7" type="button" value="JsonSerialize" onclick="jsonSerializeTest()" /><br />
            <input id="Button10" type="button" value="addHoursTest" onclick="addHoursTest()" />
        </div>
    </form>
</body>
</html>