function dictionary() {
    /// <summary>
    /// 字典对象
    /// </summary>
}
dictionary.prototype.toArray = function () {
    /// <summary>
    /// 字典扩展方法
    /// </summary>
    /// <returns type=""></returns>
    var array = new Array();
    var temp = this;
    temp.forIn(function (e) { array.push(temp[e]) })
    return array;
}

dictionary.prototype.forIn = function (code) {
    /// <summary>
    /// 字典扩展方法
    /// </summary>
    /// <param name="code" type="type"></param>
    for (var key in this) {
        if (this[key].constructor.toString().indexOf("Function") > 0)
            continue;
        code(key, this[key]);
    }
}