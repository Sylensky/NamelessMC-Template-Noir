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
                                <h4 class="mb-sm-0">{$TEMPLATES}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item active">{$LAYOUT}</li>
                                        <li class="breadcrumb-item active">{$TEMPLATES}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        {include file='includes/update.tpl'}
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <a class="btn btn-outline-primary" href="{$INSTALL_TEMPLATE_LINK}">{$INSTALL_TEMPLATE}</a>
                            <span class="float-right">
                                <a class="btn btn-outline-primary" href="{$VIEW_ALL_TEMPLATES_LINK}" target="_blank"><i class="far fa-external-link"></i> {$VIEW_ALL_TEMPLATES}</a>
                            </span>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                    {foreach from=$TEMPLATE_LIST item=template}
                        <div class="col-sm-12 col-md-6 col-xl-6">
                            <div class="card">
                                <div class="card-body">
                                    {$template.name} - {$template.version}
                                    {if $template.default_warning}
                                    &nbsp;
                                    <i class="far fa-exclamation-triangle text-danger" data-toggle="popover" data-title="{$WARNING}" data-content="{$template.default_warning}"></i>
                                    {/if}
                                    {if $template.version_mismatch}
                                    &nbsp;
                                    <i class="far fa-exclamation-triangle text-warning" data-toggle="popover" data-title="{$WARNING}" data-content="{$template.version_mismatch}"></i>
                                    {/if}
                                    <span class="float-right">{$template.author_x}</span>
                                </div>
                                <div class="card-footer">
                                    {if $template.enabled}
                                    {if $template.deactivate_link}
                                    <span class="float-right">
                                        <a class="btn btn-warning btn-sm" href="{$template.deactivate_link}">{$DEACTIVATE}</a>
                                    </span>
                                    {else}
                                    <span class="float-right">
                                        <button role="button" class="btn btn-success btn-sm" disabled>{$ACTIVE}</button>
                                    </span>
                                    {/if}
                                    {if $template.default}
                                    <button role="button" class="btn btn-success btn-sm" disabled>{$DEFAULT}</button>
                                    {else}
                                    <a class="btn btn-primary btn-sm" href="{$template.default_link}">{$MAKE_DEFAULT}</a>
                                    {/if}
                                    {else}
                                    <a class="btn btn-primary btn-sm" href="{$template.activate_link}">{$ACTIVATE}</a>
                                    <span class="float-right">
                                        <button role="button" onclick="showDeleteModal('{$template.delete_link}')" class="btn btn-danger btn-sm"><i class="far fa-trash"></i></button>
                                    </span>
                                    {/if}
                                    {if $template.edit_link}
                                        <a class="btn btn-primary btn-sm" href="{$template.edit_link}">{$EDIT}</a>
                                    {/if}
                                    {if $template.settings_link}
                                        <a class="btn btn-info btn-sm" href="{$template.settings_link}">{$SETTINGS}</a>
                                    {/if}
                                </div>
                            </div>
                        </div>
                        {/foreach}
                    </div>
                </div>
            </div>
            {include file='footer.tpl'}
        </div>
        <!-- Delete error modal -->
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body text-center text-warning">
                        {$CONFIRM_DELETE_TEMPLATE}
                    </div>
                    <div class="modal-footer">
                        <a href="#" id="deleteLink" class="btn btn-primary btn-sm">{$YES}</a>
                        <span class="float-right">
                            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">{$NO}</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {include file='scripts.tpl'}
    <script type="text/javascript">
        function showDeleteModal(id) {
            $('#deleteLink').attr('href', id);
            $('#deleteModal').modal().show();
        }
    </script>
</body>
</html>