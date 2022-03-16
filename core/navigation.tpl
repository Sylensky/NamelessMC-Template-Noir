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
                                <h4 class="mb-sm-0">{$NAVIGATION}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                        <li class="breadcrumb-item">{$CONFIGURATION}</li>
                                        <li class="breadcrumb-item">{$NAVIGATION}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        {include file='includes/update.tpl'}
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="card shadow border-left-primary">
                                <div class="card-body">
                                    <h5><i class="icon fa fa-info-circle"></i> {$INFO}</h5>
                                    <p>{$NAVBAR_ORDER_INSTRUCTIONS}</p>
                                    <p>{$NAVBAR_ICON_INSTRUCTIONS}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <form class="" action="" method="post">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="dropdown_name">{$DROPDOWN_NAME}</label>
                                            <input type="text" class="form-control" id="dropdown_name" name="dropdown_name" value="{$DROPDOWN_NAME_VALUE}" onchange="this.form.submit()">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            {foreach from=$NAV_ITEMS key=key item=item}
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        {$item.title|escape}
                                        <span class="float-end">{$item.order}</span>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="form-group col-md-3">
                                                <label for="input{$item.title|escape}Icon">{$NAVBAR_ORDER}</label>
                                                <div class="input-group">
                                                    <input type="number" min="1" class="form-control" id="input{$item.title|escape}" name="inputOrder[{if isset($item.custom) && is_numeric($item.custom)}{$item.custom}{else}{$key}{/if}]" value="{$item.order|escape}" onchange="this.form.submit()">
                                                </div>
                                            </div>
                                            <div class="form-group col-md-9">
                                                <label for="input{$item.title|escape}Icon">{$NAVBAR_ICON}</label>
                                                <div class="input-group">
                                                    {if $item.icon}
                                                    <div class="input-group-append">
                                                        <span class="btn btn-secondary text-white">{$item.icon}</span>
                                                    </div>
                                                    {/if}
                                                    <input type="text" class="form-control" id="input{$item.title|escape}Icon" name="inputIcon[{if isset($item.custom) && is_numeric($item.custom)}{$item.custom}{else}{$key}{/if}]" value="{$item.icon|escape}" onchange="this.form.submit()">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {/foreach}
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