﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="LazyEating.UI.Web.Admin.Menu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script type="text/javascript">
    function $(d) {
        return document.getElementById(d);
    }
    function dsp(d, v) {
        if (v == undefined) {
            return d.style.display;
        } else {
            d.style.display = v;
        }
    }
    function sh(d, v) {
        if (v == undefined) {
            if (dsp(d) != 'none' && dsp(d) != '') {
                return d.offsetHeight;
            }
            viz = d.style.visibility;
            d.style.visibility = 'hidden';
            o = dsp(d);
            dsp(d, 'block');
            r = parseInt(d.offsetHeight);
            dsp(d, o);
            d.style.visibility = viz;
            return r;
        } else {
            d.style.height = v;
        }
    }

    s = 7;
    t = 10;
    function ct(d) {
        d = $(d);
        if (sh(d) > 0) {
            v = Math.round(sh(d) / d.s);
            v = (v < 1) ? 1 : v;
            v = (sh(d) - v);
            sh(d, v + 'px');
            d.style.opacity = (v / d.maxh);
            d.style.filter = 'alpha(opacity=' + (v * 100 / d.maxh) + ');';
        } else {
            sh(d, 0);
            dsp(d, 'none');
            clearInterval(d.t);
        }
    }
    function et(d) {
        d = $(d);
        if (sh(d) < d.maxh) {
            v = Math.round((d.maxh - sh(d)) / d.s);
            v = (v < 1) ? 1 : v;
            v = (sh(d) + v);
            sh(d, v + 'px');
            d.style.opacity = (v / d.maxh);
            d.style.filter = 'alpha(opacity=' + (v * 100 / d.maxh) + ');';
        } else {
            sh(d, d.maxh);
            clearInterval(d.t);
        }
    }
    function cl(d) {
        if (dsp(d) == 'block') {
            clearInterval(d.t);
            d.t = setInterval('ct("' + d.id + '")', t);
        }
    }

    function ex(d) {
        if (dsp(d) == 'none') {
            dsp(d, 'block');
            d.style.height = '0px';
            clearInterval(d.t);
            d.t = setInterval('et("' + d.id + '")', t);
        }
    }
    function cc(n, v) {
        s = n.className.split(/\s+/);
        for (p = 0; p < s.length; p++) {
            if (s[p] == v + n.tc) {
                s.splice(p, 1);
                n.className = s.join(' ');
                break;
            }
        }
    }

    function Accordian(d, s, tc) {
        l = $(d).getElementsByTagName('div');
        c = [];
        for (i = 0; i < l.length; i++) {
            h = l[i].id;
            if (h.substr(h.indexOf('-') + 1, h.length) == 'mrc') { c.push(h); }
        }
        sel = null;
        for (i = 0; i < l.length; i++) {
            h = l[i].id;
            if (h.substr(h.indexOf('-') + 1, h.length) == 'header') {
                d = $(h.substr(0, h.indexOf('-')) + '-mrc');
                d.style.display = 'none';
                d.style.overflow = 'hidden';
                d.maxh = sh(d);
                d.s = (s == undefined) ? 7 : s;
                h = $(h);
                h.tc = tc;
                h.c = c;
                h.onclick = function () {
                    for (i = 0; i < this.c.length; i++) {
                        cn = this.c[i];
                        n = cn.substr(0, cn.indexOf('-'));
                        if ((n + '-header') == this.id) {
                            ex($(n + '-mrc'));
                            n = $(n + '-header');
                            cc(n, '__');
                            n.className = n.className + ' ' + n.tc;
                        } else {
                            cl($(n + '-mrc'));
                            cc($(n + '-header'), '');
                        }
                    }
                }
                if (h.className.match(/selected+/) != undefined) { sel = h; }
            }
        }
        if (sel != undefined) { sel.onClick(); }
    }
</script>
<style type="text/css">

body{
 font-size: 12px;
 font-family: Arial, Helvetica, sans-serif;
 text-transform: capitalize;
}
* { margin: 0px; padding: 0px; border: 0px; list-style:none;}
#basic-accordian{
	float:left;
 width:150px;
 height:600px;
 z-index:2;
 padding-top:20px;
 padding-left:20px;
 border-top-style: solid;
 border-bottom-style: solid;
}
.accordion_headings{
 padding:2px;
 cursor:pointer;
 font-weight:bold;
 font-size: 14px;
 line-height: 25px;
 letter-spacing: 1px;
}/*菜单分类行*/
.accordion_child{
 padding-left: 20px;
 padding-bottom: 8px;
}
.accordion_child ul{}
.accordion_child ul li{
 font-size: 12px;
 display: block;
 line-height: 20px;
 display:block;
}
.head{
	height:100px;
	width:100%;
}
.main{
    height:500px;
	padding-left:150px;
	width:100%;
}
 
/*菜单样式结束*/

#basic-accordian{ 
	border-top-color: #999999;
	border-bottom-color: #666666; 
	background-color:#666666;
}
.accordion_headings{ color:#ffffff;}
.accordion_child ul li a{ text-decoration: none; color: #eeeeee; }
.accordion_child ul li a:hover{ color: #FFFFFF; }
.header_highlight{ background-color: #000000; color: #FF0099; }/*当前显示菜单分类样式*/
/*******************************/

    #btnReduct {
        width: 94px;
    }

</style>
</head>
<body onload="new Accordian('basic-accordian',5,'header_highlight');">
<div id="basic-accordian" >
  
    <div id="test1-header" class="accordion_headings" >美食管理</div>
    <div id="test1-mrc">
        <div class="accordion_child">
            <ul>
                <li><a href="FoodList.aspx" target="main">查看全部</a></li>
                <li><a href="FoodType.aspx" target="main">查看分类</a></li>
                <li><a href="FoodAdd.aspx"  target="main">添加美食</a></li>
            </ul>
        </div>
    </div>
    <div id="test2-header" class="accordion_headings" >用户管理</div>
    <div id="test2-mrc">
        <div class="accordion_child">
            <ul>
                <li><a href="UserAdd.aspx" target="main">添加管理员</a></li>
                <li><a href="UserList.aspx" target="main">全部管理员</a></li>
                <li><a href="UserList.aspx" target="main">全部会员</a></li>
            </ul>
        </div>
    </div>
    <div id="test3-header" class="accordion_headings" >订单管理<span id="spanCount1" style="color:Red;" runat="server"></span></div>
    <div id="test3-mrc">
        <div class="accordion_child">
            <ul>
                <li><a href="OrderList.aspx" target="main">全部订单  </a></li>
                <li><a href="OrderList.aspx?orderTypeID=2" target="main">未处理订单<span id="spanCount2" style="color:Red" runat="server"></span></a></li>
                <li><a href="OrderList.aspx?orderTypeID=3" target="main">已完成订单</a></li>
                <li><a href="OrderList.aspx?orderTypeID=1" target="main">未付款订单</a></li>
            </ul>
        </div>
    </div>
</div><!--菜单结束-->
</body>

</html>
