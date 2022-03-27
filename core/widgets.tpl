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
                            <h4 class="mb-sm-0">{$WIDGETS}</h4>
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item active">{$LAYOUT}</li>
                                    <li class="breadcrumb-item active">{$WIDGETS}</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    {include file='includes/update.tpl'}
                </div>
                <div class="row">
                {foreach from=$WIDGETS_LIST item=widget name=widget_list}
                    <div class="col-sm-12 col-md-12 col-xl-4">
                        <div class="card">
                            <div class="card-header">
                                <span class="font-size-22">
                                <i class="fas fa-question-circle text-info" data-bs-toggle="tooltip" data-bs-original-title="{$widget.description}"></i>
                                     {$widget.name}</span> <span class="text-info"><small>{$widget.module}</small></span>
                                <span class="float-end">
                                {if $widget.enabled}
                                    <a href="{$widget.settings_link}" class="btn btn-primary btn-sm">{$EDIT}</a>
                                    <form action="{$widget.disable_link}" method="post" style="display: inline">
                                        <input type="hidden" name="token" value="{$TOKEN}" />
                                        <input type="submit" class="btn btn-danger btn-sm" value="{$DISABLE}">
                                    </form>
                                    {else}
                                    <form action="{$widget.enable_link}" method="post" style="display: inline">
                                        <input type="hidden" name="token" value="{$TOKEN}" />
                                        <input type="submit" class="btn btn-success btn-sm" value="{$ENABLE}">
                                    </form>
                                    {/if}
                                </span>
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