<%@ page language="java" import="java.util.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- saved from url=(0062)http://sjz.ycfoodsafety.cn/index.php/spe/publicity/spe_schklog -->
<html lang="zh-cn">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
    <title>食用农产品二维码溯源管理系统|信息公示</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="${pageContext.request.contextPath}/css/default.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/flex.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/js/flexible.js" type="text/javascript"></script>
    <style type="text/css">
        #wrapper {
            position: absolute;
            top: 1.07rem;
            bottom: 0;
            overflow: hidden;
        }

        #scroller {
            position: absolute;
            z-index: 1;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
            width: 100%;
            -webkit-transform: translateZ(0);
            -moz-transform: translateZ(0);
            -ms-transform: translateZ(0);
            -o-transform: translateZ(0);
            transform: translateZ(0);
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            -webkit-text-size-adjust: none;
            -moz-text-size-adjust: none;
            -ms-text-size-adjust: none;
            -o-text-size-adjust: none;
            text-size-adjust: none;
        }

        .pull-action {
            text-align: center;
            height: 1.06rem;
            line-height: 1.06rem;
            color: #817f7f;
        }

        .pull-action .pull-label {
            display: inline-block;
        }

        .pull-action .pull-label i {
            display: inline-block;
            vertical-align: middle;
        }

        .pull-action.loading .pull-label {
            display: none;
        }

        .pull-action .icn-spinner {
            display: none;
        }

        .pull-action.loading .icn-spinner {
            display: block;
        }

        @-webkit-keyframes scale {
            0% {
                -webkit-transform: scale(1);
                transform: scale(1);
                opacity: 1;
            }

            45% {
                -webkit-transform: scale(0.1);
                transform: scale(0.1);
                opacity: 0.7;
            }

            80% {
                -webkit-transform: scale(1);
                transform: scale(1);
                opacity: 1;
            }
        }

        @keyframes scale {
            0% {
                -webkit-transform: scale(1);
                transform: scale(1);
                opacity: 1;
            }

            45% {
                -webkit-transform: scale(0.1);
                transform: scale(0.1);
                opacity: 0.7;
            }

            80% {
                -webkit-transform: scale(1);
                transform: scale(1);
                opacity: 1;
            }
        }

        .icn-spinner {
            display: inline-block;
            position: relative;
        }

        .icn-spinner > div:nth-child(0) {
            -webkit-animation: scale 0.75s 0s infinite cubic-bezier(.2, .68, .18, 1.08);
            animation: scale 0.75s 0s infinite cubic-bezier(.2, .68, .18, 1.08);
        }

        .icn-spinner > div:nth-child(1) {
            -webkit-animation: scale 0.75s 0.12s infinite cubic-bezier(.2, .68, .18, 1.08);
            animation: scale 0.75s 0.12s infinite cubic-bezier(.2, .68, .18, 1.08);
        }

        .icn-spinner > div:nth-child(2) {
            -webkit-animation: scale 0.75s 0.24s infinite cubic-bezier(.2, .68, .18, 1.08);
            animation: scale 0.75s 0.24s infinite cubic-bezier(.2, .68, .18, 1.08);
        }

        .icn-spinner > div:nth-child(3) {
            -webkit-animation: scale 0.75s 0.36s infinite cubic-bezier(.2, .68, .18, 1.08);
            animation: scale 0.75s 0.36s infinite cubic-bezier(.2, .68, .18, 1.08);
        }

        .icn-spinner > div {
            background-color: #817f7f;
            width: .15rem;
            height: .15rem;
            border-radius: 100%;
            margin: .02rem;
            -webkit-animation-fill-mode: both;
            animation-fill-mode: both;
            display: inline-block;
        }

        .table-list td {
            font-size: .24rem;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="navbar">
        <div class="navbar-title">
            <a href="javascript: history.back();">
                <div class="back-btn"><i class="icon-back"></i></div>
            </a>
            <div class="title"><p>食品快检</p></div>
        </div>
    </div>
    <div class="page-content" id="wrapper" style="touch-action: none;">
        <div id="scroller" style="transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, -914px) translateZ(0px);">
            <table class="table-list">
                <thead>
                <tr>
                    <th width="19%">检验品种</th>
                    <th width="40%">检验项目</th>
                    <th width="19%">检验结论</th>
                    <th width="22%">检验日期</th>
                </tr>
                </thead>
                <tbody id="events-list">
                </tbody>
            </table>
            <div class="pull-action" id="pull-up">
                <span class="pull-label"><i class="icon-arrow-down"></i>&nbsp;上拉加载更多</span>
                <div class="icn-spinner">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/iscroll-lite.js" type="text/javascript"></script>
<script>
    (function ($) {
        var EventsList = function (options) {
            var $main = $('#wrapper');
            var $list = $main.find('#events-list');
            var $pullUp = $main.find('#pull-up');
            var $pullLabel = $pullUp.find('.pull-label');

            this.next = this.start = options.params.start;
            this.total = null;

            this.init = function () {
                var myScroll = this.iScroll = new IScroll('#wrapper', {
                    click: true
                });
                var _this = this;
                var pullStart;

                this.URL = this.getURL(options.params);
                this.renderList(options.params.start);

                myScroll.on('scrollStart', function () {
                    pullStart = this.y;
                });

                myScroll.on('scrollEnd', function () {
                    // pull up to load more
                    if (pullStart >= this.y && (this.directionY === 1)) {
                        _this.handlePullUp();
                    }
                });
            };

            this.handlePullUp = function () {
                var _this = this;
                this.next += options.params.count;
                if (this.next < this.total) {
                    setTimeout(function(){
                        _this.renderList(_this.next, 'load');
                    }, 500);
                } else {
                    $pullLabel.html('没有更多了');
                }
            };

            this.getURL = function (params) {
                var queries = [];
                for (var key in  params) {
                    if (key !== 'start') {
                        queries.push(key + '=' + params[key]);
                    }
                }
                queries.push('start=');
                return options.api + '?' + queries.join('&');
            };

            this.renderList = function (start, type) {
                var _this = this;
                _this.setLoading($pullUp);
                $.getJSON(this.URL + start).then(function (data) {
                    _this.total = data.total;
                    var html = [];
                    if (data.list && data.list.length > 0) {
                        $(data.list).each(function (i, item) {
                            var rstClass = 'green';
                            html.push("<tr><td class='blue'>");
                            html.push(item.sampleName);
                            html.push("</td><td>");
                            html.push(item.projectName);
                            html.push("</td><td class='");
                            html.push(rstClass);
                            html.push("'>");
                            html.push(item.result);
                            html.push("</td><td>");
                            html.push(item.detectionDate);
                            html.push("</td></tr>");
                        });
                    }

                    if (type === 'load') {
                        $list.append(html.join(''));
                    } else {
                        $list.html(html.join(''));
                    }

                    if (_this.total < options.params.count) {
                        $pullLabel.hide();
                        _this.next = _this.total + 1;
                    }

                    if ($list.find('tr').length < 1) {
                        $list.html("<tr><td colspan='8'>暂无相关记录.</td></tr>");
                    }

                    // refresh iScroll
                    setTimeout(function () {
                        _this.iScroll.refresh();
                    }, 100);
                }, function () {
                    console.log('Error...');
                }).always(function () {
                    _this.resetLoading($pullUp);

                });
            };

            this.setLoading = function ($el) {
                $el.addClass('loading');
            };

            this.resetLoading = function ($el) {
                $el.removeClass('loading');
            };
        };

        $(function () {
            var app = new EventsList({
                api: "${pageContext.request.contextPath}/foodQuickCheck/selectfindQuickCheck.do",//换成咱们自己的地址
                params: {
                    start: 0,
                    count: 15,
                    qyname:"${qyname}"
                }
            });
            setTimeout(function () {
                app.init();
            }, 200);
        });

        document.addEventListener('touchmove', function (e) {
            e.preventDefault();
        }, false);
    })(window.jQuery);
</script>

</body></html>