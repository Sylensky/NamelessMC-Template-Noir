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
                                <h4 class="mb-sm-0">{$ERROR_LOGS}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item active">{$CONFIGURATION}</li>
                                        <li class="breadcrumb-item"><a href="{$BACK_LINK}">{$DEBUGGING_AND_MAINTENANCE}</a></li>
                                        <li class="breadcrumb-item active">{$ERROR_LOGS}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        {include file='includes/update.tpl'}
                    </div>
                <div class="card">
                    <div class="card-header">
                        <span class="font-size-20">
                        <a onclick="showPurgeModal()" class="c-pointer" data-bs-toggle="tooltip" data-placement="top" title="{$PURGE_LOG}"><i class="fas fa-trash text-danger"></i></a> {$LOG_NAME}
                        </span>
                        <span class="float-end">
                            <a href="{$BACK_LINK}" data-bs-toggle="tooltip" data-placement="top" title="{$BACK}"><i class="fas fa-arrow-left"></i></a>
                        </span>
                    </div>
                    <div class="card-body p-0 m-0">
                        {if isset($LOG)}
                        <pre>
                            <code class="accesslog logs">{$LOG}</code>
                        </pre>
                        {else}
                        <div class="text-center text-info">{$NO_LOG_FOUND}</div>
                        {/if}
                    </div>
                </div>
            </div>
        </div>
        {include file='footer.tpl'}
    </div>
    <div class="modal fade" id="purgeModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body text-center text-warning">
                    {$CONFIRM_PURGE_ERRORS}
                </div>
                <div class="modal-footer">
                    <a href="{$PURGE_LOG_LINK}" class="btn btn-primary btn-sm">{$YES}</a>
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
    $('#purgeModal').modal('show');
  }
</script>
</body>
</html>