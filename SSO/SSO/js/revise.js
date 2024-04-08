
function Service() {
    var depts = ElByTag("input");
    var strdepts = "";

    for (var i = 0; i < depts.length; i++) {
        if (depts[i].type === "checkbox") {
            if (depts[i].checked) {
                strdepts += depts[i].value + ",";
            }
        }
    }

    ElById("hservice").value = strdepts.substring(0, strdepts.length-1);
}

function isDevice() {
    var rt = ElByName("radio_type");
    var location = ElById("location");
    var devicename = ElById("devicename");
    var tagno = ElById("tagno");

    if (rt[0].checked) {
        ElById("hdevice").value = "1";

        location.readOnly = true;
        devicename.readOnly = true;
        tagno.readOnly = true;
    }
    else {
        ElById("hdevice").value = "0";

        location.readOnly = false;
        devicename.readOnly = false;
        tagno.readOnly = true;
    }
}

function toSave(ins, me) {
    if (ins) {
        if (confirm('確認儲存?(儲存將產生請修單號)')) {
            if (!check(ins, "1")) {
                return false;
            }
            return true;
        }
        return false;
    }
    else {
        if (confirm('確認儲存?')) {
            if (!check(ins, "1")) {
                return false;
            }
            return true;
        }
        return false;
    }
}

function toSign(ins, me) {
    if (confirm('確認送簽?')) {
        if (!check(ins, "0")) {
            return false;
        }
        return true;
    }
    return false;
}

function btnDisabled(id) {
    ElById(id).disabled = true;
}

function openDept() {
    var o = new Object();

    o.url = "dept.aspx";
    o.width = "90%";
    o.height = "550px";
    o.scroll = false;
    o.title = "組織架構";

    openColorbox(o);
}

function Apply(name, code) {
    ElById("tbApply").value = name;
    ElById("hApply").value = code;
}

function getApplicant(me) {
    if (me.value !== "") {
        $.ajax({
            url: "ashx/getApplicant.ashx",
            async: false,
            dataType: 'json',
            type: 'POST',
            data: {
                empno: me.value
            },
            error: function (xhr) {

            },
            success: function (response) {
                if (response.applicant === "") {
                    alert("無此工號人員。");
                    me.value = "";
                    ElById("tbCName").value = "";
                    ElById("tbApply").value = "";
                    ElById("hApply").value = "";
                }
                else {
                    ElById("tbCName").value = response.applicant;
                    ElById("tbApply").value = response.dept_name;
                    ElById("hApply").value = response.dept_code;
                }
            }
        });
    }
    else {
        ElById("tbCName").value = "";
        ElById("tbApply").value = "";
        ElById("hApply").value = "";
    }
}

function checkFileUpload() {
    if (ElById("fu_attach").value === "") {
        alert("請選擇檔案。");
        return false;
    }
    else {
        file_upload();
    }
    return true;
}

function checkFileUpload2() {
    if (ElById("fu_attach").value === "") {
        alert("請選擇檔案。");
        return false;
    }
    else {
        file_upload2();
    }
    return true;
}

function file_upload() {
    var files = document.getElementById("fu_attach").files;
    var formData = new FormData(document.getElementById('form1'));

    ElById("h檔名").value = files[0].name;

    $.ajax({
        url: "ashx/fu.ashx",
        async: false,
        contentType: false,
        processData: false,
        type: 'POST',
        data: formData,
        error: function (xhr) {
            //alert("error");
        },
        success: function (response) {
            //alert("success");
        }
    });
}

function file_upload2() {
    var files = document.getElementById("fu_attach").files;
    var formData = new FormData(document.getElementById('form1'));

    ElById("h檔名").value = files[0].name;

    $.ajax({
        url: "../ashx/fu2.ashx",
        async: false,
        contentType: false,
        processData: false,
        type: 'POST',
        data: formData,
        error: function (xhr) {
            //alert("error");
        },
        success: function (response) {
            ElById("LinkButton2").click();
        }
    });
}

function updateHidden1(val) {
    ElById("Hidden1").value = val;
}

function update_radio_type(val) {
    var radiotype = ElByName("radio_type");
    if (val === "True") {
        radiotype[0].checked = true;
    }
    else {
        radiotype[1].checked = true;
    }

    isDevice();
}

function check(isins, issave) { //欄位檢查
    ElById("h儲存").value = issave;

    if (ElById("fu_attach").value !== "") {
        alert("請先上傳附件。");
        return false;
    }

    return true;
}

function btn4Click() {
    ElById("Button4").click();
}

function btn4Check() {
    if (ElById("DropDownList5").value === "") {
        alert("請選擇單號。");
        return false;
    }

    return true;
}

function copyAdd(id) {
    ElById("copyadd").href = "modify.aspx?id=" + id;
    ElById("copyadd").click();
}

function checkAuth(type, me) {
    var msg = "";
    var memo = "";
    var id = me.getAttribute("CommandArgumen");

    if (type === "1") {
        msg = "確認核准?";
    }
    else if (type === "2") {
        msg = "確認駁回?";
        memo = me.parentElement.parentElement.children[1].value;
        if (memo === "") {
            alert("駁回原因須填寫。");
            return false;
        }
    }
    else if (type === "3") {
        msg = "確認刪單?";
        memo = me.parentElement.parentElement.children[1].value;
        if (memo === "") {
            alert("刪單原因須填寫。");
            return false;
        }
    }

    if (confirm(msg)) {
        $.ajax({
            url: "ashx/authorize.ashx",
            async: false,
            dataType: 'json',
            type: 'POST',
            data: {
                id: id,
                type: type,
                memo: memo
            },
            error: function (xhr) {

            },
            success: function (response) {
                if (response.result === "success") {
                    ElById("LinkButton1").click();
                }
            }
        });

        return false;
    }
    return false;
}

function sendBack(me, id) {
    var memo = me.parentElement.children[1];
    if (memo.value === "") {
        memo.focus();
        alert("退單說明須填寫。");
        return false;
    }

    $.ajax({
        url: "../ashx/sendBack.ashx",
        async: false,
        dataType: 'json',
        type: 'POST',
        data: {
            id: id,
            memo: memo.value
        },
        error: function (xhr) {

        },
        success: function (response) {
            if (response.result === "success") {
                ElById("LinkButton1").click();
            }
        }
    });

    return false;
}

function assign(me, id) {
    var emp = me.parentElement.children[1];
    if (emp.value === "") {
        alert("請選擇 負責人。");
        return false;
    }

    $.ajax({
        url: "../ashx/assign.ashx",
        async: false,
        dataType: 'json',
        type: 'POST',
        data: {
            id: id,
            empno: emp.value
        },
        error: function (xhr) {

        },
        success: function (response) {
            if (response.result === "success") {
                ElById("LinkButton1").click();
            }
        }
    });

    return false;
}

function check2(msg) {
    if (confirm(msg)) {
        if (ElById("DropDownList1").value === "") {
            alert("請選擇 建議轉送單位。");
            return false;
        }

        if (ElById("TextBox5").value.trim() === "") {
            alert("轉單原因必填。");
            ElById("TextBox5").focus();
            return false;
        }

        return true;
    }
    return false;
}

function check3(msg) {
    if (confirm(msg)) {
        if (ElById("DropDownList1").value === "") {
            alert("請選擇 狀態。");
            return false;
        }

        if (ElById("TextBox4").value.trim() === "") {
            alert("請選擇 預計開工日。");
            return false;
        }

        if (ElById("TextBox6").value.trim() === "") {
            alert("請選擇 預計完工日。");
            return false;
        }

        if (ElById("TextBox7").value.trim() === "") {
            alert("執行進度及內容記錄必填。");
            ElById("TextBox7").focus();
            return false;
        }

        return true;
    }
    return false;
}

function check4(me, id) {
    if (confirm("確認完工送簽?")) {
        var memo = me.parentElement.children[1];

        $.ajax({
            url: "../ashx/endmemo.ashx",
            async: false,
            dataType: 'json',
            type: 'POST',
            data: {
                id: id,
                memo: memo.value
            },
            error: function (xhr) {

            },
            success: function (response) {
                if (response.result === "success") {
                    ElById("LinkButton1").click();
                }
            }
        });
        
        return false;
    }
    return false;
}

function check5(me, id) {
    if (confirm("確認退回負責人?")) {
        var memo = me.parentElement.children[1];

        $.ajax({
            url: "../ashx/backmemo.ashx",
            async: false,
            dataType: 'json',
            type: 'POST',
            data: {
                id: id,
                memo: memo.value
            },
            error: function (xhr) {

            },
            success: function (response) {
                if (response.result === "success") {
                    ElById("LinkButton1").click();
                }
            }
        });

        return false;
    }
    return false;
}

function sbReason(me, id) {
    var reason = me.parentElement.children[1];
    if (reason.value === "") {
        alert("退單原因說明必填。");
        return false;
    }

    $.ajax({
        url: "../ashx/sendBack.ashx",
        async: false,
        dataType: 'json',
        type: 'POST',
        data: {
            id: id,
            memo: reason.value
        },
        error: function (xhr) {

        },
        success: function (response) {
            if (response.result === "success") {
                alert("修改成功。");
            }
        }
    });

    return false;
}

function checkChange(agree, me, id) {
    var dept = me.parentElement.parentElement.parentElement.children[2].children[0].children[0];
    var _agree = agree === true ? 1 : 0;

    if (dept.value === "") {
        alert("請選擇 轉送單位。");
        return false;
    }

    if (agree) {
        if (confirm('確認轉單?')) {
            toChange(_agree, id, dept.value);
            return false;
        }
        return false;
    }
    else {
        if (confirm('確認不轉單?')) {
            toChange(_agree, id, dept.value);
            return false;
        }
        return false;
    }
}

function toChange(agree, id, dept) {
    $.ajax({
        url: "../ashx/change.ashx",
        async: false,
        dataType: 'json',
        type: 'POST',
        data: {
            agree: agree,
            id: id,
            dept: dept
        },
        error: function (xhr) {

        },
        success: function (response) {
            if (response.result === "success") {
                ElById("LinkButton1").click();
            }
        }
    });    
}

function reassign(me, id) {
    var emp = me.parentElement.children[1];
    if (emp.value === "") {
        alert("請選擇 負責人。");
        return false;
    }

    $.ajax({
        url: "../ashx/reassign.ashx",
        async: false,
        dataType: 'json',
        type: 'POST',
        data: {
            id: id,
            empno: emp.value
        },
        error: function (xhr) {

        },
        success: function (response) {
            if (response.result === "success") {
                ElById("LinkButton1").click();
            }
        }
    });

    return false;
}