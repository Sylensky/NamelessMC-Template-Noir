<?php
/*
 *	Made by TeemoCell
 *  https://teemocell.dev
 *
 *  For NamelessMC
 *  https://github.com/NamelessMC/Nameless/
 *  NamelessMC version 2.0.0-pr12
 *
 *  License: MIT
 *
 *  Noir Panel Template
 */
if (!class_exists('Noir_Panel_Template')) {
    class Noir_Panel_Template extends TemplateBase
    {
        public static $NAME = 'Noir';
        public static $AUTHOR = '<a href="https://teemocell.dev" target=_blank">TeemoCell</a>';
        public static $VERSION = '1.0.0';
        public static $NAMELESS_VERSION = '2.0.0-pr12';
        public static $PATH;

        // Private variable to store user
        /** @var Language */
        private $_language;
        public function __construct($cache, $smarty, $language, $user, $pages)
        {
            $noir_language = new Language(ROOT_PATH . '/modules/NoirSettings/language', LANGUAGE);

            $this->_language = $language;
            $this->_user = $user;
            $this->_pages = $pages;
            $this->_smarty = $smarty;

            parent::__construct(self::$NAME, self::$VERSION, self::$NAMELESS_VERSION, self::$AUTHOR);

            self::$PATH = '/custom/panel_templates/' . self::$NAME . '/assets';

            $smarty->assign('ASSETSPATH', self::$PATH);

            define('PANEL_TEMPLATE_STAFF_USERS_AJAX', true);

            define('Easy_Update', '1');
            // 0 - 1

            // Images
            $smarty->assign('L_BACKGROUND', $noir_language->get('language', 'Background'));
            $smarty->assign('L_RESET_BACKGROUND', $noir_language->get('language', 'Reset_Background'));
            $smarty->assign('L_BANNER', $noir_language->get('language', 'Banner'));
            $smarty->assign('L_RESET_BANNER', $noir_language->get('language', 'Reset_Banner'));
            $smarty->assign('L_LOGO', $noir_language->get('language', 'Logo'));
            $smarty->assign('L_RESET_LOGO', $noir_language->get('language', 'Reset_Logo'));
            $smarty->assign('L_FAVICON', $noir_language->get('language', 'Favicon'));
            $smarty->assign('L_RESET_FAVICON', $noir_language->get('language', 'Reset_Favicon'));
            // API
            $smarty->assign('L_API_SETTINGS', $noir_language->get('language', 'API_Settings'));
            $smarty->assign('L_API_CREDENTIALS', $noir_language->get('language', 'API_Credentials'));
            $smarty->assign('L_API_ENABLE_API', $noir_language->get('language', 'API_Enable_API'));
            $smarty->assign('L_API_DISABLE_API', $noir_language->get('language', 'API_Disable_API'));

            //Avatar
            $smarty->assign('L_AVATAR_SETTINGS', $noir_language->get('language', 'Avatar_Settings'));

            //Custom Profile Fields
            $smarty->assign('L_CREATE_NEW_FIELD', $noir_language->get('language', 'Create_New_Field'));
            $smarty->assign('L_SEARCH_PROFILE_FIELDS', $noir_language->get('language', 'Search_Profile_Fields'));
            $smarty->assign('L_FIELD_INFORMATION', $noir_language->get('language', 'Field_Information'));
            $smarty->assign('L_FIELD_SETTINGS', $noir_language->get('language', 'Field_Settings'));

            // Emails
            $smarty->assign('L_ENABLE_PHPMAILER', $noir_language->get('language', 'Enable_PHPMailer'));

            //Misc
            $smarty->assign('L_YES', $noir_language->get('language', 'Switch_Yes'));
            $smarty->assign('L_NO', $noir_language->get('language', 'Switch_No'));
            $smarty->assign('L_SAVE', $noir_language->get('language', 'Save'));
            $smarty->assign('L_BACK', $noir_language->get('language', 'Back'));
            $smarty->assign('L_CREATE', $noir_language->get('language', 'Create'));
        }

        public function onPageLoad()
        {
            if (defined('PANEL_PAGE')) {
                switch (PANEL_PAGE) {
                    case 'dashboard':
                        $this->addJSFiles(array(
                            'https://cdn.jsdelivr.net/npm/apexcharts' => array()
                        ));
                        $this->addJSScript('
						    $(".stats-card i").addClass("fa-2x text-gray-300");
						');
                    break;
                    case 'general_settings':
                        $this->addCSSFiles(array(
                            self::$PATH . '/plugins/select2/select2.min.css' => array()
                        ));

                        $this->addJSFiles(array(
                            self::$PATH . '/plugins/select2/select2.min.js' => array(),
                        ));
                        $this->addJSScript('
                            $(\'select\').select2();
                            $(".S2NoSearch").select2({
                                minimumResultsForSearch: -1
                            });
                        ');
                    break;
                    case 'avatars':
                        $this->addCSSFiles(array(
                            self::$PATH . '/plugins/dropzone/dropzone.min.css' => array(),
                            self::$PATH . '/plugins/image-picker/image-picker.css' => array(),
                            self::$PATH . '/plugins/select2/select2.min.css' => array()
                        ));

                        $this->addJSFiles(array(
                            self::$PATH . '/plugins/dropzone/dropzone.min.js' => array(),
                            self::$PATH . '/plugins/image-picker/image-picker.min.js' => array(),
                            self::$PATH . '/plugins/select2/select2.min.js' => array()
                        ));

                        $this->addJSScript('
                            Dropzone.options.upload_avatar_dropzone = {
                                maxFilesize: 2,
                                dictNoirMessage: "' . $this->_language->get('admin', 'drag_files_here') . '",
                                dictInvalidFileType: "' . $this->_language->get('admin', 'invalid_file_type') . '",
                                dictFileTooBig: "' . $this->_language->get('admin', 'file_too_big') . '"
                            };
                            $(".image-picker").imagepicker();
                            $(".Xselect").select2({
                                minimumResultsForSearch: -1
                            });
						');
                    break;
                    case 'debugging_and_maintenance':
                        $this->addJSFiles(array(
                            self::$PATH . '/plugins/ckeditor5/build/ckeditor.js' => array(),
                        ));
                        $this->addJSScript('
                            ClassicEditor
                                .create(document.querySelector(\'#MaintenanceMessage\'), {

                                })
                                .catch(error => {
                                    console.log(error);
                                });
                        ');
                        if (isset($_GET['log'])) {
                            $this->addCSSFiles(array(
                                '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.5.0/build/styles/atom-one-dark.min.css' => array()
                            ));
                            $this->addJSFiles(array(
                                '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.5.0/build/highlight.min.js' => array()
                            ));
                            $this->addJSScript('
                                hljs.highlightAll();
                            ');
                        }
                    break;
                    case 'privacy_and_terms':
                        $this->addJSFiles(array(
                            self::$PATH . '/plugins/ckeditor/ckeditor.js' => array()
                        ));

                        $this->addJSScript(Input::createEditor('InputPrivacy'));
                        $this->addJSScript(Input::createEditor('InputTerms'));
                    break;
                    case 'registration':
                        $this->addCSSFiles(array(
                            self::$PATH . '/plugins/select2/select2.min.css' => array()
                        ));

                        $this->addJSFiles(array(
                            self::$PATH . '/plugins/ckeditor5/build/ckeditor.js' => array(),
                            self::$PATH . '/plugins/select2/select2.min.js' => array()
                        ));
                        $this->addJSScript('
                            ClassicEditor
                                .create(document.querySelector(\'#InputRegistrationDisabledMessage\'), {
                                })
                                .catch(error => {
                                    console.log(error);
                                });
                                $("select").select2({
                                    minimumResultsForSearch: -1
                                });
                                $("#InputValidationPromoteGroup").select2({
                                });
                        ');
                    break;
                    case 'modules':
                    break;
                    case 'announcements':
                    case 'emails':
                        $this->addCSSFiles(array(
                            self::$PATH . '/plugins/select2/select2.min.css' => array()
                        ));

                        $this->addJSFiles(array(
                            self::$PATH . '/plugins/select2/select2.min.js' => array(),
                            self::$PATH . '/plugins/ckeditor5/build/ckeditor.js' => array(),
                        ));
                        $this->addJSScript('
                            $(document).ready(function() {
                                $(\'.select2-selection--single\').select2();
                            });
                        ');
                    break;
                    case 'groups':
                        $this->addCSSFiles(array(
                            'https://cdn.jsdelivr.net/npm/spectrum-colorpicker2/dist/spectrum.min.css' => array()
                        ));

                        $this->addJSFiles(array(
                            'https://cdn.jsdelivr.net/npm/spectrum-colorpicker2/dist/spectrum.min.js' => array(),
                            self::$PATH . '/js/jquery-ui.min.js' => array()
                        ));
                        $this->addJSScript('
                            $(document).ready(function () {
                                $(\'.color-picker\').spectrum({
                                    type: "component",
                                    togglePaletteOnly: true,
                                    hideAfterPaletteSelect: true,
                                    showInput: true,
                                    showInitial: true
                                });
                            });
                        ');
                    break;
                    case 'template':
                        if (isset($_GET['file'])) {
                            $this->addCSSFiles(array(
                                self::$PATH . '/plugins/codemirror/lib/codemirror.css' => array()
                            ));

                            $this->addJSFiles(array(
                                self::$PATH . '/plugins/codemirror/lib/codemirror.js' => array(),
                                self::$PATH . '/plugins/codemirror/mode/smarty/smarty.js' => array(),
                                self::$PATH . '/plugins/codemirror/mode/css/css.js' => array(),
                                self::$PATH . '/plugins/codemirror/mode/javascript/javascript.js' => array(),
                                self::$PATH . '/plugins/codemirror/mode/properties/properties.js' => array()
                            ));
                        }
                        switch ($_GET['action']) {
                            case 'settings':
                                $this->addCSSFiles(array(
                                    self::$PATH . '/plugins/select2/select2.min.css' => array(),
                                    'https://cdn.jsdelivr.net/npm/spectrum-colorpicker2/dist/spectrum.min.css' => array()
                                ));

                                $this->addJSFiles(array(
                                    self::$PATH . '/plugins/select2/select2.min.js' => array(),
                                    'https://cdn.jsdelivr.net/npm/spectrum-colorpicker2/dist/spectrum.min.js' => array(),
                                    self::$PATH . '/js/jquery-ui.min.js' => array()
                                ));
                                $this->addJSScript('
                                    $("select").select2({
                                        minimumResultsForSearch: -1
                                    });

                                    $(document).ready(function () {
                                        $(\'.color-picker\').spectrum({
                                            type: "text",
                                            showPalette: false,
                                            showInput: true,
                                            showInitial: true
                                        });
                                    });
                                ');
                            break;
                        }
                    break;
                    case 'custom_pages':
                        if (isset($_GET['action'])) {
                            $this->addJSFiles(array(
                                self::$PATH . '/plugins/ckeditor/ckeditor.js' => array()
                            ));

                            $this->addJSScript(Input::createEditor('inputContent', true));
                        }
                    break;
                    case 'widgets':
                        if ($_GET['action'] == 'edit') {
                            $this->addCSSFiles(array(
                                self::$PATH . '/plugins/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css' => array()
                            ));
                            $this->addJSFiles(array(
                                self::$PATH . '/plugins/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js' => array()
                            ));
                            $this->addJSScript('
                                $(\'[data-toggle="touchspin"]\').TouchSpin();
                            ');
                        }
                        $this->addCSSFiles(array(
                            self::$PATH . '/plugins/select2/select2.min.css' => array()
                        ));

                        $this->addJSFiles(array(
                            self::$PATH . '/plugins/select2/select2.min.js' => array()
                        ));
                        $this->addJSScript('
                            $(\'select\').select2();
                            $(".S2NoSearch").select2({
                                minimumResultsForSearch: -1
                            });
                        ');
                    break;
                    case 'custom_profile_fields':
                        $this->addCSSFiles(array(
                            self::$PATH . '/plugins/select2/select2.min.css' => array()
                        ));

                        $this->addJSFiles(array(
                            self::$PATH . '/plugins/select2/select2.min.js' => array(),
                        ));
                        $this->addJSScript('
                            $("select").select2({
                                minimumResultsForSearch: -1
                            });
                        ');
                    break;
                    case 'seo':
                        $this->addCSSFiles(array(
                            self::$PATH . '/css/dataTables.bootstrap4.min.css' => array()
                        ));

                        $this->addJSFiles(array(
                            self::$PATH . '/plugins/dataTables/jquery.dataTables.min.js' => array(),
                            self::$PATH . '/js/dataTables.bootstrap4.min.js' => array()
                        ));

                        $this->addJSScript('
                        $(document).ready(function() {
                            $(\'.dataTables-pages\').dataTable({
                                ordering: false,
                                drawCallback: function( settings ) { $("#SEO thead").remove(); } ,
                                responsive: true,
                                language: {
                                    "lengthMenu": "' . $this->_language->get('table', 'display_records_per_page') . '",
                                    "zeroRecords": "' . $this->_language->get('table', 'nothing_found') . '",
                                    "info": "' . $this->_language->get('table', 'page_x_of_y') . '",
                                    "infoEmpty": "' . $this->_language->get('table', 'no_records') . '",
                                    "infoFiltered": "' . $this->_language->get('table', 'filtered') . '",
                                    "search": "' . $this->_language->get('general', 'search') . '",
                                    "paginate": {
                                        "next": "' . $this->_language->get('general', 'next') . '",
                                        "previous": "' . $this->_language->get('general', 'previous') . '"
                                    }
                                }
                            });
                        });
                        ');
                    break;
                    case 'users':
                        $this->addCSSFiles(array(
                            self::$PATH . '/plugins/bootstrap-duallistbox/bootstrap-duallistbox.css' => array()
                        ));

                        $this->addJSFiles(array(
                            self::$PATH . '/plugins/bootstrap-duallistbox//jquery.bootstrap-duallistbox.js' => array()
                        ));
                        if (!defined('EDITING_USER')) {
                            $this->addCSSFiles(array(
                                self::$PATH . '/css/dataTables.bootstrap4.min.css' => array(),
                            ));

                            $this->addJSFiles(array(
                                self::$PATH . '/js/dataTables.bootstrap4.min.js' => array(),
                                self::$PATH . '/plugins/dataTables/jquery.dataTables.min.js' => array()
                            ));

                            $this->addJSScript('
                                $(document).ready(function() {
                                    var usersTable = $(\'.dataTables-users\').DataTable({
                                        columnDefs: [
                                            { targets: [0], sClass: "hide" },
                                            { "width": "50%", target: 1 },
                                            { "width": "25%", target: 2 },
                                            { "width": "25%", target: 3 }
                                        ],
                                        responsive: true,
                                        processing: true,
                                        serverSide: true,
                                        ajax: "' . URL::build('/queries/admin_users') . '",
                                        columns: [
                                            { data: "id" },
                                            { data: "username" },
                                            { data: "groupName" },
                                            { data: "joined" }
                                        ],
                                        language: {
                                            "lengthMenu": "' . $this->_language->get('table', 'display_records_per_page') . '",
                                            "zeroRecords": "' . $this->_language->get('table', 'nothing_found') . '",
                                            "info": "' . $this->_language->get('table', 'page_x_of_y') . '",
                                            "infoEmpty": "' . $this->_language->get('table', 'no_records') . '",
                                            "infoFiltered": "' . $this->_language->get('table', 'filtered') . '",
                                            "search": "' . $this->_language->get('general', 'search') . '",
                                            "paginate": {
                                                "next": "' . $this->_language->get('general', 'next') . '",
                                                "previous": "' . $this->_language->get('general', 'previous') . '"
                                            }
                                        }
                                    });

                                    $(\'.dataTables-users tbody\').on(\'click\', \'tr\', function(){
                                        window.location.href = "' . URL::build('/panel/user/') . '" + usersTable.row(this).data().id;
                                    });
                                });
							');
                        }
                    break;
                    case 'minecraft':
                        if (!defined('MINECRAFT_PAGE')) {

                            $this->addJSScript('
							if($(\'.js-check-change\').length) {
						        var changeCheckbox = document.querySelector(\'.js-check-change\');

						        changeCheckbox.onchange = function () {
						            $(\'#enableMinecraft\').submit();
						        };
						    }
							');

                        } else if (MINECRAFT_PAGE == 'authme') {

                            $this->addJSScript('
							if($(\'.js-check-change\').length) {
						        var changeCheckbox = document.querySelector(\'.js-check-change\');

						        changeCheckbox.onchange = function () {
						            $(\'#enableAuthMe\').submit();
						        };
						    }
							');

                        } else if (MINECRAFT_PAGE == 'verification') {

                            $this->addJSScript('
							if($(\'.js-check-change\').length) {
						        var changeCheckbox = document.querySelector(\'.js-check-change\');

						        changeCheckbox.onchange = function () {
						            $(\'#enablePremium\').submit();
						        };
						    }
							');

                        } else if (MINECRAFT_PAGE == 'servers') {
                            $this->addJSFiles(array(
                                self::$PATH . '/js/jquery-ui.min.js' => array()
                            ));
                        } else if (MINECRAFT_PAGE == 'query_errors') {
                            $this->addCSSStyle('
							.error_log {
		                        width: 100%;
		                        height: 50px;
		                        padding: 0 10px;
		                        -webkit-box-sizing: border-box;
		                        -moz-box-sizing: border-box;
		                        box-sizing: border-box;
		                        overflow-y: scroll;
		                        overflow-x: scroll;
		                        white-space: initial;
		                        background-color: #eceeef;
		                    }
							');

                        } else if (MINECRAFT_PAGE == 'server_banners') {
                            if (isset($_GET['edit'])) {
                                $this->addCSSFiles(array(
                                    self::$PATH . '/plugins/image-picker/image-picker.css' => array()
                                ));

                                $this->addCSSStyle('
                                    .thumbnails li img{
                                        width: 200px;
                                    }
								');

                                $this->addJSFiles(array(
                                    self::$PATH . '/plugins/image-picker/image-picker.min.js' => array()
                                ));

                                $this->addJSScript('$(".image-picker").imagepicker();');
                            }
                        }
                    break;
                    case 'hooks':
                        $this->addCSSFiles(array(
                            self::$PATH . '/plugins/select2/select2.min.css' => array()
                        ));

                        $this->addJSFiles(array(
                            self::$PATH . '/plugins/select2/select2.min.js' => array(),
                        ));
                        $this->addJSScript('
                                $(document).ready(function() {
                                    $(\'.select2-selection--single\').select2();
                                });
                        ');
                    break;
                    case 'discord':
                    case 'security':
                        if (isset($_GET['view'])) {
                            $this->addCSSFiles(array(
                                self::$PATH . '/css/dataTables.bootstrap4.min.css' => array()
                            ));

                            $this->addJSFiles(array(
                                self::$PATH . '/plugins/dataTables/jquery.dataTables.min.js' => array(),
                                self::$PATH . '/js/dataTables.bootstrap4.min.js' => array()
                            ));

                            $this->addJSScript('
							$(document).ready(function() {
								$(\'.dataTable\').dataTable({
									responsive: true,
									language: {
										"lengthMenu": "' . $this->_language->get('table', 'display_records_per_page') . '",
										"zeroRecords": "' . $this->_language->get('table', 'nothing_found') . '",
										"info": "' . $this->_language->get('table', 'page_x_of_y') . '",
										"infoEmpty": "' . $this->_language->get('table', 'no_records') . '",
										"infoFiltered": "' . $this->_language->get('table', 'filtered') . '",
										"search": "' . $this->_language->get('general', 'search') . '",
										"paginate": {
										    "next": "' . $this->_language->get('general', 'next') . '",
										    "previous": "' . $this->_language->get('general', 'previous') . '"
										}
									},
									order: [[ ' . SORT . ', \'desc\']]
								});
							});
							');
                        }
                    break;
                    case 'images':
                        $this->addCSSFiles(array(
                            self::$PATH . '/plugins/dropzone/dropzone.min.css' => array(),
                            self::$PATH . '/plugins/image-picker/image-picker.css' => array()
                        ));

                        $this->addJSFiles(array(
                            self::$PATH . '/plugins/dropzone/dropzone.min.js' => array(),
                            self::$PATH . '/plugins/image-picker/image-picker.min.js' => array(),
                        ));

                        $this->addJSScript('
						Dropzone.options.upload_background_dropzone = {
						    maxFilesize: 2,
						    dictNoirMessage: "' . $this->_language->get('admin', 'drag_files_here') . '",
						    dictInvalidFileType: "' . $this->_language->get('admin', 'invalid_file_type') . '",
						    dictFileTooBig: "' . $this->_language->get('admin', 'file_too_big') . '",
					        error: function(file, response) {
					            console.log("ERROR");
					            console.log(file);
					            console.log(response);
					        },
					        success: function(file, response){
					            console.log("ACCEPTED");
					            console.log(file);
					            console.log(response);
					        }
						};

						Dropzone.options.upload_banner_dropzone = {
						    maxFilesize: 2,
						    dictNoirMessage: "' . $this->_language->get('admin', 'drag_files_here') . '",
						    dictInvalidFileType: "' . $this->_language->get('admin', 'invalid_file_type') . '",
						    dictFileTooBig: "' . $this->_language->get('admin', 'file_too_big') . '",
					        error: function(file, response) {
					            console.log("ERROR");
					            console.log(file);
					            console.log(response);
					        },
					        success: function(file, response){
					            console.log("ACCEPTED");
					            console.log(file);
					            console.log(response);
					        }
						};

						$(".image-picker").imagepicker();
						');
                    break;
                    case 'forums':
                        if (isset($_GET['forum'])) {

                            $this->addJSFiles(array(
                                self::$PATH . '/plugins/ckeditor/ckeditor.js' => array()
                            ));

                            $this->addJSScript(Input::createEditor('InputPlaceholder', true));
                        }

                        $this->addJSFiles(array(
                            self::$PATH . '/js/jquery-ui.min.js' => array()
                        ));

                    break;
                    case 'forum_settings':
                }
            }
        }
    }
}

$template = new Noir_Panel_Template($cache, $smarty, $language, $user, $pages);
