<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0"/>
    <link rel="stylesheet" type="text/css" href="static/play/css/reset.css"/>
    <link rel="stylesheet" href="static/play/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="static/play/css/willesPlay.css"/>
    <script src="static/play/js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="static/play/js/willesPlay.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div id="willesPlay">
                <div class="playHeader">
                    <div class="videoName">Tara - 懂的那份感觉</div>
                </div>
                <div class="playContent">
                    <div class="turnoff">
                        <ul>
                            <li><a href="javascript:;" title="关灯"
                                   class="btnLight on glyphicon glyphicon-sunglasses"></a></li>
                        </ul>
                    </div>
                    <video width="100%" height="100%" id="playVideo">
                        <source src="<%=basePath%>${videoPath}" type="video/mp4"></source>
                        当前浏览器不支持 video直接播放，点击这里下载视频： <a href="/">下载视频</a>
                    </video>
                    <div class="playTip glyphicon glyphicon-play"></div>
                </div>
                <div class="playControll">
                    <div class="playPause playIcon"></div>
                    <div class="timebar">
                        <span class="currentTime">0:00:00</span>
                        <div class="progress">
                            <div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar"
                                 aria-valuemin="0" aria-valuemax="100" style="width: 0%"></div>
                        </div>
                        <span class="duration">0:00:00</span>
                    </div>
                    <div class="otherControl">
                        <span class="volume glyphicon glyphicon-volume-down"></span>
                        <span class="fullScreen glyphicon glyphicon-fullscreen"></span>
                        <div class="volumeBar">
                            <div class="volumewrap">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuemin="0"
                                         aria-valuemax="100" style="width: 8px;height: 40%;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
