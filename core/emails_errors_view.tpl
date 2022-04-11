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
                                <h4 class="mb-sm-0">{$VIEWING_ERROR}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                        <li class="breadcrumb-item active">{$CONFIGURATION}</li>
                                        <li class="breadcrumb-item"><a href="{$EMAILS_LINK}">{$EMAILS}</a></li>
                                        <li class="breadcrumb-item active">{$VIEWING_ERROR}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        {include file='includes/update.tpl'}
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <span class="font-size-22">{$VIEWING_ERROR}</span>
                            <span class="float-end">
                                <a class="btn btn-danger btn-sm" href="#" onclick="showDeleteModal()">{$DELETE_ERROR}</a>
                                {if $TYPE_ID eq 1}
                                    {if isset($VALIDATE_USER_TEXT)}
                                    <a class="btn btn-secondary btn-sm" href="{$VALIDATE_USER_LINK}">{$VALIDATE_USER_TEXT}</a>
                                    {/if}
                                {elseif $TYPE_ID eq 4}
                                    {if isset($SHOW_REGISTRATION_LINK)}
                                    <button class="btn btn-secondary btn-sm" type="button" onclick="showRegistrationModal()">{$SHOW_REGISTRATION_LINK}</button>
                                    {/if}
                                {/if}
                                <a class="btn btn-primary btn-sm ml-5" href="{$BACK_LINK}">{$BACK}</a>
                            </span>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tr>
                                        <td><b>{$TYPE}</b></td>
                                        <td class="text-info">{$TYPE_VALUE}</td>
                                    </tr>
                                    <tr>
                                        <td><b>{$DATE}</b></td>
                                        <td>{$DATE_VALUE}</td>
                                    </tr>
                                    <tr>
                                        <td><b>{$USERNAME}</b></td>
                                        <td><a href="/panel/users/" target="_blank">{$USERNAME_VALUE}</a></td>
                                    </tr>
                                    <tr>
                                        <td><b>{$CONTENT}</b></td>
                                        <td class="text-danger">{$CONTENT_VALUE}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {include file='footer.tpl'}
        </div>
        <!-- Show registration link modal -->
        <div class="modal fade" id="registrationModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">{$REGISTRATION_LINK}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        {$REGISTRATION_LINK_VALUE}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">{$CLOSE}</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Delete error modal -->
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body text-center text-warning">
                        {$CONFIRM_DELETE_ERROR}
                    </div>
                    <div class="modal-footer">
                        <a href="{$DELETE_ERROR_LINK}" class="btn btn-primary btn-sm">{$YES}</a>
                        <span class="float-end">
                            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">{$NO}</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {include file='scripts.tpl'}
    <script type="text/javascript">
        function showDeleteModal() {
            $('#deleteModal').modal('show');
        }

        function showRegistrationModal() {
            $('#registrationModal').modal('show');
        }
    </script>
</body>
</html>