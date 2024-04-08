
function check(me, ins) {
    var tr = me.parentNode.parentNode.parentNode;

    if (ins) {
        if (confirm('是否新增資料?')) {
            if (tr.children[0].children[0].value === "" ||
                tr.children[1].children[0].value === "") {
                alert("* 欄位不可空白。");
                return false;
            }
            return true;
        }
        return false;
    }
    else {
        if (tr.children[0].children[0].value === "" ||
            tr.children[1].children[0].value === "") {
            alert("* 欄位不可空白。");
            return false;
        }
        return true;
    }
}