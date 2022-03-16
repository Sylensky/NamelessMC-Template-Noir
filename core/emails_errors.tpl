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
                                <h4 class="mb-sm-0">{$EMAIL_ERRORS}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                        <li class="breadcrumb-item active">{$CONFIGURATION}</li>
                                        <li class="breadcrumb-item"><a href="{$EMAILS_LINK}">{$EMAILS}</a></li>
                                        <li class="breadcrumb-item active">{$EMAIL_ERRORS}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        {include file='includes/update.tpl'}
                    </div>
                    {if isset($NO_ERRORS)}
                    <div class="text-center text-success">
                        <div class="alert alert-success">
                            {$NO_ERRORS}
                        </div>
                        <a href="{$BACK_LINK}" class="btn btn-primary btn-sm">{$BACK}</a>
                    </div>
                    {else}
                    <div class="card">
                        <div class="card-header">
                            <span class="font-size-22">{$EMAIL_ERRORS}</span>
                            <span class="float-end">
                                <button type="button" class="btn btn-warning btn-sm mr-3" onclick="showPurgeModal()">{$PURGE_BUTTON}</button>
                                <a href="{$BACK_LINK}" class="btn btn-primary btn-sm">{$BACK}</a>
                            </span>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-borderless table-striped">
                                    <thead>
                                        <tr>
                                            <th>{$TYPE}</th>
                                            <th>{$DATE}</th>
                                            <th>{$USERNAME}</th>
                                            <th class="text-right">{$ACTIONS}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {foreach from=$EMAIL_ERRORS_ARRAY item=item}
                                        <tr>
                                            <td>{$item.type}</td>
                                            <td>{$item.date}</td>
                                            <td><a href="/panel/users/" target="_blank">{$item.user}</a></td>
                                            <td class="text-right">
                                                <a href="{$item.view_link}" class="btn btn-outline-info btn-sm"><i class="far fa-fw fa-search"></i></a>
                                                <a href="#" onclick="showDeleteModal({$item.id})" class="btn btn-outline-danger btn-sm"><i class="far fa-fw fa-trash"></i></a>
                                            </td>
                                        </tr>
                                        {/foreach}
                                    </tbody>
                                </table>
                            </div>
                            <div class="text-center mt-4">
                                {$PAGINATION}
                            </div>
                        </div>
                    </div>
                    {/if}
                </div>
            </div>
            {include file='footer.tpl'}
        </div>
        <!-- Purge errors modal -->
        <div class="modal fade" id="purgeModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body text-center text-warning">
                        {$CONFIRM_PURGE_ERRORS}
                    </div>
                    <div class="modal-footer">
                        <a href="{$PURGE_LINK}" class="btn btn-primary btn-sm"">{$YES}</a>
                        <span class="float-end">
                            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">{$NO}</button>
                        </span>
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
                        <a href="" id="deleteLink" class="btn btn-primary btn-sm">{$YES}</a>
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
        function showPurgeModal() {
            $('#purgeModal').modal().show();
        }

        function showDeleteModal(id) {
            $('#deleteLink').attr('href', '{$DELETE_LINK}'.replace('{literal}{x}{/literal}', id));
            $('#deleteModal').modal().show();
        }
    </script>
</body>
</html>