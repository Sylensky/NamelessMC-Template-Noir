{include file='header.tpl'}

<body id="page-top">
    <div id="wrapper">
        {include file='sidebar.tpl'}
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                {include file='navbar.tpl'}
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">Editing Group <span class="text-info">{$GROUP_NAME}</span></h4>
                                <div class="page-title-right">
                                    <a class="btn btn-outline-info btn-sm" href="{$CANCEL_LINK}" data-bs-toggle="tooltip" data-placement="top" title="{$L_BACK}"><i class="fad fa-arrow-left"></i> {$L_BACK}</a>
                                    {if isset($PERMISSIONS)}
                                    <a class="btn btn-outline-warning btn-sm" href="{$PERMISSIONS_LINK}" data-bs-toggle="tooltip" data-placement="top" title="{$PERMISSIONS}"><i class="fad fa-user-lock"></i> {$PERMISSIONS}</a>
                                    {/if}
                                    {if isset($DELETE_GROUP)}
                                    <button class="btn btn-outline-danger btn-sm" type="button" onclick="showDeleteModal()" data-bs-html="true" data-bs-toggle="tooltip" title="{$L_DELETE} Group <span class='text-info'>{$GROUP_NAME}</span>"><i class="fad fa-trash"></i> {$L_DELETE}</button>
                                    {/if}
                                </div>
                            </div>
                        </div>
                        {include file='includes/update.tpl'}
                    </div>
                    <div class="row">
                        <form class="d-contents" role="form" action="" method="post">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <input type="hidden" name="action" value="update">
                            <div class="col-sm-12 col-md-12 col-xl-4">
                                <div class="card">
                                    <div class="card-header">
                                        <span class="font-size-20">General Settings</span>
                                        <span class="float-end">
                                            <button class="btn btn-outline-success btn-sm" data-bs-toggle="tooltip" data-placement="top" title="{$L_SAVE}" type="submit"><i class="fad fa-save"></i> {$L_SAVE}</button>
                                        </span>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="InputGroupname">{$NAME}</label>
                                            <input type="text" minlength="2" maxlength="20" name="groupname" class="form-control" id="InputGroupname" placeholder="{$NAME}" value="{$GROUP_NAME}" onchange="this.form.submit()">
                                        </div>
                                        <div class="form-group">
                                            <label for="InputOrder">{$GROUP_ORDER}</label>
                                            <input type="number" min="1" class="form-control" id="InputOrder" name="order" value="{$GROUP_ORDER_VALUE}" onchange="this.form.submit()">
                                        </div>
                                        {if $DISCORD_INTEGRATION}
                                        <div class="form-group">
                                            <label for="InputDiscordRoleID">{$DISCORD_ROLE_ID} <span class="badge badge-info" data-bs-toggle="popover" data-title="{$INFO}" data-content="{$ID_INFO|escape}"><i class="fa fa-question"></i></label>
                                            <input type="number" min="1" class="form-control" id="InputDiscordRoleID" name="discord_role_id" value="{$DISCORD_ROLE_ID_VALUE}" onchange="this.form.submit()">
                                        </div>
                                        {/if}
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-12 col-xl-4">
                                <div class="card">
                                    <div class="card-header">
                                        <span class="font-size-20">Style Settings</span>
                                        <span class="float-end">
                                            <button class="btn btn-outline-success btn-sm" data-bs-toggle="tooltip" data-placement="top" title="{$L_SAVE}" type="submit"><i class="fad fa-save"></i> {$L_SAVE}</button>
                                        </span>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="InputColour">{$GROUP_USERNAME_COLOUR}</label>
                                            <div class="input-group d-block">
                                                <input type="text" name="username_style" class="form-control color-picker" id="InputColour" value="{$GROUP_USERNAME_COLOUR_VALUE}" onchange="this.form.submit()">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="InputHTML">{$GROUP_HTML}</label>
                                            <input type="text"  minlength="2" maxlength="1024" name="html" class="form-control" id="InputHTML" placeholder="{$GROUP_HTML}" value="{$GROUP_HTML_VALUE}" onchange="this.form.submit()">
                                        </div>
                                        <div class="form-group">
                                            <label for="InputCss">{$GROUP_USERNAME_CSS}</label>
                                            <input type="text" name="username_css" class="form-control" id="InputCss" placeholder="{$GROUP_USERNAME_CSS}" value="{$GROUP_USERNAME_CSS_VALUE}" onchange="this.form.submit()">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-12 col-xl-4">
                                <div class="card">
                                    <div class="card-header">
                                        <span class="font-size-20">Misc Settings</span>
                                        <span class="float-end">
                                            <button class="btn btn-outline-success btn-sm" data-bs-toggle="tooltip" data-placement="top" title="{$L_SAVE}" type="submit"><i class="fad fa-save"></i> {$L_SAVE}</button>
                                        </span>
                                    </div>
                                    <div class="card-body">
                                        <div class="d-flex">
                                            <input type="hidden" name="tfa" value="0">
                                            <input class="form-check form-switch" type="checkbox" name="tfa" id="InputTfa" switch="success" value="1" {if $FORCE_TFA_VALUE eq 1} checked{/if} onchange="this.form.submit()">
                                            <label class="form-label" for="InputTfa" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                            <label for="InputTfa"> &nbsp;{$FORCE_TFA} <i class="far fa-question-circle text-warning" data-bs-toggle="popover" data-title="{$WARNING}" data-placement="bottom" data-content="{$FORCE_TFA_WARNING|escape}"></i></label>
                                        </div>

                                        <div class="d-flex">
                                            <input type="hidden" name="staff" value="0">
                                            <input class="form-check form-switch" type="checkbox" name="staff" id="InputStaff" switch="success" value="1" {if $STAFF_GROUP_VALUE eq 1} checked{/if} onchange="this.form.submit()">
                                            <label class="form-label" for="InputStaff" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                            <label for="InputStaff"> &nbsp;{$STAFF_GROUP}</label>
                                        </div>
                                        {if !isset($OWN_GROUP)}
                                        <div class="d-flex">
                                            <input type="hidden" name="staffcp" value="0">
                                            <input class="form-check form-switch" type="checkbox" name="staffcp" id="InputStaffCP" switch="success" value="1" {if $STAFF_CP_VALUE eq 1} checked{/if} onchange="this.form.submit()">
                                            <label class="form-label" for="InputStaffCP" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                            <label for="InputStaffCP"> &nbsp;{$STAFF_CP}</label>
                                        </div>
                                        {/if}
                                        <div class="d-flex">
                                            <input type="hidden" name="default" value="0">
                                            <input class="form-check form-switch" type="checkbox" name="default" id="InputDefault" switch="success" value="1" {if $DEFAULT_GROUP_VALUE eq 1} checked{/if} onchange="this.form.submit()">
                                            <label class="form-label" for="InputDefault" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                            <label for="InputDefault"> &nbsp;{$DEFAULT_GROUP}</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            {include file='footer.tpl'}
        </div>
        {if isset($DELETE_GROUP)}
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        {$CONFIRM_DELETE}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">{$NO}</button>
                        <form action="" method="post">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="{$GROUP_ID}">
                            <input type="submit" class="btn btn-danger btn-sm" value="{$YES}">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        {/if}
    </div>
    {include file='scripts.tpl'}
    <script type="text/javascript">
        {if isset($DELETE_GROUP)}
        function showDeleteModal() {
            $('#deleteModal').modal('show');
        }
        {/if}
    </script>
</body>
</html>