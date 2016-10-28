/// <reference path="../jquery-1.6.4.js" />

(function (window) {
    jQuery.fn.extend({
        disable: function (state) {
            return this.each(function () {
                this.disabled = state;
            });
        },
        attrs: function () {
            /// <summary>
            /// 获得所有属性
            /// </summary>
            var _attributes = {};
            $.each(this.get(0).attributes, function (i, attrib) {
                _attributes[attrib.name] = attrib.value;
            });
            return _attributes;
        }
    });
    jqUtils = {}
    jqUtils.UISelect = {
        getText: function (id, hanlder) {
            /// <summary>
            /// 获取html select 选中文本
            /// </summary>
            /// <param name="id"></param>
            var _length = arguments.length;
            var _text = $("#" + id).find("option:selected").text();
            if (_length == 1) {
                return _text;
            }
            if (_length == 2) {
                return hanlder(_text);
            }
        },
        setOptionByText: function (id, filterText, fireEvent) {
            /// <summary>
            /// 根据文本选中option
            /// </summary>
            /// <param name="id">Id</param>
            /// <param name="filterText">需要选中的文本</param>
            /// <param name="fireEvent">是否触发change事件；布尔类型</param>
            var _argument = arguments.length;
            if (_argument == 2)
                $("#" + id + " option:contains(" + filterText + ")").attr('selected', 'selected');
            if (_argument == 3 && fireEvent == true)
                $("#" + id + " option:contains(" + filterText + ")").attr('selected', 'selected').trigger('change');
        }
    }
    jqUtils.UICheckbox = {
        isChecked: function (id) {
            /// <summary>
            /// 获取html checkbox是否选中
            /// </summary>
            /// <param name="id">若选中则返回true;否则则返回false</param>
            return $("#" + id).attr("checked") == 'checked';
        },
        getAllStatus: function (array) {
            /// <summary>
            /// 获取一组CheckedBox选中状态
            /// 若选中则返回1,否则返回0
            /// </summary>
            /// <param name="array">eg:var _array=new Array();_array.push('gp1Ck1');_array.push('gp1Ck2');_array.push('gp1Ck3')</param>
            var _statusArray = new Array();
            for (var i = 0; i < array.length; i++) {
                var _ckId = array[i];
                _statusArray.push(jqUtils.UICheckbox.isChecked(_ckId) == true ? 1 : 0);
            }
            return _statusArray;
        },
        getAllStatusByPrefix: function (prefix, count) {
            /// <summary>
            /// 获取一组CheckedBox选中状态
            /// 若选中则返回1,否则返回0
            /// </summary>
            /// <param name="prefix">ckeckbox前缀，譬如gp1ck</param>
            /// <param name="count">需要获取checkbox状态数量</param>
            var _ckGroup = new Array();
            for (var i = 1; i <= count; i++) {
                _ckGroup.push(prefix + i);
            }

            return jqUtils.UICheckbox.getAllStatus(_ckGroup);
        }
    }
    jqUtils.UIRadio = {
        getValueByName: function (name) {
            /// <summary>
            /// 根据Name获取一组Radio中选中值
            /// </summary>
            /// <param name="name"></param>
            var _radioGroup = $('input[name=' + name + ']');
            var _checkedValue = _radioGroup.filter(':checked').val();
            return _checkedValue;
        }
    }
    jqUtils.UITable = {
        getObj: function (id) {
            /// <summary>
            /// 获取Table对象
            /// </summary>
            /// <param name="id">Table ID</param>
            var _table = $('#' + id + ' > tbody > tr').map(function () {
                return $(this).children().map(function () {
                    return $(this);
                });
            });
            return _table;
        },
        setCellValue: function (id, rowIndex, cellIndex, cellValue) {
            /// <summary>
            /// 设置单元格的值
            /// </summary>
            /// <param name="id">Table ID</param>
            /// <param name="rowIndex">行索引，从零开始</param>
            /// <param name="cellIndex">列索引，从零开始</param>
            /// <param name="cellValue">列值</param>
            var _tableObj = jqUtils.UITable.getObj(id);
            if (_tableObj.length > 0) {
                _tableObj[rowIndex][cellIndex].html(cellValue);
            }
        },
        createHeaderRow: function (id, json) {
            /// <summary>
            /// 创建Table Header
            /// </summary>
            /// <param name="id">table id</param>
            /// <param name="json">json数据</param>
            /// <returns type="">Table Header Header</returns>
            var columnSet = [];
            var headerTr$ = $('<tr/>');
            for (var i = 0; i < json.length; i++) {
                var rowHash = json[i];
                for (var key in rowHash) {
                    if ($.inArray(key, columnSet) == -1) {
                        columnSet.push(key);
                        headerTr$.append($('<th/>').html(key));
                    }
                }
            }
            $("#" + id).append(headerTr$);
            return columnSet;
        },
        createTable: function (id, json) {
            /// <summary>
            /// 创建Table
            /// </summary>
            /// <param name="id">table id</param>
            /// <param name="json">json数据</param>
            var columns = this.createHeaderRow(id, json);
            for (var i = 0; i < json.length; i++) {
                var row$ = $('<tr/>');
                for (var colIndex = 0; colIndex < columns.length; colIndex++) {
                    var cellValue = json[i][columns[colIndex]];
                    if (cellValue == null) { cellValue = ""; }
                    row$.append($('<td/>').html(cellValue));
                }
                $("#" + id).append(row$);
            }
        }
    }
    window.jqUtils = jqUtils;
})(window);

jQuery.extend({
    getJSONExt: function (url, paramter, successed) {
        /// <summary>
        /// $.getJSON扩展
        /// </summary>
        /// <param name="url" type="type">请求连接</param>
        /// <param name="paramter" type="type">请求参数</param>
        /// <param name="successed" type="type">成功callback</param>
        if (url.indexOf("?") > 0) {
            url = url + "&_t=" + Math.random();
        } else {
            url = url + "?_t=" + Math.random();
        }
        $.getJSON(url, paramter, function (data, textStatus, jqxhr) {
            if (jqxhr.status == 200) {
                if (data.Type == "Success") {
                    successed(data.Data);
                }
                else {
                    bootbox.alert(data.Content);
                }
            }
            else {
                bootbox.alert("请求发生故障或者错误，请重试！");
            }
        });
    },
    postExt: function (url, paramter, successed) {
        $.post(url, paramter, function (data, textStatus, jqxhr) {
            if (jqxhr.status == 200) {
                if (data.Type == "Success") {
                    successed(data.Data);
                }
                else {
                    bootbox.alert(data.Content);
                }
            }
            else {
                bootbox.alert("请求发生故障或者错误，请重试！");
            }
        }, "json")
    }
});