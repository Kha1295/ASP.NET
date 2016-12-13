/*
 * Author: Abdullah A Almsaeed
 * Date: 4 Jan 2014
 * Description:
 *      This is a demo file used only for the main dashboard (index.html)
 **/
"use strict";
var strRole = "/Admin/SharedFuntion/";
var ch = ".hc";
var loading = "<div class='overlay'> <i class='fa fa-refresh fa-spin'></i> </div>";
$(function () {
    $(".connectedSortable .box-header, .connectedSortable .nav-tabs-custom").css("cursor", "move");
    //SLIMSCROLL FOR CHAT WIDGET
    $('#chat-box').slimScroll({ height: '250px' });
    $('.body-box-270').slimScroll({ height: '270px' });
    $('#box-scroll').slimScroll({ height: '350px' });
    $('.box-scroll').slimScroll({ height: '450px' });
    $('.box-scroll1').slimScroll({ height: '450px' });
    $('.box-scroll-500').slimScroll({ height: '500px' });
    //$('.ms-text-date').datepicker({ format: 'dd/mm/yyyy' }).on('changeDate', function (e) { $(this).next().val(e.format('mm/dd/yyyy')); });
    $('[data-toggle="popover"]').popover({
        html: true

    });
    $('.ms-text-date').datepicker({ format: 'dd/mm/yyyy', startDate: "-2d", language: "vi", todayBtn: true, autoclose: true }).on('changeDate', function (e) { $(this).next().val(e.format('mm/dd/yyyy')); });
    $('.ms-text-date1').datepicker({ format: 'dd/mm/yyyy', language: "vi", todayBtn: true, autoclose: true }).on('changeDate', function (e) { $(this).next().val(e.format('mm/dd/yyyy')); });
    //$('.ms-text-date').datetimepicker( );
    $(".select2").select2();
    $("span.select2").attr("style", "width: 100%;");
    $(".ms-money").number(true, 0);
    $(".ms-money-input").number(true, 2);
    //Fix for charts under tabs
    $('.box ul.nav a').on('shown.bs.tab', function (e) { });//area.redraw();//donut.redraw();
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({ checkboxClass: 'icheckbox_flat-green', radioClass: 'iradio_flat-green' });
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({ checkboxClass: 'icheckbox_minimal-blue', radioClass: 'iradio_minimal-blue' });
    $('.modal-default-content').slimScroll({ height: '350px', allowPageScroll: true });
    $(".checkbox-toggle").click(function () {
        var clicks = $(this).data('clicks');
        if (clicks) {
            //Uncheck all checkboxes
            $(".mailbox-messages input[type='checkbox']").iCheck("uncheck");
            $(".fa", this).removeClass("fa-check-square-o").addClass('fa-square-o');
        } else {
            //Check all checkboxes
            $(".mailbox-messages input[type='checkbox']").iCheck("check");
            $(".fa", this).removeClass("fa-square-o").addClass('fa-check-square-o');
        }
        $(this).data("clicks", !clicks);
    });

    $("body").on("click", ".ms-image", function () {
        var finder = new CKFinder({ basePath: "http://manage.dlv.vn/Theme/ckfinder/" });
        finder.BasePath = "http://manage.dlv.vn/Theme/ckfinder/";
        var obj = $(this);
        finder.selectActionFunction = function (fileUrl) {
            $(obj).parents(".ms-image-show").find("input").val(fileUrl);
            $(obj).parents(".ms-image-show").find("img").attr("src", fileUrl);
        };
        finder.popup();
    });
    $("body").on("click", ".ms-image-view", function () {
        var url = $(this).parents(".ms-image-show").find("input").val();
        var str = "<img src='" + url + "' alt='" + url + "'/>";
        LoadModalDefault("Hình ảnh", str);
    });
    $("body").on("click", ".btn-2", function () {
        var url = $(this).parents("li").find(".ImageD").val();
        var str = "<img src='" + url + "' alt='" + url + "'/>";
        LoadModalDefault("Hình ảnh", str);
    });
    $("body").on("click", ".btn-1", function () {
        var url = $(this).parents("li").remove();
    });

    $(".ms-image-munti").click(function () {
        var str = "<li class='box-!i!'>" +
            "<div class='box box-primary direct-chat direct-chat-primary no-margin'>" +
            "<div class='box-header with-border'>" +
            "<span class='box-title'><i class='fa fa-camera'></i> </span>" +
            "<div class='box-tools pull-right'>" +
            "<button type='button' data-widget='collapse' class='btn btn-default btn-xs' data-toggle='tooltip' data-original-title='Thu nhỏ'><i class='fa fa-minus'></i></button> " +
            "<button type='button' data-widget='chat-pane-toggle' class='chat-pane-toggle-1 btn btn-default btn-xs' data-toggle='tooltip' data-original-title='Thông tin ảnh'><i class='fa fa-edit'></i></button> " +
            "<button type='button' data-widget='remove' class='btn btn-danger btn-xs ms-bnt-remove-image' data-index='!i!' data-toggle='tooltip' data-original-title='Xóa ảnh'><i class='fa fa-times'></i></button> " +
            "</div>" +
            "</div>" +
            "<div class='box-body' style='display: block;'>" +
            "<div class='direct-chat-messages'>" +
            "<span class='mailbox-attachment-icon has-img'><img alt='' src='[srcImg]'></span>" +
            "</div>" +
            "<div class='direct-chat-contacts direct-chat-contacts-custom '>" +
            "<div class='box-scroll'>" +
             "<div class='form-group ms-image-show' ><label>Ảnh decktop</label><div class='input-group'><input class='product-image-name-!i! form-control' value=' ' name='NewsImageD' readonly='readonly' placeholder='Ảnh decktop' /><span class='input-group-addon ms-image' data-length='150' data-toggle='tooltip' data-original-title='Chọn ảnh'><i class='fa fa-photo'></i></span></div></div>" +
            "<div class='form-group ms-image-show' ><label>Ảnh mobile</label><div class='input-group'><input class='product-image-name-!i! form-control' value=' ' name='NewsImageM' readonly='readonly' placeholder='Ảnh mobile' /><span class='input-group-addon ms-image' data-length='150' data-toggle='tooltip' data-original-title='Chọn ảnh'><i class='fa fa-photo'></i></span></div></div>" +
         "<div class='form-group'><label>Alt</label><input name='NewsName' class='form-control' placeholder='Alt' value=' ' /></div>" +
            "<div class='form-group'><label>Link</label><input name='NewsLink' class='form-control' placeholder='Link' value=' '  /></div>" +
            "<div class='form-group'><label>Mô tả</label><textarea name='NewsNode' class='form-control' placeholder='Mô tả'> </textarea></div>" +
            "</div>" +
            "</div>" +
            "</div>" +
            "</div>" +
            "</li>";
        var obj = $(".ms-image-munti-content");
        var finder = new CKFinder();
        //finder.callBackMultiple = function (fileUrl) {
        //    for (var i = 0; i < files.length; i++)
        //        console.log(files[i]);
        //};
        var i = obj.find("li").length;
        finder.selectActionFunction = function (fileUrl) {
            str = str.replace("[srcImg]", fileUrl).replace("[srcImg]", fileUrl);
            str = str.replace("[i]", "" + i + "").replace("!i!", "" + i + "").replace("!i!", "" + i + "").replace("!i!", "" + i + "").replace("!i!", "" + i + "").replace("[i]", "[" + i + "]").replace("[i]", "[" + i + "]");

            $(obj).append(str);
            $(".product-image-name-" + i).val(fileUrl);

            InitBoxImage();
        };
        finder.popup();
    });
    $(".ms-image-munti1").click(function () {
        var str = "<li class='box-!i!'>" +
            "<div class='box box-primary direct-chat direct-chat-primary no-margin'>" +
            "<div class='box-header with-border'>" +
            "<span class='box-title'><i class='fa fa-camera'></i> </span>" +
            "<div class='box-tools pull-right'>" +
            "<button type='button' data-widget='collapse' class='btn btn-default btn-xs' data-toggle='tooltip' data-original-title='Thu nhỏ'><i class='fa fa-minus'></i></button> " +
            "<button type='button' data-widget='chat-pane-toggle' class='chat-pane-toggle btn btn-default btn-xs' data-toggle='tooltip' data-original-title='Thông tin ảnh'><i class='fa fa-edit'></i></button> " +
            "<button type='button' data-widget='remove' class='btn btn-danger btn-xs ms-bnt-remove-image' data-index='!i!' data-toggle='tooltip' data-original-title='Xóa ảnh'><i class='fa fa-times'></i></button> " +
            "</div>" +
            "</div>" +
            "<div class='box-body' style='display: block;'>" +
            "<div class='direct-chat-messages'>" +
            "<span class='mailbox-attachment-icon has-img'><img alt='' src='[srcImg]'></span>" +
            "</div>" +
            "<div class='direct-chat-contacts direct-chat-contacts-custom '>" +
            "<div class='box-scroll'>" +
            "<div class='form-group ms-image-show' ><label>Ảnh decktop</label><div class='input-group'><input class='product-image-name-!i! form-control' name='ProductImageName' readonly='readonly' placeholder='Ảnh decktop' /><span class='input-group-addon ms-image' data-length='150' data-toggle='tooltip' data-original-title='Chọn ảnh'><i class='fa fa-photo'></i></span></div></div>" +
            "<div class='form-group ms-image-show' ><label>Ảnh mobile</label><div class='input-group'><input class='product-image-name-!i! form-control' name='ProductImageNameM' readonly='readonly' placeholder='Ảnh mobile' /><span class='input-group-addon ms-image' data-length='150' data-toggle='tooltip' data-original-title='Chọn ảnh'><i class='fa fa-photo'></i></span></div></div>" +
            "<div class='form-group'><label>Alt</label><input name='ProductImageAlt' class='form-control' placeholder='Alt' /></div>" +
            "<div class='form-group'><label>Link</label><input name='ProductImageLink' class='form-control' placeholder='Link' /></div>" +
            "<div class='form-group'><label>Mô tả</label><textarea name='ProductImageNote' class='form-control' placeholder='Mô tả'></textarea></div>" +
            "</div>" +
            "</div>" +
            "</div>" +
            "</div>" +
            "</li>";
        var obj = $(".ms-image-munti-content");
        var finder = new CKFinder();
        //finder.callBackMultiple = function (fileUrl) {
        //    for (var i = 0; i < files.length; i++)
        //        console.log(files[i]);
        //};
        var i = obj.find("li").length;
        finder.selectActionFunction = function (fileUrl) {
            str = str.replace("[srcImg]", fileUrl).replace("[srcImg]", fileUrl);
            str = str.replace("[i]", "" + i + "").replace("!i!", "" + i + "").replace("!i!", "" + i + "").replace("!i!", "" + i + "").replace("!i!", "" + i + "").replace("[i]", "[" + i + "]").replace("[i]", "[" + i + "]");

            $(obj).append(str);
            $(".product-image-name-" + i).val(fileUrl);
            InitBoxImage();
        };
        finder.popup();
    });
    $("body").on("click", ".chat-pane-toggle-1", function () {
        var box = $(this).parents('.direct-chat');
        box.toggleClass('direct-chat-contacts-open');
    });
    $("body").on("click", ".ms-check-date", function () {
        var objDate = $(this).parents(".ms-box-date");
        if ($(this).is(":checked")) {
            $(objDate).find(".ms-text-date").removeAttr("disabled");
            $(objDate).find(".ms-choose-date").addClass("ms-choose-date-show");
        } else {
            $(objDate).find(".ms-text-date").val("");
            $(objDate).find(".ms-text-date").attr("disabled", "disabled");
            $(objDate).find(".ms-choose-date").removeClass("ms-choose-date-show");

        }
    });
    $("body").on("click", ".ms-choose-date-show", function () {
        $(this).prev().prev().focus();
    });
    SetCheckHide();  //Loafd check box
    $(".ms-hide").click(function () {
        if ($(this).is(":checked")) {
            $(this).parents("div.form-group").next().removeClass("hide");
        } else {
            $(this).parents("div.form-group").next().addClass("hide");
        }
    });

    //List image
    $("body").on("click", ".ms-bnt-remove-image", function () {
        var val = $(this).attr("data-value");
        $(".box-" + $(this).attr("data-index")).remove();
        //$.ajax({
        //    url: strRole + "DeleteProductImage",
        //    data: { "id": val },
        //    dataType: 'json',
        //    type: 'GET',
        //    success: function (objAv) {
        //    },
        //    error: function (xhr, ajaxOptions, thrownError) {
        //        //alert('Failed to retrieve books.' + thrownError);
        //    }
        //});
        //Xoa luon
    });
    $("body").on("click", ".ms-bnt-remove-imageA", function () {
        var val = $(this).attr("data-value");
        $(".box-" + $(this).attr("data-index")).remove();
        $.ajax({
            url: strRole + "DeleteAdevertisemenImage",
            data: { "id": val },
            dataType: 'json',
            type: 'GET',
            success: function (objAv) {
            },
            error: function (xhr, ajaxOptions, thrownError) {
                //alert('Failed to retrieve books.' + thrownError);
            }
        });
        //Xoa luon
    });
    $("body").on("click", ".ms-check-status", function () {
        if ($(this).is(":checked")) {
            $(this).parent("span").find(".ms-check-status-text").val($(this).val());
            console.log($(this).parent("span").find(".ms-check-status-text").val());
        } else {
            $(this).parent("span").find(".ms-check-status-text").val(2);
            console.log($(this).parent("span").find(".ms-check-status-text").val());
        }
    });
    //Cho nhạp so
    $("body").on("keypress", ".ms-is-number", function (e) {
        //if the letter is not digit then display error and don't type anything
        if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            //display error message
            //$("#errmsg").html("Digits Only").show().fadeOut("slow");
            return false;
        }

    });
    $(".ms-number-show").keypress(function (e) {
        //if the letter is not digit then display error and don't type anything
        if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            //display error message
            //$("#errmsg").html("Digits Only").show().fadeOut("slow");
            return false;
        }
    });
    $(".ms-number-show").keyup(function () {
        var number = $(this).val().replace(",", "").replace(",", "").replace(",", "").replace(",", "").replace(",", "");
        $(this).next().val(number);
    });
    $(".ms-number-show1").keypress(function (e) {
        //if the letter is not digit then display error and don't type anything
        if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            //display error message
            //$("#errmsg").html("Digits Only").show().fadeOut("slow");
            return false;
        }
    });
    $(".ms-number-show1").keyup(function () {
        var number = $(this).val().replace(",", "").replace(",", "").replace(",", "").replace(",", "").replace(",", "");
        $(this).next().val(number);
    });
    $(".text-input input").keyup(function () {
        var obj = $(this).parent(".text-input").find(".text-input-length");
        $(obj).html(parseInt($(obj).attr("data-length") - $(this).val().length));
    });
    //tính % giảm giá
    $("body").on("keyup", ".ms-number-percent", function () {
        var percent = parseInt($(this).val());
        var price = parseInt($(".ms-number-get-percent-h").val());
        var priceDiscount = price * (percent / 100);
        $(".ms-number-set-percent").val(price - priceDiscount);
        $(".ms-number-set-percent-h").val(price - priceDiscount);
    });
    $("body").on("keyup", ".ms-number-set-percent", function () {
        var price = parseInt($(this).next().val());
        var priceTotal = parseInt($("#ProductListedPrice").val());
        var priceDiscount = ((priceTotal - price) / parseInt($("#ProductListedPrice").val())) * 100;
        $(".ms-number-percent").val(priceDiscount);
        $(".ms-number-percent").next().val(priceDiscount);
    });
    $("body").on("keyup", ".text-attribute", function () {
        var idAttribute = $(this).attr("data-value");
        $(this).next().val(idAttribute + "[#]" + $(this).val());
    });
    $("body").on("click", ".ms-money", function () { });
    $("body").on("click", ".ms-check-custom", function () {
        var str = $(".ms-check-custom-value").val();

        if ($(this).is(":checked")) {
            if (str.search("," + $(this).val() + ",") < 0) {
                $(".ms-check-custom-value").val(str + "," + $(this).val() + ",");
            }
        } else {
            $(".ms-check-custom-value").val(str.replace("," + $(this).val() + ",", ""));
        }
    });
    $("body").on("click", ".ms-save-seting-home", function () {
        var numberProduct = $(".numberProduct").val();
        var level = $(".level").val();
        var categoryPageName = $(".categoryPageName").val();
        var other = $(".other").val();
        var page = $(".page").val();
        var category = $(".category").val();
        var ShowImage = true;
        if ($(".ShowImage").is(":checked")) { ShowImage = true; } else { ShowImage = false; }
        var ShowCompare = true;
        if ($(".ShowCompare").is(":checked")) { ShowCompare = true; } else { ShowCompare = false; }
        var ShowDetail = true;
        if ($(".ShowDetail").is(":checked")) { ShowDetail = true; } else { ShowDetail = false; }
        var ShowPrice = true;
        if ($(".ShowPrice").is(":checked")) { ShowPrice = true; } else { ShowPrice = false; }
        var ShowDiscount = true;
        if ($(".ShowDiscount").is(":checked")) { ShowDiscount = true; } else { ShowDiscount = false; }
        var ShowGift = true;
        if ($(".ShowGift").is(":checked")) { ShowDiscount = true; } else { ShowGift = false; }
        $.ajax({
            url: strRole + "SaveCategoryPagePosition",
            data: {
                "categoryPageName": categoryPageName,
                "numberProduct": numberProduct, "level": level, "other": other, "page": page, "category": category,
                "ShowImage": ShowImage, "ShowCompare": ShowCompare, "ShowDetail": ShowDetail, "ShowPrice": ShowPrice, "ShowDiscount": ShowDiscount, "ShowGift": ShowGift
            },
            dataType: 'json',
            type: 'GET',
            success: function (objAv) {
            },
            error: function (xhr, ajaxOptions, thrownError) {
                //alert('Failed to retrieve books.' + thrownError);
            }
        });
    });
    //show map
    $("body").on("click", ".close-modal", function () {
        $(".box-modal-map").hide();
    });
    $("body").on("click", ".show-map", function () {
        $(".box-modal-map").show();
        var geoCode = $(".code-geo").val().split(',');
        google.maps.event.addDomListener(window, 'load', initialize(geoCode[0], geoCode[1]));
    });
    $("body").on("click", ".bnt-refresh", function () {
        RefreshDropDownList($(this).attr("data-element"), $(this).attr("data-elementfisrt"));
    });
    //alias
    $("body").on("keyup", ".ms-alias", function () {
        var str = LocDau($(this).val());
        str = str.replace(" ", "-").replace(" ", "-").replace(" ", "-").replace(" ", "-");
        $(".ms-alias-show").val(str);
    });
    $("#KeySearch").keyup(function () {
        var _this = this;
        var type = $("#DaintyType").val();
        $.each($("#table tbody tr"), function () {
            var typea = $(this).data("type");
            if (type == "")
                if ($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                    $(this).hide();
                else
                    $(this).show();
            else {
                if ($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                    $(this).hide();
                else
                    if (type == typea) $(this).show(); else $(this).hide();
            }
        });

    });
    $("#DaintyType").change(function () {
        var _this = $("#KeySearch");
        var type = $(this).val();
        $.each($("#table tbody tr"), function () {
            var typea = $(this).data("type");
            if (type == "")
                if ($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                    $(this).hide();
                else
                    $(this).show();
            else {
                if ($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                    $(this).hide();
                else
                    if (type == typea) $(this).show(); else $(this).hide();
            }
        });

    });
    $("body").on("click", ".d-check", function () {
        var tr = $(this).parents("tr");
        var count = $("#table_check tr").length;
        var trd = $(".d-" + $(this).data("value"));
        var test = " <input type='hidden' name='Quantity' value='0' /><input type='hidden' name='DaintyId' value='0' /><input type='hidden' name='PriceDainty' value='0' />";
        var name = "<tr class='d-d d-" + $(this).data("value") + "'>" +
            "<td>" + (count) + "</td>" +
            "<td>" + $(tr).find(".d-code").html() + "</td> " +
            "<td>" + $(tr).find(".d-name").html() + "</td> " +
            "<td>" +
            "<input type='text'  name='Quantity' class='quantity form-control ms-is-number' value='1' /> " +
            "<input type='hidden' name='DaintyId'  value='" + $(this).data("value") + "'/> " +
            "<input type='hidden' name='PriceDainty'  value='" + $(tr).find(".d-price").data("value") + "'/> " +
            "</td>" +
            "<td data-value='" + $(tr).find(".d-price").data("value") + "' class='ms-money'>" + $(tr).find(".d-price").html() + "</td>" +
            " <td><span  class='btn btn-warning btn-sm d-remove'><i class='fa fa-remove'></i></span></td>  " +
            "</tr>";
        if ($(trd).length > 0) {
            $(trd).find(".quantity").val(parseInt($(trd).find(".quantity").val()) + 1);
            $(".input-hide").html("");
        } else {
            $(".input-hide").html(test);
            $("#table_check tr").last().after(name);
        }
        SumPrice();
    });
    $("body").on("click", ".d-remove", function () {
        $(this).parents("tr").remove();
        SumPrice();
    });
    $("body").on("keyup", ".quantity", function () {
        var txt = $(this).val();
        if (txt.trim() == "") {
            $(this).val(1);
        }
    });
    $("body").on("change", ".ms-sort-type", function () {
        var type = $(".ms-sort-type").val();
        $(".ms-sort-ty").hide();
        $(".ms-sort-type-" + type).show();
    });
    // LINE CHART   
    $(".knob").knob({
        /*change : function (value) {
         //console.log("change : " + value);
         },
         release : function (value) {
         console.log("release : " + value);
         },
         cancel : function () {
         console.log("cancel : " + this.value);
         },*/
        draw: function () {
            // "tron" case
            if (this.$.data('skin') == 'tron') {

                var a = this.angle(this.cv)  // Angle
                        , sa = this.startAngle          // Previous start angle
                        , sat = this.startAngle         // Start angle
                        , ea                            // Previous end angle
                        , eat = sat + a                 // End angle
                        , r = true;

                this.g.lineWidth = this.lineWidth;

                this.o.cursor
                        && (sat = eat - 0.3)
                        && (eat = eat + 0.3);

                if (this.o.displayPrevious) {
                    ea = this.startAngle + this.angle(this.value);
                    this.o.cursor
                            && (sa = ea - 0.3)
                            && (ea = ea + 0.3);
                    this.g.beginPath();
                    this.g.strokeStyle = this.previousColor;
                    this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sa, ea, false);
                    this.g.stroke();
                }

                this.g.beginPath();
                this.g.strokeStyle = r ? this.o.fgColor : this.fgColor;
                this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sat, eat, false);
                this.g.stroke();

                this.g.lineWidth = 2;
                this.g.beginPath();
                this.g.strokeStyle = this.o.fgColor;
                this.g.arc(this.xy, this.xy, this.radius - this.lineWidth + 1 + this.lineWidth * 2 / 3, 0, 2 * Math.PI, false);
                this.g.stroke();

                return false;
            }
        }
    });
    /* Chọn lại menu dang xem */
    var url = window.location.href;
    $(".sidebar-menu a").each(function (index) {
        var urls = $(this).attr("href");
        if (url.indexOf(urls) >= 0) {
            $(this).parents("li.treeview").addClass("active");

            $(this).hover();
            $(this).css("color", "#fff");
            return false;
        }
    });
    $(ch + "-check-muster-bnt").click(function () {
        var objC = $(this).parent(".input-group");
        var idM = objC.find(ch + "-id").val();
        var status = objC.find(ch + "-check-muster").val();
        var number = objC.find(ch + "-number").val();
        $.ajax({
            url: "/Api/Home/Admin/Muster/Save",
            data: { "idMuster": idM, "number": number, "value": status },
            dataType: 'text',
            type: 'GET',
            success: function (obj) {
                alert(obj);
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert("Thêm không thành công!");
            }
        });
    });

    var statuLabel = ["", "Có", "Vắng", "Vắng"];
    var statuL = ["", "Có mặt", "Vắng không phép", "Vắng có phép"];
    $(ch + "-check-muster-save").click(function () {
        var objC = $(this).parents("td");
        var idM = objC.find(ch + "-id").val();
        var status = objC.find(ch + "-check-muster").val();
        var number = objC.find(ch + "-number").val();
        $.ajax({
            url: "/Api/Home/Admin/Muster/Save",
            data: { "idMuster": idM, "number": number, "value": status },
            dataType: 'text',
            type: 'GET',
            success: function (obj) {
                $(objC).find(".hc-box-lable").removeClass("hidden");
                $(objC).find(".hc-box-lable-update").addClass("hidden");
                $(objC).find(".hc-box-lable input").attr('data-original-title', statuL[obj]).val(statuLabel[obj]).css("border-color", "#006400");
            },
            error: function (xhr, ajaxOptions, thrownError) {
                $(objC).find(".hc-box-lable input").css("border-color", "#ff0000");
            }
        });
    });
    $(ch + "-box-lable-show-update").click(function () {
        $(this).parents("td").find(".hc-box-lable").addClass("hidden");
        $(this).parents("td").find(".hc-box-lable-update").removeClass("hidden");
    });
    $(ch + "-box-lable-close-update").click(function () {
        $(this).parents("td").find(".hc-box-lable").removeClass("hidden");
        $(this).parents("td").find(".hc-box-lable-update").addClass("hidden");
    });
    $(ch + "-check-muster-save").click(function () {
        var objC = $(this).parents("td");
        var idM = objC.find(ch + "-id").val();
        var status = objC.find(ch + "-check-muster").val();
        var number = objC.find(ch + "-number").val();
        $.ajax({
            url: "/Api/Home/Admin/Muster/Save",
            data: { "idMuster": idM, "number": number, "value": status },
            dataType: 'text',
            type: 'GET',
            success: function (obj) {
                $(objC).find(".hc-box-lable").removeClass("hidden");
                $(objC).find(".hc-box-lable-update").addClass("hidden");
                $(objC).find(".hc-box-lable input").attr('data-original-title', statuL[obj]).val(statuLabel[obj]).css("border-color", "#006400");
            },
            error: function (xhr, ajaxOptions, thrownError) {
                $(objC).find(".hc-box-lable input").css("border-color", "#ff0000");
            }
        });
    });
    var objA;
    $("table").on("dblclick", ch + "-show-update-point", function () {
        var objC = $(this).parents("td");
        var input = $(objC).data("value");
        var html = $(objC).find('span').hide().html();
        $(objC).append('<input type="text" class="ms-money-input hc-update-point ' + input + '" value="' + html + '" />');
        $(".ms-money-input").number(true, 2);
        objA = $(objC).find(".hc-update-point");
        
    });
    $("table").on("click", function (e) {
        var container = $(objA);
        if ($(objA).length > 0 && !container.is(e.target) && container.has(e.target).length === 0) {
            var objD = $(objA).parents("td");
            var objV = $(objA).val();
            var input = $(objD).data("value");
            var objC = $(objA).parents("tr.hc-row");
            var arr = {
                Note: $(objC).find("input.hc-point-id").val(),
                PM_1: $(objC).find("input.PM_1").val(),
                P15_1: $(objC).find("input.P15_1").val(),
                PKNTH1_1: $(objC).find("input.PKNTH1_1").val(),
                PKNTH1_2: $(objC).find("input.PKNTH1_2").val(),
                KTDK_1: $(objC).find("input.KTDK_1").val(),
                HK_1: $(objC).find("input.HK_1").val(),
                PM_2: $(objC).find("input.PM_2").val(),
                P15_2: $(objC).find("input.P15_2").val(),
                PKNTH2_1: $(objC).find("input.PKNTH2_1").val(),
                PKNTH2_2: $(objC).find("input.PKNTH2_2").val(),
                KTDK_2: $(objC).find("input.KTDK_2").val(),
                HK_2: $(objC).find("input.HK_2").val(),
            };
            $.ajax({
                url: "/Api/Home/Admin/SavePoint/Save",
                data: { strPoint: JSON.stringify(arr) },
                dataType: 'json',
                type: 'GET',
                success: function (obj) {
                    $(objC).find("input.PM_1").val(obj.PM_1);
                    $(objC).find("input.P15_1").val(obj.P15_1);
                    $(objC).find("input.PKNTH1_1").val(obj.PKNTH1_1);
                    $(objC).find("input.PKNTH1_2").val(obj.PKNTH1_2);
                    $(objC).find("input.KTDK_1").val(obj.KTDK_1);
                    $(objC).find("input.HK_1").val(obj.HK_1);
                    $(objC).find("input.PM_2").val(obj.PM_2);
                    $(objC).find("input.P15_2").val(obj.P15_2);
                    $(objC).find("input.PKNTH2_1").val(obj.PKNTH2_1);
                    $(objC).find("input.PKNTH2_2").val(obj.PKNTH2_2);
                    $(objC).find("input.KTDK_2").val(obj.KTDK_2);
                    $(objC).find("input.HK_2").val(obj.HK_2);
                    $(objC).find("input.DTB_1").val(obj.DTB_1);
                    $(objC).find("input.DTB_2").val(obj.DTB_2);
                    $(objC).find("input.DTB_CN").val(obj.DTB_CN);
                    $(objC).find("span.DTB_1").html(obj.DTB_1);
                    $(objC).find("span.DTB_2").html(obj.DTB_2);
                    $(objC).find("span.DTB_CN").html(obj.DTB_CN);
                    $(objD).find("span").remove();
                    $(objD).append('<span class="' + input + ' hc-show-update-point">' + objV + '</span>');
                    $(objD).find("input").remove();
                    objA = null;
                    console.log("đã xóa");
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    $(objC).find(".hc-box-lable input").css("border-color", "#ff0000");
                }
            });

        } else {

        }
    });

});
var SumPrice = function () {
    var money = 0;
    var money1 = 0;
    var quantity = 0;
    $.each($("#table_check tr.d-d"), function () {
        quantity = parseInt($(this).find(".quantity").val());
        money1 = parseInt($(this).find(".ms-money").attr("data-value"));
        money = money + (quantity * money1);
    });
    $(".d-total").html(money).number(true, 0);
    $("#Price").val(money);
    $("#number").val(money).number(true, 0);
};
$(function () {
    // $("body").on("change", 'input[type="checkbox"]', function () { checkboxChanged(this); });
    //$('ul.treeview').qubit();
    $('.treeview').bonsai({
        expandAll: false,
        checkChild: false,
        checkboxes: true, // depends on jquery.qubit plugin
        handleDuplicateCheckboxes: true // optional
    });
    function checkboxChanged(obj) {
        var $this = $(obj),
            checked = $this.prop("checked"),
            container = $this.parent().parent(),
            siblings = container.siblings();

        container.find('input[type="checkbox"]')
        .prop({
            indeterminate: false,
            checked: checked
        })
        .siblings('label')
        .removeClass('custom-checked custom-unchecked custom-indeterminate')
        .addClass(checked ? 'custom-checked' : 'custom-unchecked');

        checkSiblings(container, checked);
    }

    function checkSiblings($el, checked) {
        var parent = $el.parent().parent().parent(),
            all = true,
            indeterminate = false;

        $el.siblings().each(function () {
            return all = ($(this).children('input[type="checkbox"]').prop("checked") === checked);
        });

        if (all && checked) {
            parent.children('input[type="checkbox"]')
            .prop({
                indeterminate: false,
                checked: checked
            })
            .siblings('label')
            .removeClass('custom-checked custom-unchecked custom-indeterminate')
            .addClass(checked ? 'custom-checked' : 'custom-unchecked');

            checkSiblings(parent, checked);
        }
        else if (all && !checked) {
            indeterminate = parent.find('input[type="checkbox"]:checked').length > 0;

            parent.children('input[type="checkbox"]')
            .prop("checked", checked)
            .prop("indeterminate", indeterminate)
            .siblings('label')
            .removeClass('custom-checked custom-unchecked custom-indeterminate')
            .addClass(indeterminate ? 'custom-indeterminate' : (checked ? 'custom-checked' : 'custom-unchecked'));

            checkSiblings(parent, checked);
        }
        else {
            $el.parents("li").children('input[type="checkbox"]')
            .prop({
                indeterminate: true,
                checked: false
            })
            .siblings('label')
            .removeClass('custom-checked custom-unchecked custom-indeterminate')
            .addClass('custom-indeterminate');
        }
    }


});
function initialize(x, y) {
    var myCenter = new google.maps.LatLng(x, y);
    var mapProp = {
        center: myCenter,
        zoom: 17,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("modalMap"), mapProp);
    var marker = new google.maps.Marker({
        position: myCenter,
    });
    marker.setMap(map);
}
var SetNumberText = function () {
    $(".text-input input").each(function () {
        var obj = $(this).parent(".text-input").find(".text-input-length");
        $(obj).html(parseInt($(obj).attr("data-length") - $(this).val().length));
    });
};
var GetMultiFileCkFinder = function (element, content) {
    var finder = new CKFinder();
    var obj = $(element);
    finder.callBackMultiple = function (fileUrl) {
        for (var i = 0; i < files.length; i++)
            console.log(files[i]);
    };
    finder.popup();
};
var GetFileCkFinder = function (name, element, content) {
    var finder = new CKFinder();
    finder.selectActionFunction = function (fileUrl) {
        content = content.replace("[srcImg]", fileUrl);
        $(element).append(content);
    };
    finder.popup();
};
var GetEditor = function (element, url) {
    var editor = CKEDITOR.instances[name];
    if (editor) { editor.destroy(true); }
    CKEDITOR.replace(element, { enterMode: CKEDITOR.ENTER_BR });
    CKFinder.setupCKEditor(null, url);
};
var InitBoxImage = function () {
    var o = $.AdminLTE.options;
    //_init();
    if (o.enableBoxWidget) {
        $.AdminLTE.boxWidget.activate();
    }

    $('.box-scroll').slimScroll({
        height: '450px'
    });
};
var SetCheckHide = function () {
    //$(".select-multiple-custom").remove("span.select2");
    $(".ms-hide").each(function (obj) {
        console.log("c");
        if ($(this).is(":checked")) {
            $(this).parents(".form-group").next().removeClass("hide");
        } else {
            $(this).parents(".form-group").next().addClass("hide");
        }
    });
};
var SetMenu = function () {
    //$(".select-multiple-custom").remove("span.select2");
    $(".ms-category").each(function (obj) {
        var strS = $(".ms-category-text").val();
        var id = "{ CategoryId = " + $(this).val() + " }";
        if (strS.search(id) >= 0) {
            $(this).prop('checked', true);
        }
    });
};
var SetNews = function () {
    //$(".select-multiple-custom").remove("span.select2");
    $(".ms-news").each(function (obj) {
        var strS = $(".ms-news-text").val();
        var id = "{ NewsId = " + $(this).val() + " }";
        if (strS.search(id) >= 0) {
            $(this).prop('checked', true);
        }
    });
};
function LocDau(alias) {
    var str = alias;
    str = str.toLowerCase();
    str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
    str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
    str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
    str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
    str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
    str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
    str = str.replace(/đ/g, "d");
    str = str.replace(/!|@|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\;|\'| |\"|\&|\#|\[|\]|~|$|_/g, "-");
    /* tìm và thay thế các kí tự đặc biệt trong chuỗi sang kí tự - */
    str = str.replace(/-+-/g, "-"); //thay thế 2- thành 1-
    str = str.replace(/^\-+|\-+$/g, "");
    //cắt bỏ ký tự - ở đầu và cuối chuỗi 
    return str;
}
var GetAddress = function (addressShow, wardId, districtId, cityId, nationalId) {
    $.ajax({
        url: strRole + "GetAddress",
        data: { "wardId": wardId, "districtId": districtId, "cityId": cityId, "nationalId": nationalId },
        dataType: 'text',
        type: 'GET',
        success: function (str) {
            var strA = $(".ms-address").val();
            if (strA != "") strA = strA + ", ";
            else strA = "";
            $(addressShow).val(strA + str.replace("\"", ""));
            $(addressShow).attr("data", strA + str.replace("\"", ""));
        },
        error: function (xhr, ajaxOptions, thrownError) {
            //alert('Failed to retrieve books.' + thrownError);
        }
    });
};
function SetCheckDate() {
    $(".ms-check-date").each(function () {
        var objDate = $(this).parents(".ms-box-date");
        if ($(this).is(":checked")) {
            $(objDate).find(".ms-text-date").removeAttr("disabled");
            $(objDate).find(".ms-choose-date").addClass("ms-choose-date-show");
        } else {
            $(objDate).find(".ms-text-date").val("");
            $(objDate).find(".ms-text-date").attr("disabled", "disabled");
            $(objDate).find(".ms-choose-date").removeClass("ms-choose-date-show");
        }
    });


}
//refresh DropDownList
var RefreshDropDownList = function (elemen, elemenFisrt) {
    $(elemen).find("option").remove();
    if (elemen == "#FieldId") {
        GetAjax(elemen, "GetFieldA");
    }
    else if (elemen == "#CardTypeId") {

        if (parseInt($(elemenFisrt).val()) > 0)
            GetAjaxParameter(elemen, "GetCradTypeA", { "idCompany": parseInt($(elemenFisrt).val()) });
    }
    else if (elemen == "#DaintyTypeId") {

        if (parseInt($(elemenFisrt).val()) > 0)
            GetAjaxParameter(elemen, "GetDaintyTypeA", { "idCompany": parseInt($(elemenFisrt).val()) });
    }
    else if (elemen == "#CompanyId") {
        GetAjaxParameter(elemen, "GetCompanyA", { "idField": parseInt($(elemenFisrt).val()) });
    }
};
var GetAjax = function (elemen, func) {
    $.ajax({
        url: strRole + func,
        data: {},
        dataType: 'json',
        type: 'GET',
        success: function (obj) {
            $(elemen).append("<option> Vui lòng chọn</option>");
            $.each(obj, function (k, v) {
                $.each(v, function (key, value) {
                    $(elemen).append("<option value='" + value.Id + "'>" + value.Name + "</option>");
                });
            });
        },
        error: function (xhr, ajaxOptions, thrownError) {
            //alert('Failed to retrieve books.' + thrownError);
        }
    });
};
var GetAjaxParameter = function (elemen, func, par) {
    $.ajax({
        url: strRole + func,
        data: par,
        dataType: 'json',
        type: 'GET',
        success: function (obj) {
            $(elemen).append("<option> Vui lòng chọn</option>");
            $.each(obj, function (k, v) {
                $.each(v, function (key, value) {
                    $(elemen).append("<option value='" + value.Id + "'>" + value.Name + "</option>");
                });
            });
        },
        error: function (xhr, ajaxOptions, thrownError) {
            //alert('Failed to retrieve books.' + thrownError);
        }
    });
};

var LoadModalDefault = function (title, content) {
    $('.modal-default').modal('show');
    $(".modal-default .modal-title").html(title);
    $(".modal-default-content").html(content);
};