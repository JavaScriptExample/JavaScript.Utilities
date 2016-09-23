<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dictionaryDemo.aspx.cs" Inherits="YanZhiwei.JavaScript.Utilities.dictionaryDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="dictionary.js"></script>
    <script>

        function dictionaryToArrayTest() {
            var _dic = new dictionary();
            _dic["2"] = "bb";
            _dic["4"] = "dd";
            _dic["1"] = "aa";
            _dic["3"] = "cc";
            var _array = _dic.toArray();
            for (var i = 0; i < _array.length; i++) {
                console.log(_array[i])
            }
        }
        function dictionaryforInTest() {
            var _dic = new dictionary();
            _dic["2"] = "bb";
            _dic["4"] = "dd";
            _dic["1"] = "aa";
            _dic["3"] = "cc";
            _dic.forIn(function (key, value) {
                console.log("key:" + key + " Value:" + value)
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input id="Button8" type="button" value="DictionaryToArray" onclick="dictionaryToArrayTest()" /><br />
            <input id="Button9" type="button" value="DictionaryforInTest" onclick="dictionaryforInTest()" /><br />
        </div>
    </form>
</body>
</html>
