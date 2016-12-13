using System.Web;
using System.Web.Optimization;

namespace QLD
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.min.js",
                      "~/Scripts/respond.min.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.min.css",
                      "~/Content/site.min.css"));
            #region --front---
            //css
            bundles.Add(new StyleBundle("~/Content/fonts/awesome/css").Include(
               "~/fonts/font-awesome/css/font-awesome.min.css", new CssRewriteUrlTransform()));
            bundles.Add(new StyleBundle("~/Content/fonts/ionic/css").Include(
               "~/fonts/ionic/css/font-awesome.min.css", new CssRewriteUrlTransform()));

            //js
            //bundles.Add(new StyleBundle("~/bundles/fonts/ionic").Include(
            //   "~/fonts/ionic/js/ionic.min.js"
            //   ));
            #endregion
            #region --FrontEnd--
            //css 
            bundles.Add(new StyleBundle("~/Content/ch/css").Include(
                "~/Content/main.css", "~/Theme/plugins/bootstrap-modal-carousel/css/bootstrap-modal-carousel.min.css"

                ));

            //js

            bundles.Add(new StyleBundle("~/bundles/ch").Include(
               "~/Scripts/main.js",
               "~/Theme/plugins/bootstrap-modal-carousel/js/bootstrap-modal-carousel.min.js",
               "~/Theme/plugins/bootstrap-modal-carousel/js/demo.min.js"
               ));
            #endregion
            #region --BackEnd--
            bundles.Add(new ScriptBundle("~/Content/rating/css").Include(
                           "~/Theme/plugins/rating/jquery.raty.css", new CssRewriteUrlTransform()));
            bundles.Add(new ScriptBundle("~/bundles/rating").Include(
                        "~/Theme/plugins/rating/jquery.raty.js"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                    "~/Theme/plugins/jQuery/jQuery-2.1.4.min.js",
                    "~/Theme/plugins/jQueryUI/jquery-ui.min.js",
                    "~/Scripts/raphael-min.js"));


            bundles.Add(new ScriptBundle("~/bundles/plugins").Include(
                    "~/Theme/plugins/morris/morris.min.js",
                    "~/Theme/plugins/sparkline/jquery.sparkline.min.js",
                    "~/Theme/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js",
                    "~/Theme/plugins/jvectormap/jquery-jvectormap-world-mill-en.js",
                    "~/Theme/plugins/knob/jquery.knob.js",
                    "~/Theme/plugins/number/jquery.number.min.js",
                    "~/Scripts/moment.min.js",
                    "~/Theme/plugins/daterangepicker/daterangepicker.js",
                    "~/Theme/plugins/datepicker/bootstrap-datepicker.js",
                //"~/Theme/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js",
                    "~/Theme/plugins/slimScroll/jquery.slimscroll.min.js",
                    "~/Theme/plugins/fastclick/fastclick.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/plugins/form").Include(
                    "~/Theme/plugins/morris/morris.min.js",
                    "~/Theme/plugins/sparkline/jquery.sparkline.min.js",
                    "~/Theme/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js",
                    "~/Theme/plugins/jvectormap/jquery-jvectormap-world-mill-en.js",
                    "~/Theme/plugins/knob/jquery.knob.js",
                    "~/Scripts/moment.min.js",
                    "~/Theme/plugins/daterangepicker/daterangepicker.js",
                    "~/Theme/plugins/datepicker/bootstrap-datepicker.js",
                    "~/Theme/plugins/datetimepicker/js/bootstrap-datetimepicker.min.js",
                //"~/Theme/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js",
                    "~/Theme/plugins/slimScroll/jquery.slimscroll.min.js",
                    "~/Theme/plugins/fastclick/fastclick.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/plugins/char").Include(
                  "~/Theme/plugins/morris/morris.min.js",
                  "~/Theme/plugins/sparkline/jquery.sparkline.min.js",
                  "~/Theme/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js",
                  "~/Theme/plugins/jvectormap/jquery-jvectormap-world-mill-en.js",
                  "~/Theme/plugins/knob/jquery.knob.js",
                //"~/Theme/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js",
                  "~/Theme/plugins/slimScroll/jquery.slimscroll.min.js",
                  "~/Theme/plugins/fastclick/fastclick.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/plugins/inputmask").Include(
                        "~/Theme/plugins/input-mask/jquery.inputmask.js",
                        "~/Theme/plugins/input-mask/jquery.inputmask.date.extensions.js",
                        "~/Theme/plugins/input-mask/jquery.inputmask.extensions.js"));

            bundles.Add(new ScriptBundle("~/bundles/plugins/pfrom").Include(
                        "~/Theme/plugins/slimScroll/jquery.slimscroll.min.js",
                        "~/Theme/plugins/iCheck/icheck.min.js",
                        "~/Theme/plugins/fastclick/fastclick.min.js",
                        "~/Theme/plugins/select2/select2.full.min.js",
                        "~/Theme/plugins/knob/jquery.knob.js",
                        "~/Scripts/moment.min.js",
                        "~/Theme/plugins/daterangepicker/daterangepicker.js",
                        "~/Theme/plugins/datepicker/bootstrap-datepicker.js",
                    "~/Theme/plugins/datetimepicker/js/bootstrap-datetimepicker.min.js",
                    "~/Theme/plugins/treeview/jquery.bonsai.js",
                    "~/Theme/plugins/treeview/jquery.qubit.js",
                    "~/Theme/plugins/morris/raphael-min.js",
                    "~/Theme/plugins/morris/morris.min.js",
                    "~/Theme/plugins/morris/jquery.knob.js",
                //"~/Theme/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js",
                        "~/Theme/plugins/number/jquery.number.min.js"
                        ));

            bundles.Add(new ScriptBundle("~/bundles/ckeditor").Include(
                    "~/Theme/ckeditor/ckeditor.js",
                //"~/Theme/ckeditor/adapters/jquery.js",
                    "~/Theme/ckfinder/ckfinder.js"));

            bundles.Add(new ScriptBundle("~/bundles/dist").Include(
                    "~/Theme/dist/js/app.min.js",
                      "~/Scripts/json2.min",
                    "~/Theme/dist/js/pages/dashboard.js",
                    "~/Theme/dist/js/demo.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                     "~/Theme/dist/css/AdminLTE.min.css",
                    "~/Content/bootstrap.min.css",
                    "~/Theme/plugins/treeview/jquery.bonsai.css",
                    "~/Theme/plugins/morris/morris.css",
                     "~/Theme/dist/css/AppMain.css",
                    "~/Theme/dist/css/skins/_all-skins.min.css"));

            bundles.Add(new StyleBundle("~/Content/fonts/css").Include(
                   "~/fonts/font-awesome/css/font-awesome.min.css", new CssRewriteUrlTransform()));


            bundles.Add(new StyleBundle("~/Content/plugins/css").Include(
                    "~/Theme/plugins/morris/morris.css",
                    "~/Theme/plugins/jvectormap/jquery-jvectormap-1.2.2.css",
                    "~/Theme/plugins/datepicker/datepicker3.css",
                    "~/Theme/plugins/daterangepicker/daterangepicker-bs3.css",
                    "~/Theme/plugins/datetimepicker/css/bootstrap-datetimepicker.min.css",
                    "~/Theme/plugins/slimScroll/jquery.slimscroll.min.js",
                //"~/Theme/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css",
                    "~/Theme/plugins/select2/select2.min.css"));
            #endregion


        }
    }
}
