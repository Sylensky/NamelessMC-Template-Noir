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
                                <h4 class="mb-sm-0">{$EDITING_WIDGET}</h4>
                                <div class="page-title-right">
                                    {if isset($SETTINGS)}
                                    <a href="{$SETTINGS_LINK}" class="btn btn-outline-success">{$SETTINGS}</a>
                                    {/if}
                                    <a href="{$BACK_LINK}" class="btn btn-outline-primary">{$BACK}</a>
                                </div>
                            </div>
                        </div>
                        {include file='includes/update.tpl'}
                    </div>
                    <form class="" action="" method="post">
                    <div class="row">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <div class="col-sm-12 col-md-6 col-xl-6">
                            <div class="card">
                                <div class="card-header">
                                    <span class="font-size-22">General Settings</span>
                                    <span class="float-end">
                                        <input type="submit" class="btn btn-primary btn-sm" value="{$L_SAVE}">
                                    </span>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="inputOrder">{$WIDGET_ORDER}</label>
                                        <input data-toggle="touchspin" id="inputOrder" name="order" type="text" value="{$ORDER}">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputLocation">{$WIDGET_LOCATION}</label>
                                        <select name="location" class="form-control S2NoSearch" id="inputLocation" onchange="this.form.submit()">
                                            <option value="right" {if $LOCATION eq 'right' } selected{/if}>{$RIGHT}</option>
                                            <option value="left" {if $LOCATION eq 'left' } selected{/if}>{$LEFT}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6 col-xl-6">
                            <div class="card">
                                <div class="card-header">
                                    <span class="font-size-22">Widget Page Settings</span>
                                </div>
                                <div class="card-body">
                                    {foreach from=$POSSIBLE_PAGES key=module item=module_pages}
                                    {if count($module_pages)}
                                    <span class="text-primary font-size-20">{$MODULE} {$MODULE_SEPERATOR} {$module|escape}</span>
                                    {foreach from=$module_pages key=page item=value}
                                        <div class="ms-2 card-header p-1 mb-1">
                                            <label class="m-0" for="{$page|escape}"><i class="fas fa-file text-info" data-bs-toggle="tooltip" title="{if in_array($page, $ACTIVE_PAGES)} Hide {else} Show {/if} on <span class='text-warning'>{($page|escape)}</span> page"></i> {($page|escape)|ucfirst}</label>
                                            <span class="float-end">
                                                <div class="d-flex">
                                                    <input class="form-check form-switch m-0" type="checkbox" id="{$page|escape}" name="pages[]" switch="bool" value="{$page|escape}" {if in_array($page, $ACTIVE_PAGES)} checked{/if} onchange="this.form.submit()">
                                                    <label class="form-label m-0" for="{$page|escape}" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                                    <label class="m-0" for="{$page|escape}"> &nbsp;{$ENABLE_API}</label>
                                                </div>
                                            </span>
                                        </div>
                                    {/foreach}
                                    <hr>
                                    {/if}
                                    {/foreach}
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