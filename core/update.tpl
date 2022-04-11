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
                            <h4 class="mb-sm-0">{$UPDATE}</h4>
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item active">{$UPDATE}</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                    {if isset($PHP_WARNING)}
                        <div class="alert bg-danger text-white">{$PHP_WARNING}</div>
                    {/if}
                    {if !isset($PREVENT_UPGRADE)}
                        {if isset($NEW_UPDATE)}
                        <div class="card">
                            <div class="card-header">{$NEW_UPDATE}</div>
                            <div class="card-body">
                                <div class="text-center">
                                    <span class="text-warning">{$CURRENT_VERSION}</span> - <span class="text-success">{$NEW_VERSION}</span>
                                </div>
                                <hr>
                                <h2>{$INSTRUCTIONS}</h2>
                                <p>{$INSTRUCTIONS_VALUE}</p>
                            </div>
                            <div class="card-footer">
                                <a href="{$DOWNLOAD_LINK}" class="btn btn-primary">{$DOWNLOAD}</a>
                                <span class="float-end">
                                    <button class="btn btn-info" type="button" onclick="showConfirmModal()">{$UPDATE}</button>
                                </span>
                            </div>
                        </div>
                        {else}
                        <div class="alert bg-success text-white">
                            <span><i class="icon fa fa-check"></i> {$UP_TO_DATE}</span>
                        </div>
                        <div class="text-center">
                            <a href="{$CHECK_AGAIN_LINK}" class="btn btn-primary">{$CHECK_AGAIN}</a>
                        </div>
                        {/if}
                    {/if}
                    </div>
                </div>
            </div>
        </div>
        {include file='footer.tpl'}
    </div>
    <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-warning">{$WARNING}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-warning">
                    {$INSTALL_CONFIRM}
                </div>
                <div class="modal-footer">
                    <a href="{$UPGRADE_LINK}" class="btn btn-primary btn-sm">{$UPDATE}</a>
                    <span class="float-end">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">{$CANCEL}</button>
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
{include file='scripts.tpl'}
<script type="text/javascript">
  function showConfirmModal() {
    $('#confirmModal').modal('show');
  }
</script>
</body>
</html>