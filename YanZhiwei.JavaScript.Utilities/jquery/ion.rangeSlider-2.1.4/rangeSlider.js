var UIRangeSlider = function () {
    var hanlderInitCommon = function (inputName, min, max, step, postfix, type) {
        step = step || 1;
        type = type || 'single';
        postfix = postfix || '';
        $("input[name='" + inputName + "']").ionRangeSlider({
            type: type,
            min: min,
            max: max,
            step: type,
            postfix: postfix,
            grid: true,
            hasGrid: true,
            prettify: function (value) {
                return value == 255 ? "无级调光" : value;
            }
        });
    }
    return {
        initCommon: function (inputName, min, max, step, postfix, type) {
            hanlderInitCommon(inputName, min, max, step, postfix, type);
        }
    }
}();