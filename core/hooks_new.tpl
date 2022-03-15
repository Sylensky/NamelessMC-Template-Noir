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
                                <h4 class="mb-sm-0">{$CREATING_NEW_HOOK}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item">{$CONFIGURATION}</li>
                                        <li class="breadcrumb-item"><a href="{$BACK_LINK}">{$HOOKS}</a></li>
                                        <li class="breadcrumb-item active">{$CREATING_NEW_HOOK}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        {include file='includes/update.tpl'}
                    </div>
                    <form role="form" action="" method="post">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="card">
                                <div class="card-header">
                                    <span class="font-size-20">{$CREATING_NEW_HOOK}</span>
                                    <span class="float-right">
                                        <a href="{$BACK_LINK}" data-toggle="tooltip" data-placement="top" title="{$BACK}"><i class="fas fa-arrow-left"></i></a>
                                    </span>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="InputName">{$HOOK_NAME}</label>
                                        <input type="text" name="hook_name" minlength="2" maxlength="128" class="form-control" id="InputName" value="{$HOOK_NAME_VALUE}" placeholder="{$HOOK_NAME}">
                                    </div>
                                    <div class="form-group">
                                        <label for="InputURL">{$HOOK_URL}</label>
                                        <input type="text" name="hook_url" minlength="2" maxlength="2048" class="form-control" id="InputURL" placeholder="https://example.com/examplelistener">
                                    </div>
                                    <div class="form-group">
                                        <label for="link_location">{$HOOK_TYPE}</label>
                                        <select class="form-control select2-selection--single" id="hook_type" name="hook_type">
                                            <option value="2">Discord</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header">
                                    <span class="font-size-20">{$HOOK_EVENTS}</span>
                                </div>
                                <div class="card-body">
                                    {foreach from=$ALL_HOOKS key=key item=item}
                                    <div class="d-flex">
                                        <input class="form-check form-switch" type="checkbox" id="Inputevents[{$key|escape}]" name="events[{$key|escape}]" switch="success" value="1">
                                        <label class="form-label" for="Inputevents[{$key|escape}]" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                        <label for="Inputevents[{$key|escape}]"> &nbsp;{$item|escape}</label>
                                    </div>
                                    {/foreach}
                                </div>
                            </div>
                        </div>
                    </div>
                        <input type="submit" class="btn btn-primary btn-sm btn-block" value="Create Webhook">
                    </form>
                </div>
            </div>
            {include file='footer.tpl'}
        </div>
    </div>
    {include file='scripts.tpl'}
</body>

</html>