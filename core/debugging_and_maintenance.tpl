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
                            <h4 class="mb-sm-0">{$DEBUGGING_AND_MAINTENANCE}</h4>
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                    <li class="breadcrumb-item active">{$CONFIGURATION}</li>
                                    <li class="breadcrumb-item active">{$DEBUGGING_AND_MAINTENANCE}</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                {include file='includes/update.tpl'}
                <form action="" method="post">
                <input type="hidden" name="token" value="{$TOKEN}">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">
                                {$MAINTENANCE_MODE_MESSAGE}
                            </div>
                            <div class="card-body p-2 pb-0">
                                <div class="form-group">
                                    <textarea style="width:100%" id="MaintenanceMessage" name="message">{$MAINTENANCE_MODE_MESSAGE_VALUE}</textarea onchange="this.form.submit()">
                                </div>
                            </div>
                            <div class="card-footer p-0 bg-transparent">
                                <input type="submit" value="{$SUBMIT}" class="btn btn-primary btn-block">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            {if isset($ERROR_LOGS)}
                            <div class="card-header">
                                <a href="{$ERROR_LOGS_LINK}" class="btn btn-primary btn-sm">{$ERROR_LOGS}</a>
                            </div>
                            {/if}
                            <div class="card-body">
                                <div class="d-flex">
                                    <input class="form-check form-switch" type="checkbox" id="InputDebug" name="enable_debugging" switch="success" value="1" {if $ENABLE_DEBUG_MODE_VALUE eq 1} checked{/if} onchange="this.form.submit()">
                                    <label class="form-label" for="InputDebug" data-on-label="Yes" data-off-label="No"></label>
                                    <label for="InputDebug"> &nbsp;{$ENABLE_DEBUG_MODE}</label>
                                </div>
                                <div class="d-flex">
                                    <input class="form-check form-switch" type="checkbox" id="InputMaintenance" name="enable_maintenance" switch="success" value="1" {if $ENABLE_MAINTENANCE_MODE_VALUE eq 1} checked{/if} onchange="this.form.submit()">
                                    <label class="form-label" for="InputMaintenance" data-on-label="Yes" data-off-label="No"></label>
                                    <label for="InputMaintenance"> &nbsp;{$ENABLE_MAINTENANCE_MODE}</label>
                                </div>
                                <div class="d-flex">
                                    <input class="form-check form-switch" type="checkbox" id="InputPageLoad" name="enable_page_load_timer" switch="success" value="1" {if $ENABLE_PAGE_LOAD_TIMER_VALUE eq 1} checked{/if} onchange="this.form.submit()">
                                    <label class="form-label" for="InputPageLoad" data-on-label="Yes" data-off-label="No"></label>
                                    <label for="InputPageLoad"> &nbsp;{$ENABLE_PAGE_LOAD_TIMER}</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
        {include file='footer.tpl'}
    </div>
</div>
{include file='scripts.tpl'}
</body>
</html>