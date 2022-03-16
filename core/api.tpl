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
                            <h4 class="mb-sm-0">{$API}</h4>
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                    <li class="breadcrumb-item active">{$CONFIGURATION}</li>
                                    <li class="breadcrumb-item active">{$API}</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    {include file='includes/update.tpl'}
                </div>
                <form action="" method="post">
                <input type="hidden" name="token" value="{$TOKEN}">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">{$L_API_CREDENTIALS}
                                    <span class="float-end">
                                        <a class="btn btn-primary btn-ssm" href="{$API_ENDPOINTS_LINK}">{$API_ENDPOINTS}</a>
                                        <a class="btn btn-primary btn-ssm" href="{$GROUP_SYNC_LINK}">{$GROUP_SYNC}</a>
                                    </span>
                                </div>
                                <div class="card-body">
                                {if $API_ENABLED}
                                    <div class="form-group">
                                        <label for="InputAPIKey">{$API_KEY}</label>
                                        <div class="input-group">
                                            <input type="text" name="api_key" id="InputAPIKey" class="form-control" readonly value="{if $API_ENABLED}{$API_KEY_VALUE}{else}{$ENABLE_API_FOR_URL}{/if}">
                                            {if $API_ENABLED}
                                                <div class="input-group-append">
                                                    <a onclick="showRegenModal();" class="btn btn-primary text-white">{$CHANGE}</a>
                                                </div>
                                            {/if}
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="InputAPIURL">{$API_URL}</label>
                                        <div class="input-group">
                                            <input type="text" name="api_url" id="InputAPIURL" class="form-control" readonly value="{if $API_ENABLED}{$API_URL_VALUE}{else}{$ENABLE_API_FOR_URL}{/if}">
                                            {if $API_ENABLED}
                                                <div class="input-group-append">
                                                <a onclick="copyURL();" class="btn btn-primary text-white">{$COPY}</a>
                                                </div>
                                            {/if}
                                        </div>
                                    </div>
                                    {else}
                                        <div class="text-warning text-center">{$ENABLE_API_FOR_URL}</div>
                                    {/if}
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">{$L_API_SETTINGS}</div>
                                <div class="card-body">
                                    <div class="d-flex">
                                        <input class="form-check form-switch" type="checkbox" id="enable_api" name="enable_api" switch="success" value="1" {if $API_ENABLED eq 1}checked{/if} onchange="this.form.submit()">
                                        <label class="form-label" for="enable_api" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                        <label for="enable_api"> &nbsp;{$ENABLE_API}</label>
                                    </div>
                                    {if $API_ENABLED}
                                    <div class="d-flex">
                                        <input class="form-check form-switch" type="checkbox" name="verification" id="verification" switch="success" {if $EMAIL_VERIFICATION_VALUE eq 1}checked{/if} onchange="this.form.submit()">
                                        <label class="form-label" for="verification" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                        <label for="verification"> &nbsp;{$EMAIL_VERIFICATION}</label>
                                    </div>
                                    <div class="d-flex">
                                        <input class="form-check form-switch" type="checkbox" name="api_verification" id="api_verification" switch="success" {if $API_VERIFICATION_VALUE eq 1}checked{/if} onchange="this.form.submit()">
                                        <label class="form-label" for="api_verification" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                        <label for="api_verification"> &nbsp;{$API_VERIFICATION} <i class="far fa-question-circle text-warning" data-toggle="popover" data-title="{$INFO}" data-placement="bottom" data-content="{$API_VERIFICATION_INFO}"></i></label>
                                    </div>
                                    <div class="d-flex">
                                        <input class="form-check form-switch" type="checkbox" name="username_sync" id="username_sync" switch="success" {if $USERNAME_SYNC_VALUE eq 1} checked{/if} onchange="this.form.submit()">
                                        <label class="form-label" for="username_sync" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                        <label for="username_sync"> &nbsp;{$USERNAME_SYNC} <i class="far fa-question-circle text-warning" data-toggle="popover" data-title="{$INFO}" data-placement="bottom" data-content="{$USERNAME_SYNC_INFO}"></i></label>
                                    </div>
                                    {/if}
                                </div>
                            </div>
                            {if $API_ENABLED}
                            <div class="d-flex mt-2">
                                <div class="card border-left-primary">
                                    <div class="card-body">
                                        <h5><i class="icon fa fa-info-circle"></i> {$INFO}</h5>
                                        {$API_INFO}
                                    </div>
                                </div>
                            </div>
                            {/if}
                        </div>
                    </div>
                </form>
            </div>
        </div>
        {include file='footer.tpl'}
    </div>
    <div class="modal fade" id="regenModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{$ARE_YOU_SURE}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    {$CONFIRM_API_REGEN}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                    <button type="button" onclick="regenKey()" class="btn btn-primary">{$YES}</button>
                </div>
            </div>
        </div>
    </div>
</div>
{include file='scripts.tpl'}
<script type="text/javascript">
  function showRegenModal() {
    $('#regenModal').modal().show();
  }

  function regenKey() {
    const regen = $.post("{$API_KEY_REGEN_URL}", { action: 'regen', token: "{$TOKEN}" });
    regen.done(function() { window.location.reload(); })
  }

  function copyURL() {
    let url = document.getElementById("InputAPIURL");
    url.select();
    document.execCommand("copy");
    toastr.options.progressBar = true;
    toastr.options.closeButton = true;
    toastr.options.positionClass = 'toast-top-right';
    toastr.success("{$COPIED}");
  }
</script>
</body>
</html>