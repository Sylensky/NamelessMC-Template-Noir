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
                                <h4 class="mb-sm-0">{$EDITING_HOOK}</h4>
                                <div class="page-title-right d-none d-sm-block">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item active">{$CONFIGURATION}</li>
                                        <li class="breadcrumb-item"><a href="{$BACK_LINK}">{$HOOKS}</a></li>
                                        <li class="breadcrumb-item active">{$EDITING_HOOK}</li>
                                    </ol>
                                </div>
                            </div>
                            {include file='includes/update.tpl'}
                        </div>
                    </div>
                    <form role="form" action="" method="post">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="card">
                                    <div class="card-header">
                                        <span class="font-size-20">Editing Webhook <span class="text-info">{$HOOK_NAME_VALUE}</span></span>
                                        <span class="float-right">
                                            <a href="{$BACK_LINK}" data-toggle="tooltip" data-placement="top" title="{$BACK}"><i class="fas fa-arrow-left"></i></a>
                                        </span>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="InputName">{$HOOK_NAME}</label>
                                            <input type="text" name="hook_name" class="form-control" id="InputName" value="{$HOOK_NAME_VALUE}" placeholder="{$HOOK_NAME_VALUE}">
                                        </div>
                                        <div class="form-group">
                                            <label for="InputURL">{$HOOK_URL}</label>
                                            <input type="url" name="hook_url" class="form-control" id="InputURL" value="{$HOOK_URL_VALUE}" placeholder="https://example.com/examplelistener">
                                        </div>

                                        <div class="form-group">
                                            <label for="link_location">{$HOOK_TYPE}</label>
                                            <select class="form-control select2-selection--single" id="hook_type" name="hook_type">
                                                <option value="2" {if $HOOK_TYPE_VALUE eq 2} selected{/if}>Discord</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-header">
                                        <span class="font-size-20">{$HOOK_EVENTS}</span>
                                        <span class="float-md-right">
                                            <a href="{$BACK_LINK}" data-toggle="tooltip" data-placement="top" title="{$BACK}"><i class="fas fa-arrow-left"></i></a>
                                        </span>
                                    </div>
                                    <div class="card-body">
                                        {foreach from=$ALL_HOOKS key=key item=item}
                                        <div class="d-flex">
                                            <input class="form-check form-switch" type="checkbox" name="events[{$key|escape}]" id="events[{$key|escape}]" switch="success" value="1" {if in_array($key|escape, $ENABLED_HOOKS)} checked{/if}>
                                            <label class="form-label" for="events[{$key|escape}]" data-on-label="On" data-off-label="Off"></label>
                                            <label for="InputTwitterStyle"> &nbsp;{$item|escape}</label>
                                        </div>
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                        </div>
                        <input type="submit" class="btn btn-primary btn-sm btn-block" value="Save Webhook">
                    </form>
                </div>
            </div>
            {include file='footer.tpl'}
        </div>
    </div>
    {include file='scripts.tpl'}
</body>

</html>