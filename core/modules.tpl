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
                                <h4 class="mb-sm-0">{$MODULES}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                        <li class="breadcrumb-item active">{$MODULES}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        {include file='includes/update.tpl'}
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <a class="btn btn-outline-primary" style="margin-bottom: 15px;" href="{$INSTALL_MODULE_LINK}">{$INSTALL_MODULE}</a>
                            <span class="float-right">
                                <a class="btn btn-outline-primary" href="{$VIEW_ALL_MODULES_LINK}" target="_blank"><i class="far fa-external-link"></i> {$FIND_MODULES}</a>
                            </span>
                            {if isset($WEBSITE_MODULES_ERROR)}
                            <div class="alert bg-danger text-white">{$WEBSITE_MODULES_ERROR}</div>
                            {/if}
                        </div>
                    </div>
                    <hr class="hx mt-1">
                    <div class="row">
                        {foreach from=$MODULE_LIST item=module}
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header">
                                    <div class="row">
                                        <span class="col">
                                            <strong>{$module.name}</strong> <span class="font-size-10 text-info">{$module.version}</span> {if $module.version_mismatch}<i class="far fa-exclamation-triangle fa-sm text-warning" data-toggle="popover" data-title="{$WARNING}" data-content="{$module.version_mismatch}"></i>{/if}
                                            <br> <small>{$AUTHOR} {$module.author}</small>
                                        </span>
                                        <span class="md-6 md-8 float-md-right">
                                            {if $module.enabled}
                                            {if $module.disable_link}
                                            <form action="{$module.disable_link}" method="post">
                                                <input type="hidden" name="token" value="{$TOKEN}" />
                                                <input type="submit" class="btn btn-danger btn-sm" value="{$DISABLE}" />
                                            </form>
                                            {else}
                                            <a class="btn btn-warning btn-sm disabled"><i class="fa fa-lock"></i></a>
                                            {/if}
                                            {else}
                                            <form action="{$module.enable_link}" method="post">
                                                <input type="hidden" name="token" value="{$TOKEN}" />
                                                <input type="submit" class="btn btn-primary btn-sm" value="{$ENABLE}" />
                                            </form>
                                            {/if}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {/foreach}
                    </div>
                </div>
            </div>
            {include file='footer.tpl'}
        </div>
    </div>
    {include file='scripts.tpl'}
</body>
</html>