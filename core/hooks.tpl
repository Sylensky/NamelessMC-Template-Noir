{include file='header.tpl'}
<body id="page-top">
<div id="wrapper">
    {include file='sidebar.tpl'}
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            {include file='navbar.tpl'}
            <div class="container-fluid">
                <div class="row mb-4">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0">{$HOOKS}</h4>
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                    <li class="breadcrumb-item active">{$CONFIGURATION}</li>
                                    <li class="breadcrumb-item active">{$HOOKS}</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                {include file='includes/update.tpl'}
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <span>{$HOOKS_INFO}</span>
                                <span class="float-right">
                                    <a href="{$NEW_HOOK_LINK}" class="btn btn-primary btn-sm"><i class="far fa-plus-circle"></i> {$NEW_HOOK}</a>
                                </span>
                            </div>
                        </div>
                    </div>
                </div><br>
                <div class="card shadow mb-4">
                    <div class="card-body">
                        {include file='includes/alerts.tpl'}
                        {if count($HOOKS_LIST)}
                            <div class="table-responsive">
                                <table class="table table-borderless table-striped">
                                    <thead>
                                    <tr>
                                        <th>{$NAME}</th>
                                        <th>{$LINK}</th>
                                        <th class="float-md-right">Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {foreach from=$HOOKS_LIST item=item item=hook name=hook_list}
                                        <tr>
                                            <td>{$hook.name}</td>
                                            <td><a href="{$hook.edit_link}">{$hook.url}</a></td>
                                            <td>
                                                <div class="float-md-right">
                                                    <a class="btn btn-outline-success btn-sm" href="{$hook.edit_link}"><i class="far fa-edit fa-fw"></i></a>
                                                    <button class="btn btn-outline-danger btn-sm" type="button" onclick="showDeleteModal('{$hook.delete_link}')"><i class="far fa-trash fa-fw"></i></button>
                                                </div>
                                            </td>
                                        </tr>
                                    {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        {else}
                            {$NO_HOOKS}
                        {/if}

                    </div>
                </div>
            </div>
        </div>
        {include file='footer.tpl'}
    </div>
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{$ARE_YOU_SURE}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    {$CONFIRM_DELETE_HOOK}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                    <a href="#" id="deleteLink" class="btn btn-primary">{$YES}</a>
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