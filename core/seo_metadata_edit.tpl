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
                                <h4 class="mb-sm-0">Edit Metadata</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                        <li class="breadcrumb-item">{$CONFIGURATION}</li>
                                        <li class="breadcrumb-item"><a href="{$BACK}">{$SEO}</a></li>
                                        <li class="breadcrumb-item active">Edit Metadata</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                    {include file='includes/update.tpl'}
                    <div class="card">
                        <form action="" method="post">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <div class="card-header">
                                {$EDITING_PAGE}
                                <span class="float-end">
                                    <a href="{$BACK_LINK}" data-toggle="tooltip" data-placement="top" title="{$BACK}"><i class="fas fa-arrow-left"></i></a>
                                </span>
                            </div>
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="inputDescription">{$DESCRIPTION}</label>
                                    <textarea class="form-control" name="description" id="inputDescription">{$DESCRIPTION_VALUE}</textarea>
                                </div>
                                <div class="form-group">
                                    <label for="inputKeywords">{$KEYWORDS}</label>
                                    <input type="text" class="form-control" name="keywords" id="inputKeywords" value="{$KEYWORDS_VALUE}" placeholder="{$KEYWORDS}">
                                </div>
                            </div>
                            <div class="card-footer p-0">
                                <input type="submit" class="btn btn-success btn-sm btn-block" value="Save Metadata">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            {include file='footer.tpl'}
        </div>
    </div>
    {include file='scripts.tpl'}
</body>
</html>