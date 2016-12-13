/**
 * AdminLTE Demo Menu
 * ------------------
 * You should not use this file in production.
 * This file is for demo purposes only.
 */
var SetNumberText = function () {
    $(".text-input input").each(function () {
        var obj = $(this).parent(".text-input").find(".text-input-length");
        $(obj).html(parseInt($(obj).attr("data-length") - $(this).val().length));
    });
};

$(function () {
    // $("body").on("change", 'input[type="checkbox"]', function () { checkboxChanged(this); });
    //$('ul.treeview').qubit();
    $('.treeview1').bonsai({
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
            .prop({ indeterminate: false, checked: checked })
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
            .prop({ indeterminate: true, checked: false })
            .siblings('label')
            .removeClass('custom-checked custom-unchecked custom-indeterminate')
            .addClass('custom-indeterminate');
        }
    }

    $("body").on("click", ".ch-btn-regex", function () {
        var obj = $(this).attr("data-index");
        var html = $(".ch-regex" + obj).val();
        var id = $("#News").val(); 
        var taget = $(this).attr("data-taget");
        if (taget != 1) {
            $(this).attr("data-taget", 1);
            $.ajax({
                url: "/Admin/Custom/AddEpisode",
                data: JSON.stringify({ "html": $(".ch-regex" + obj).val(), "id": parseInt($("#News").val()) }),
                contentType: 'application/json; charset=utf-8',
                type: 'POST',
                success: function (objAv) {
                    alert(objAv);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    //alert('Failed to retrieve books.' + thrownError);
                }
            });
        }

    });
});
(function ($, AdminLTE) {
    $(".select2").select2();

    $('.box-scroll-350').slimScroll({
        height: '350px'
    });
    $('.box-scroll-250').slimScroll({
        height: '250px'
    });
    $("body").on("click", ".checkbox-toggle", function () {
        if ($(this).is(":checked")) {
            $(".checkbox-toggle-child").prop('checked', true);
        } else {

            $(".checkbox-toggle-child").prop('checked', false);
        }
    });

    $("body").on("keyup", ".text-input input", function () {
        var obj = $(this).parent(".text-input").find(".text-input-length");
        $(obj).html(parseInt($(obj).attr("data-length") - $(this).val().length));
    });
    /** * datepicker======================================================  */
    $('.ms-text-date').datepicker({
        format: 'dd/mm/yyyy',
        startDate: "-3d",
        language: "vi",
        todayBtn: true
    }).on('changeDate', function (e) {
        $(this).next().val(e.format('mm/dd/yyyy'));
    });
    $(".ms-check-date").click(function () {
        var objDate = $(this).parents(".ms-box-date");
        if ($(this).is(":checked")) {
            $(objDate).find(".ms-text-date").removeAttr("disabled");
            $(objDate).find(".ms-choose-date").addClass("ms-choose-date-show");
        } else {
            $(objDate).find(".ms-text-date").attr("disabled", "disabled");
            $(objDate).find(".ms-choose-date").removeClass("ms-choose-date-show");
        }
    });
    $("body").on("click", ".ms-choose-date-show", function () {
        $(this).prev().focus();
    });
    /** * datepicker======================================================  */




    /**
     * List of all the available skins
     * 
     * @type Array
     */
    var my_skins = [
      "skin-blue",
      "skin-black",
      "skin-red",
      "skin-yellow",
      "skin-purple",
      "skin-green",
      "skin-blue-light",
      "skin-black-light",
      "skin-red-light",
      "skin-yellow-light",
      "skin-purple-light",
      "skin-green-light"
    ];

    //Create the new tab
    var tab_pane = $("<div />", {
        "id": "control-sidebar-theme-demo-options-tab",
        "class": "tab-pane active"
    });

    //Create the tab button
    var tab_button = $("<li />", { "class": "active" })
            .html("<a href='#control-sidebar-theme-demo-options-tab' data-toggle='tab'>"
                    + "<i class='fa fa-wrench'></i>"
                    + "</a>");

    //Add the tab button to the right sidebar tabs
    $("[href='#control-sidebar-home-tab']")
            .parent()
            .before(tab_button);

    //Create the menu
    var demo_settings = $("<div />");

    //Layout options
    demo_settings.append(
            "<h4 class='control-sidebar-heading'>"
            + "Layout Options"
            + "</h4>"
            //Fixed layout
            + "<div class='form-group'>"
            + "<label class='control-sidebar-subheading'>"
            + "<input type='checkbox' data-layout='fixed' class='pull-right'/> "
            + "Fixed layout"
            + "</label>"
            + "<p>Activate the fixed layout. You can't use fixed and boxed layouts together</p>"
            + "</div>"
            //Boxed layout
            + "<div class='form-group'>"
            + "<label class='control-sidebar-subheading'>"
            + "<input type='checkbox' data-layout='layout-boxed'class='pull-right'/> "
            + "Boxed Layout"
            + "</label>"
            + "<p>Activate the boxed layout</p>"
            + "</div>"
            //Sidebar Toggle
            + "<div class='form-group'>"
            + "<label class='control-sidebar-subheading'>"
            + "<input type='checkbox' data-layout='sidebar-collapse' class='pull-right'/> "
            + "Toggle Sidebar"
            + "</label>"
            + "<p>Toggle the left sidebar's state (open or collapse)</p>"
            + "</div>"
            //Sidebar mini expand on hover toggle
            + "<div class='form-group'>"
            + "<label class='control-sidebar-subheading'>"
            + "<input type='checkbox' data-enable='expandOnHover' class='pull-right'/> "
            + "Sidebar Expand on Hover"
            + "</label>"
            + "<p>Let the sidebar mini expand on hover</p>"
            + "</div>"
            //Control Sidebar Toggle
            + "<div class='form-group'>"
            + "<label class='control-sidebar-subheading'>"
            + "<input type='checkbox' data-controlsidebar='control-sidebar-open' class='pull-right'/> "
            + "Toggle Right Sidebar Slide"
            + "</label>"
            + "<p>Toggle between slide over content and push content effects</p>"
            + "</div>"
            //Control Sidebar Skin Toggle
            + "<div class='form-group'>"
            + "<label class='control-sidebar-subheading'>"
            + "<input type='checkbox' data-sidebarskin='toggle' class='pull-right'/> "
            + "Toggle Right Sidebar Skin"
            + "</label>"
            + "<p>Toggle between dark and light skins for the right sidebar</p>"
            + "</div>"
            );
    var skins_list = $("<ul />", { "class": 'list-unstyled clearfix' });

    //Dark sidebar skins
    var skin_blue =
            $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-blue' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 7px; background: #367fa9;'></span><span class='bg-light-blue' style='display:block; width: 80%; float: left; height: 7px;'></span></div>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #222d32;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
                    + "</a>"
                    + "<p class='text-center no-margin'>Blue</p>");
    skins_list.append(skin_blue);
    var skin_black =
            $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-black' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
                    + "<div style='box-shadow: 0 0 2px rgba(0,0,0,0.1)' class='clearfix'><span style='display:block; width: 20%; float: left; height: 7px; background: #fefefe;'></span><span style='display:block; width: 80%; float: left; height: 7px; background: #fefefe;'></span></div>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #222;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
                    + "</a>"
                    + "<p class='text-center no-margin'>Black</p>");
    skins_list.append(skin_black);
    var skin_purple =
            $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-purple' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 7px;' class='bg-purple-active'></span><span class='bg-purple' style='display:block; width: 80%; float: left; height: 7px;'></span></div>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #222d32;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
                    + "</a>"
                    + "<p class='text-center no-margin'>Purple</p>");
    skins_list.append(skin_purple);
    var skin_green =
            $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-green' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 7px;' class='bg-green-active'></span><span class='bg-green' style='display:block; width: 80%; float: left; height: 7px;'></span></div>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #222d32;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
                    + "</a>"
                    + "<p class='text-center no-margin'>Green</p>");
    skins_list.append(skin_green);
    var skin_red =
            $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-red' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 7px;' class='bg-red-active'></span><span class='bg-red' style='display:block; width: 80%; float: left; height: 7px;'></span></div>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #222d32;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
                    + "</a>"
                    + "<p class='text-center no-margin'>Red</p>");
    skins_list.append(skin_red);
    var skin_yellow =
            $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-yellow' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 7px;' class='bg-yellow-active'></span><span class='bg-yellow' style='display:block; width: 80%; float: left; height: 7px;'></span></div>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #222d32;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
                    + "</a>"
                    + "<p class='text-center no-margin'>Yellow</p>");
    skins_list.append(skin_yellow);

    //Light sidebar skins
    var skin_blue_light =
            $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-blue-light' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 7px; background: #367fa9;'></span><span class='bg-light-blue' style='display:block; width: 80%; float: left; height: 7px;'></span></div>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #f9fafc;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
                    + "</a>"
                    + "<p class='text-center no-margin' style='font-size: 12px'>Blue Light</p>");
    skins_list.append(skin_blue_light);
    var skin_black_light =
            $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-black-light' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
                    + "<div style='box-shadow: 0 0 2px rgba(0,0,0,0.1)' class='clearfix'><span style='display:block; width: 20%; float: left; height: 7px; background: #fefefe;'></span><span style='display:block; width: 80%; float: left; height: 7px; background: #fefefe;'></span></div>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #f9fafc;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
                    + "</a>"
                    + "<p class='text-center no-margin' style='font-size: 12px'>Black Light</p>");
    skins_list.append(skin_black_light);
    var skin_purple_light =
            $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-purple-light' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 7px;' class='bg-purple-active'></span><span class='bg-purple' style='display:block; width: 80%; float: left; height: 7px;'></span></div>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #f9fafc;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
                    + "</a>"
                    + "<p class='text-center no-margin' style='font-size: 12px'>Purple Light</p>");
    skins_list.append(skin_purple_light);
    var skin_green_light =
            $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-green-light' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 7px;' class='bg-green-active'></span><span class='bg-green' style='display:block; width: 80%; float: left; height: 7px;'></span></div>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #f9fafc;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
                    + "</a>"
                    + "<p class='text-center no-margin' style='font-size: 12px'>Green Light</p>");
    skins_list.append(skin_green_light);
    var skin_red_light =
            $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-red-light' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 7px;' class='bg-red-active'></span><span class='bg-red' style='display:block; width: 80%; float: left; height: 7px;'></span></div>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #f9fafc;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
                    + "</a>"
                    + "<p class='text-center no-margin' style='font-size: 12px'>Red Light</p>");
    skins_list.append(skin_red_light);
    var skin_yellow_light =
            $("<li />", { style: "float:left; width: 33.33333%; padding: 5px;" })
            .append("<a href='javascript:void(0);' data-skin='skin-yellow-light' style='display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)' class='clearfix full-opacity-hover'>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 7px;' class='bg-yellow-active'></span><span class='bg-yellow' style='display:block; width: 80%; float: left; height: 7px;'></span></div>"
                    + "<div><span style='display:block; width: 20%; float: left; height: 20px; background: #f9fafc;'></span><span style='display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;'></span></div>"
                    + "</a>"
                    + "<p class='text-center no-margin' style='font-size: 12px;'>Yellow Light</p>");
    skins_list.append(skin_yellow_light);

    demo_settings.append("<h4 class='control-sidebar-heading'>Skins</h4>");
    demo_settings.append(skins_list);

    tab_pane.append(demo_settings);
    $("#control-sidebar-home-tab").after(tab_pane);

    setup();

    /**
     * Toggles layout classes
     * 
     * @param String cls the layout class to toggle
     * @returns void
     */
    function change_layout(cls) {
        $("body").toggleClass(cls);
        AdminLTE.layout.fixSidebar();
        //Fix the problem with right sidebar and layout boxed
        if (cls == "layout-boxed")
            AdminLTE.controlSidebar._fix($(".control-sidebar-bg"));
        if ($('body').hasClass('fixed') && cls == 'fixed') {
            AdminLTE.pushMenu.expandOnHover();
            AdminLTE.controlSidebar._fixForFixed($('.control-sidebar'));
            AdminLTE.layout.activate();
        }
    }

    /**
     * Replaces the old skin with the new skin
     * @param String cls the new skin class
     * @returns Boolean false to prevent link's default action
     */
    function change_skin(cls) {
        $.each(my_skins, function (i) {
            $("body").removeClass(my_skins[i]);
        });

        $("body").addClass(cls);
        store('skin', cls);
        return false;
    }

    /**
     * Store a new settings in the browser
     * 
     * @param String name Name of the setting
     * @param String val Value of the setting
     * @returns void
     */
    function store(name, val) {
        if (typeof (Storage) !== "undefined") {
            localStorage.setItem(name, val);
        } else {
            alert('Please use a modern browser to properly view this template!');
        }
    }

    /**
     * Get a prestored setting
     * 
     * @param String name Name of of the setting
     * @returns String The value of the setting | null
     */
    function get(name) {
        if (typeof (Storage) !== "undefined") {
            return localStorage.getItem(name);
        } else {
            alert('Please use a modern browser to properly view this template!');
        }
    }

    /**
     * Retrieve default settings and apply them to the template
     * 
     * @returns void
     */
    function setup() {
        var tmp = get('skin');
        if (tmp && $.inArray(tmp, my_skins))
            change_skin(tmp);

        //Add the change skin listener
        $("[data-skin]").on('click', function (e) {
            e.preventDefault();
            change_skin($(this).data('skin'));
        });

        //Add the layout manager
        $("[data-layout]").on('click', function () {
            change_layout($(this).data('layout'));
        });

        $("[data-controlsidebar]").on('click', function () {
            change_layout($(this).data('controlsidebar'));
            var slide = !AdminLTE.options.controlSidebarOptions.slide;
            AdminLTE.options.controlSidebarOptions.slide = slide;
            if (!slide)
                $('.control-sidebar').removeClass('control-sidebar-open');
        });

        $("[data-sidebarskin='toggle']").on('click', function () {
            var sidebar = $(".control-sidebar");
            if (sidebar.hasClass("control-sidebar-dark")) {
                sidebar.removeClass("control-sidebar-dark")
                sidebar.addClass("control-sidebar-light")
            } else {
                sidebar.removeClass("control-sidebar-light")
                sidebar.addClass("control-sidebar-dark")
            }
        });

        $("[data-enable='expandOnHover']").on('click', function () {
            $(this).attr('disabled', true);
            AdminLTE.pushMenu.expandOnHover();
            if (!$('body').hasClass('sidebar-collapse'))
                $("[data-layout='sidebar-collapse']").click();
        });

        // Reset options
        if ($('body').hasClass('fixed')) {
            $("[data-layout='fixed']").attr('checked', 'checked');
        }
        if ($('body').hasClass('layout-boxed')) {
            $("[data-layout='layout-boxed']").attr('checked', 'checked');
        }
        if ($('body').hasClass('sidebar-collapse')) {
            $("[data-layout='sidebar-collapse']").attr('checked', 'checked');
        }

    }
})(jQuery, $.AdminLTE);
var SetNumberMeta = function () {
    $(".text-input input").each(function () {
        var obj = $(this).parent(".text-input").find(".text-input-length");
        $(obj).html(parseInt($(obj).attr("data-length") - $(this).val().length));
    });
};