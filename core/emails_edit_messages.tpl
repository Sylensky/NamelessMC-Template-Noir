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
                                <h4 class="mb-sm-0">{$EMAILS_MESSAGES}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb float-sm-right">
                                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                        <li class="breadcrumb-item active">{$CONFIGURATION}</li>
                                        <li class="breadcrumb-item active">{$EMAILS}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        {include file='includes/update.tpl'}
                    </div>
                    <form action="{$BACK_LINK}" method="post">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <span class="font-size-22">{$SELECT_LANGUAGE}</span>
                                        <span class="float-right">
                                            <a href="{$BACK_LINK}" data-toggle="tooltip" data-placement="top" title="{$BACK}"><i class="fas fa-arrow-left"></i></a>
                                        </span>
                                    </div>
                                    <div class="card-body">
                                        <select name="editing_language" class="form-control select2-selection--single" id="inputDefaultLanguage" onchange="this.form.submit()">
                                            {foreach from=$LANGUAGES item=item}
                                            <option value="{$item->name}" {if $item->name eq $EDITING_LANGUAGE} selected{/if}>{$item->name}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-8">
                                <div class="row">
                                    {foreach from=$EMAILS_LIST item=item}
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <span class="font-size-20">{$item[1]}</span>
                                                <span class="float-right">
                                                    <a class="btn btn-info btn-sm" data-toggle="tooltip" title="{$PREVIEW_INFO}" onclick="window.open('{$BACK_LINK}&action=preview&email={$item[0]}', 'newwindow', 'width=700,height=375'); return false;">
                                                        <i class="far fa-eye text-white"></i>
                                                    </a>
                                                    <input type="submit" class="btn btn-primary btn-sm" value="Save">
                                                </span>
                                            </div>
                                            <div class="card-body">
                                                <div class="form-group">
                                                    <label for="{$item[1]}_message">{$SUBJECT}</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" value="{$item[2]['subject']}" name="{$item[0]}_subject" id="{$item[0]}_subject">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="{$item[1]}_message">{$MESSAGE}</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" value="{$item[2]['message']}" name="{$item[0]}_message" id="{$item[0]}_message">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    {/foreach}
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <span class="font-size-22">{$OPTIONS}</span>
                                                <span class="float-right">
                                                    <input type="submit" class="btn btn-primary btn-sm" value="Save">
                                                </span>
                                            </div>
                                            <div class="card-body">
                                                <div class="form-group">
                                                    <label for="greeting">{$GREETING}</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" value="{$GREETING_VALUE}" name="greeting">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="thanks">{$THANKS}</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" value="{$THANKS_VALUE}" name="thanks">
                                                    </div>
                                                </div>
                                            </div>
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