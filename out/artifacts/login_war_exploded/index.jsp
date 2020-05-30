<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<div>
    <form action="LoginServlet" method="post">
        <div>
            <label>姓名：</label>
            <input type="text" id="name" name="name">
            <span></span>
        </div>
        <button type="submit">提交</button>
    </form>
</div>
</body>
<script src="js/jquery-3.1.1.min.js"></script>
<script>
    /* var nameStr = document.querySelector("#name");
     nameStr.addEventListener("blur", function () {
         var xhr = new XMLHttpRequest();
         var url = "";
         xhr.open("get", url, true);
         xhr.send();
         xhr.onreadystatechange = function () {
             if (xhr.readyState == 4) {
                 if (xhr.status == 200) {
                     var r = xhr.responseText;
                     if (r == "has") {
                         nameStr.nextSibling.nextSibling.innerHTML = "用户名不可用";
                     } else {
                         nameStr.nextSibling.nextSibling.innerHTML = "用户名可用";
                     }
                 }
             } else {
                 //转圈
             }
         }
     })*/

    function ajax(obj) {
        var url = obj.url;
        var method = obj.method;
        if (url.indexOf("?") < 0) {
            url += "?rand" + Math.random();
        } else {
            url += "&rand" + Math.random();
        }
        var data = method == "post" ? obj.data : null;
        if (method == "get") {
            url += "&" + obj.data;
        }
        var xhr = new XMLHttpRequest();
        xhr.open(method, url, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send(data);
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    obj.success(xhr.responseText);
                } else {
                    alert("发生错误代码：" + xhr.status + "错误信息" + xhr.statusText);
                }
            }
        }
    }

    $(function () {
        $("#name").blur(function () {
            var url = $("form").attr("action");
            data = "name=" + $("[name = 'name']").val();
            ajax({
                url: url,
                method: "post",
                data: data,
                success: function (data) {
                    if (data == "null") {          //用户名为空！
                        $("span").text("用户名为空!").css("color", "red");
                    } else if (data == "Has") {   //用户名存在，不能使用。
                        $("span").html(`<svg t="1590753416453" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1989" width="16" height="16"><path d="M512 1023.998046A511.999023 511.999023 0 0 1 312.610948 41.080156a511.999023 511.999023 0 0 1 398.778104 942.839689 508.993158 508.993158 0 0 1-199.389052 40.078201z m0-943.841643C273.534702 80.156403 80.15738 274.53568 80.15738 511.999023s193.377322 431.84262 431.84262 431.84262 431.84262-193.377322 431.84262-431.84262S749.463343 80.156403 512 80.156403z" fill="#d81e06" p-id="1990"></path><path d="M320.626588 743.450636a40.078201 40.078201 0 0 1-28.054741-68.132942l381.744869-381.744869a40.383798 40.383798 0 0 1 57.111437 57.111437L349.683284 731.427176a40.078201 40.078201 0 0 1-29.056696 12.02346z" fill="#d81e06" p-id="1991"></path><path d="M702.371457 743.450636a40.078201 40.078201 0 0 1-28.054741-12.02346L292.571847 349.682307a40.383798 40.383798 0 0 1 57.111437-57.111437l380.742914 382.746824a40.078201 40.078201 0 0 1-28.054741 68.132942z" fill="#d81e06" p-id="1992"></path></svg>`)
                    } else {    //用户名不存在，能使用。
                        $("span").html(`<svg t="1590753311232" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1135" width="16" height="16"><path d="M512 128c51.9 0 102.2 10.1 149.5 30.2 45.7 19.3 86.8 47 122.1 82.3s63 76.4 82.3 122.1c20 47.3 30.2 97.6 30.2 149.5S886 614.3 865.9 661.6c-19.3 45.7-47 86.8-82.3 122.1s-76.4 63-122.1 82.3c-47.3 20-97.6 30.2-149.5 30.2S409.8 886.1 362.5 866c-45.7-19.3-86.8-47-122.1-82.3s-63-76.4-82.3-122.1c-20-47.3-30.2-97.6-30.2-149.5s10.1-102.2 30.2-149.5c19.3-45.7 47-86.8 82.3-122.1s76.4-63 122.1-82.3C409.8 138.1 460.1 128 512 128m0-64C264.6 64 64 264.6 64 512s200.6 448 448 448 448-200.6 448-448S759.4 64 512 64z" fill="green" p-id="1136"></path><path d="M632.8 403.7c-8.2 0-16.4 3.1-22.6 9.3L480.7 542.5l-67-67c-6.2-6.2-14.4-9.3-22.6-9.3-8.2 0-16.4 3.1-22.6 9.3-12.4 12.4-12.4 32.8 0 45.3l84.4 84.4c1.3 2.1 2.8 4.1 4.6 5.9 4.8 4.8 10.8 7.8 17.1 8.9 2.3 0.5 4.7 0.8 7.1 0.8 8.2 0 16.4-3.1 22.6-9.3 2.2-2.2 4-4.7 5.5-7.3l145.7-145.7c12.4-12.4 12.4-32.8 0-45.3-6.2-6.4-14.4-9.5-22.7-9.5z" fill="#000000" p-id="1137"></path></svg>`)
                    }
                }
            })
        });
    })
</script>
</html>
