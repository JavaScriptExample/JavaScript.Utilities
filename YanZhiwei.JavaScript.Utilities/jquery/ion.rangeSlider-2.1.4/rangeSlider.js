var UIRangeSlider = function () {
    var hanlderInitCommon = function (inputName, min, max, step, postfix, type, prettifyFactory) {
        step = step || 1;
        type = type || 'single';
        postfix = postfix || '';
        prettifyFactory = prettifyFactory || null;
        $("input[name='" + inputName + "']").ionRangeSlider({
            type: type,
            min: min,
            max: max,
            step: type,
            postfix: postfix,
            grid: true,
            hasGrid: true,
            prettify: function (value) {
                return prettifyFactory != null ? prettifyFactory(value) : value;
            }
        });
    }
    return {
        initCommon: function (inputName, min, max, step, postfix, type, prettifyFactory) {
            hanlderInitCommon(inputName, min, max, step, postfix, type, prettifyFactory);
        }
    }
}();