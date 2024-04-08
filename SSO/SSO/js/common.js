
function ElById(id) {
    return document.getElementById(id);
}

function parentElById(id) {
    return parent.document.getElementById(id);
}

function ElByName(name) {
    return document.getElementsByName(name);
}

function ElByClass(classname) {
    return document.getElementsByClassName(classname);
}

function ElByTag(tagname) {
    return document.getElementsByTagName(tagname);
}

function deleteHtmlTag(str) {
    str = str.replace(/<[^>]+>|&[^>]+;/g, "").trim();
    return str;
}

function deleteDoubleQuote(str) {  //去除雙引號
    return str.replace(/\"/g, "");
}

function deleteSingleQuote(str) {  //去除單引號
    return str.replace(/\'/g, "");
}

function openColorbox(o) {
    $.colorbox({
        href: o.url
        , iframe: true
        , transition: "elastic"
        , opacity: "0.7"
        , width: o.width
        , height: o.height
        , overlayClose: false
        , scrolling: o.scroll
        , title: o.title
        , overlay_close: false
        , onClosed: function () { }
    });
    return false;
}