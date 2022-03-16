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
                                <h4 class="mb-sm-0">{$ERROR_LOGS}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item active">{$CONFIGURATION}</li>
                                        <li class="breadcrumb-item"><a href="{$BACK_LINK}">{$DEBUGGING_AND_MAINTENANCE}</a></li>
                                        <li class="breadcrumb-item active">{$ERROR_LOGS}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        {include file='includes/update.tpl'}
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <span class="font-size-20">{$ERROR_LOGS}</span>
                            <span class="float-end">
                                <a href="{$BACK_LINK}" data-toggle="tooltip" data-placement="top" title="{$BACK}"><i class="fas fa-arrow-left"></i></a>
                            </span>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tr>
                                        <td>
                                            <a href="{$FATAL_LOG_LINK}">{$FATAL_LOG}</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="{$NOTICE_LOG_LINK}">{$NOTICE_LOG}</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="{$WARNING_LOG_LINK}">{$WARNING_LOG}</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="{$OTHER_LOG_LINK}">{$OTHER_LOG}</a>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            {include file='footer.tpl'}
        </div>

    </div>
    {include file='scripts.tpl'}
</body>
</html>