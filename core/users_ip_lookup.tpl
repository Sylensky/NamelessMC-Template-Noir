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
                                <h4 class="mb-sm-0">{$IP_LOOKUP}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                        <li class="breadcrumb-item active">{$USER_MANAGEMENT}</li>
                                        <li class="breadcrumb-item active">{$IP_LOOKUP}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                    {include file='includes/update.tpl'}
                    <div class="card">
                        <div class="card-header">
                            {$SEARCH_FOR_IP_OR_USER}
                        </div>
                        <div class="card-body">
                            <form action="" method="post">
                                <input type="hidden" name="token" value="{$TOKEN}">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="search" name="search" onchange="this.form.submit()">
                                </div>
                            </form>
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