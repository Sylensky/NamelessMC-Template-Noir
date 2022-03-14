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
        public static $PUBLIC_PATH;

        // Private variable to store user
        private $_user, $_pages;

        /** @var Language */
        private $_language;

        public function __construct($cache, $smarty, $language, $user, $pages)
        {
            $this->_language = $language;
            $this->_user = $user;
            $this->_pages = $pages;
            $this->_smarty = $smarty;

            parent::__construct(self::$NAME, self::$VERSION, self::$NAMELESS_VERSION, self::$AUTHOR);

            self::$PATH = ROOT_PATH . '/custom/panel_templates/' . self::$NAME;
            self::$PUBLIC_PATH = (defined('CONdFIG_PATH') ? CONFIG_PATH : '') . '/custom/panel_templates/' . self::$NAME;


            $this->addCSSFiles(array(
				self::$PUBLIC_PATH . '/assets/plugins/bootstrap-duallistbox/bootstrap-duallistbox.css' => array(),
                'https://pro.fontawesome.com/releases/v5.15.4/css/all.css' => array(),
                'https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css' => array(),
                'https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i' => array(),
                self::$PUBLIC_PATH . '/assets/plugins/toastr/toastr.min.css' => array()
            ));

            $this->addJSFiles(array(
				self::$PUBLIC_PATH . '/assets/plugins/jquery/jquery.min.js' => array(),
                self::$PUBLIC_PATH . '/assets/plugins/bootstrap/js/bootstrap.bundle.min.js' => array(),
				self::$PUBLIC_PATH . '/assets/plugins/bootstrap-duallistbox//jquery.bootstrap-duallistbox.js' => array(),
                self::$PUBLIC_PATH . '/assets/js/app.js' => array(),
                self::$PUBLIC_PATH . '/assets/js/jquery.cookie.js' => array(),
                self::$PUBLIC_PATH . '/assets/plugins/toastr/toastr.min.js' => array(),
                self::$PUBLIC_PATH . '/assets/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js' => array()
            ));

            define('PANEL_TEMPLATE_STAFF_USERS_AJAX', true);

            define('Profile_Fields_Style', 'card');
            define('Panel_Template_Style', 'card');
            // card - table
            define('Easy_Update', '1');
            // 0 - 1
        }

        public function onPageLoad()
        {
            $NoirSettings = self::getConfig();
            $this->_smarty->assign('NS', $NoirSettings);

            if (defined('PANEL_PAGE')) {
                switch (PANEL_PAGE) {
                    case 'dashboard':
                        $this->addJSFiles(array(
                            self::$PUBLIC_PATH . '/assets/plugins/moment/moment.min.js' => array(),
                            self::$PUBLIC_PATH . '/assets/plugins/charts/Chart.min.js' => array()
                        ));
                        $this->addJSScript('
						    $(".stats-card i").addClass("fa-2x text-gray-300");
						');
                        break;
                    case 'avatars':
                        $this->addCSSFiles(array(
                            self::$PUBLIC_PATH . '/assets/plugins/dropzone/dropzone.min.css' => array(),
                            self::$PUBLIC_PATH . '/assets/plugins/image-picker/image-picker.css' => array()
                        ));

                        $this->addJSFiles(array(
                            self::$PUBLIC_PATH . '/assets/plugins/dropzone/dropzone.min.js' => array(),
                            self::$PUBLIC_PATH . '/assets/plugins/image-picker/image-picker.min.js' => array()
                        ));

                        $this->addJSScript('
                            Dropzone.options.upload_avatar_dropzone = {
                                maxFilesize: 2,
                                dictNoirMessage: "' . $this->_language->get('admin', 'drag_files_here') . '",
                                dictInvalidFileType: "' . $this->_language->get('admin', 'invalid_file_type') . '",
                                dictFileTooBig: "' . $this->_language->get('admin', 'file_too_big') . '"
                            };
                            $(".image-picker").imagepicker();
						');
                    break;
                    case 'debugging_and_maintenance':
                        $this->addJSFiles(array(
                            self::$PUBLIC_PATH . '/assets/plugins/ckeditor5/build/ckeditor.js' => array(),
                            self::$PUBLIC_PATH . '/assets/js/pages/debugging_and_maintenance.js' => array()
                        ));
                    break;
                    case 'privacy_and_terms':
                        $this->addJSFiles(array(
                            self::$PUBLIC_PATH . '/assets/plugins/ckeditor/ckeditor.js' => array()
                        ));

                        $this->addJSScript(Input::createEditor('InputPrivacy'));
                        $this->addJSScript(Input::createEditor('InputTerms'));
                    break;
                    case 'registration':
                        $this->addJSFiles(array(
                            self::$PUBLIC_PATH . '/assets/plugins/ckeditor/ckeditor.js' => array()
                        ));

                        $this->addJSScript(Input::createEditor('InputRegistrationDisabledMessage'));

                        $this->addJSScript('
                            var changeCheckbox = document.querySelector(\'.js-check-change\');

                            changeCheckbox.onchange = function() {
                            $(\'#enableRegistration\').submit();
						};
						');
                    break;
                    case 'announcements':
                    case 'emails':
                        $this->addCSSFiles(array(
                            self::$PUBLIC_PATH . '/assets/plugins/select2/select2.min.css' => array()
                        ));

                        $this->addJSFiles(array(
                            self::$PUBLIC_PATH . '/assets/plugins/select2/select2.min.js' => array(),
                            self::$PUBLIC_PATH . '/assets/plugins/ckeditor5/build/ckeditor.js' => array(),
                        ));
                    break;
                    case 'groups':
                        $this->addCSSFiles(array(
                            'https://cdn.jsdelivr.net/npm/spectrum-colorpicker2/dist/spectrum.min.css' => array()
                        ));

                        $this->addJSFiles(array(
                            'https://cdn.jsdelivr.net/npm/spectrum-colorpicker2/dist/spectrum.min.js' => array(),
                            self::$PUBLIC_PATH . '/assets/js/jquery-ui.min.js' => array()
                        ));
                    break;
                    case 'template':
                        if (isset($_GET['file'])) {
                            $this->addCSSFiles(array(
                                self::$PUBLIC_PATH . '/assets/plugins/codemirror/lib/codemirror.css' => array()
                            ));

                            $this->addJSFiles(array(
                                self::$PUBLIC_PATH . '/assets/plugins/codemirror/lib/codemirror.js' => array(),
                                self::$PUBLIC_PATH . '/assets/plugins/codemirror/mode/smarty/smarty.js' => array(),
                                self::$PUBLIC_PATH . '/assets/plugins/codemirror/mode/css/css.js' => array(),
                                self::$PUBLIC_PATH . '/assets/plugins/codemirror/mode/javascript/javascript.js' => array(),
                                self::$PUBLIC_PATH . '/assets/plugins/codemirror/mode/properties/properties.js' => array()
                            ));
                        }
                    case 'custom_pages':
                        if (isset($_GET['action'])) {
                            $this->addJSFiles(array(
                                self::$PUBLIC_PATH . '/assets/plugins/ckeditor/ckeditor.js' => array()
                            ));

                            $this->addJSScript(Input::createEditor('inputContent', true));
                        }
                    break;
                    case 'seo':
                        $this->addCSSFiles(array(
                            self::$PUBLIC_PATH . '/assets/css/dataTables.bootstrap4.min.css' => array()
                        ));

                        $this->addJSFiles(array(
                            self::$PUBLIC_PATH . '/assets/plugins/dataTables/jquery.dataTables.min.js' => array(),
                            self::$PUBLIC_PATH . '/assets/js/dataTables.bootstrap4.min.js' => array()
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
                        if (!defined('EDITING_USER')) {
                            $this->addCSSFiles(array(
                                self::$PUBLIC_PATH . '/assets/css/dataTables.bootstrap4.min.css' => array(),
                                self::$PUBLIC_PATH . '/assets/css/bootstrap-duallistbox.css' => array()
                            ));

                            $this->addJSFiles(array(
                                self::$PUBLIC_PATH . '/assets/plugins/dataTables/jquery.dataTables.min.js' => array(),
                                self::$PUBLIC_PATH . '/assets/plugins/dataTables/jquery.bootstrap-duallistbox.js' => array(),
                                self::$PUBLIC_PATH . '/assets/js/dataTables.bootstrap4.min.js' => array()
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
                                self::$PUBLIC_PATH . '/assets/js/jquery-ui.min.js' => array()
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
                                    self::$PUBLIC_PATH . '/assets/plugins/image-picker/image-picker.css' => array()
                                ));

                                $this->addCSSStyle('
                                    .thumbnails li img{
                                        width: 200px;
                                    }
								');

                                $this->addJSFiles(array(
                                    self::$PUBLIC_PATH . '/assets/plugins/image-picker/image-picker.min.js' => array()
                                ));

                                $this->addJSScript('$(".image-picker").imagepicker();');
                            }
                        }
                    break;
                    case 'hooks':
                    case 'discord':
                    case 'security':
                        if (isset($_GET['view'])) {
                            $this->addCSSFiles(array(
                                self::$PUBLIC_PATH . '/assets/css/dataTables.bootstrap4.min.css' => array()
                            ));

                            $this->addJSFiles(array(
                                self::$PUBLIC_PATH . '/assets/plugins/dataTables/jquery.dataTables.min.js' => array(),
                                self::$PUBLIC_PATH . '/assets/js/dataTables.bootstrap4.min.js' => array()
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
                            self::$PUBLIC_PATH . '/assets/plugins/dropzone/dropzone.min.css' => array(),
                            self::$PUBLIC_PATH . '/assets/plugins/image-picker/image-picker.css' => array()
                        ));

                        $this->addJSFiles(array(
                            self::$PUBLIC_PATH . '/assets/plugins/dropzone/dropzone.min.js' => array(),
                            self::$PUBLIC_PATH . '/assets/plugins/image-picker/image-picker.min.js' => array(),
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
                                self::$PUBLIC_PATH . '/assets/plugins/ckeditor/ckeditor.js' => array()
                            ));

                            $this->addJSScript(Input::createEditor('InputPlaceholder', true));
                        }

                        $this->addJSFiles(array(
                            self::$PUBLIC_PATH . '/assets/js/jquery-ui.min.js' => array()
                        ));

                    break;
                    case 'forum_settings':
                }
            }
        }

        public static function getConfig()
        {
            $configFile = __DIR__ . '/settings/config.json';

            $configData = file_get_contents($configFile);
            if (!$configData) {
                $configData = '{}';
            }
            return json_decode($configData, 1);
        }
    }
}

$template = new Noir_Panel_Template($cache, $smarty, $language, $user, $pages);
