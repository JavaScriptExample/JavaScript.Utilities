/// <reference path="bootstrap-touchspin/bootstrap.touchspin.js" />

var UITouchSpin = function () {
    /// <summary>
    /// bootstrap-touchspin 扩展JS类库
    /// </summary>
    /// <returns type=""></returns>
    var hanlderCommon = function (inputName, min, max, postfix, decimals) {
        decimals = decimals || 0;
        postfix = postfix || '';
        var _touchspin = $("input[name=" + inputName + "]").TouchSpin({
            min: min,
            max: max,
            step: 1,
            decimals: decimals,
            boostat: 1,
            maxboostedstep: 1,
            postfix: postfix
        });
    }
    return {
        initCommon: function (inputName, min, max, postfix, decimals) {
            /// <summary>
            /// 通用Jquery Touchspin插件初始化函数
            /// </summary>
            /// <param name="inputName" type="type">input name</param>
            /// <param name="min" type="type">最小值</param>
            /// <param name="max" type="type">最大值</param>
            /// <param name="postfix" type="type">后缀</param>
            /// <param name="decimals" type="type">小数点位数</param>
            hanlderCommon(inputName, min, max, postfix, decimals);
        }
    }
}();