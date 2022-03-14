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
                                <h4 class="mb-sm-0">{$SEND_TEST_EMAIL}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                        <li class="breadcrumb-item active">{$CONFIGURATION}</li>
                                        <li class="breadcrumb-item"><a href="{$EMAILS_LINK}">{$EMAILS}</a></li>
                                        <li class="breadcrumb-item active">{$SEND_TEST_EMAIL}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        {include file='includes/update.tpl'}
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <span class="font-size-22">{$SEND_TEST_EMAIL}</span>
                            <span class="float-right">
                                <a class="btn btn-primary btn-sm" href="{$BACK_LINK}">{$BACK}</a>
                            </span>
                        </div>
                        <div class="card-body text-center">
                            {if isset($SEND_TEST_EMAIL_INFO)}
                            <span class="text-info">{$SEND_TEST_EMAIL_INFO}</span>
                            {/if}
                        </div>
                        {if isset($SEND_TEST_EMAIL_INFO)}
                        <div class="card-footer text-center p-0">
                            <a href="{$SEND_LINK}" class="btn btn-primary btn-block btn-sm">Send Test Email</a>
                        </div>
                        {/if}
                    </div>
                </div>
            </div>
            {include file='footer.tpl'}
        </div>
    </div>
    {include file='scripts.tpl'}
</body>
</html>