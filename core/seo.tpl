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
                            <h4 class="mb-sm-0">{$SEO}</h4>
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                    <li class="breadcrumb-item">{$CONFIGURATION}</li>
                                    <li class="breadcrumb-item">{$SEO}</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    {include file='includes/update.tpl'}
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        {$GOOGLE_ANALYTICS}
                                    </div>
                                    <div class="card-body">
                                        <div class="card-text mb-4 text-info font-italic">{$GOOGLE_ANALYTICS_HELP}</div>
                                        <form action="" method="post">
                                            <input type="hidden" name="token" value="{$TOKEN}">
                                            <input type="hidden" name="type" value="google_analytics">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <label for="InputAPIKey">{$API_KEY}</label>
                                                    <input type="text" class="form-control" name="analyticsid" id="inputAnalyticsId" placeholder="Google Analytics ID" value="{$GOOGLE_ANALYTICS_VALUE}" onchange="this.form.submit()">
                                                    <div class="input-group-append">
                                                        <a href="https://support.google.com/analytics/answer/1008080?hl=en#zippy=%2Cin-this-article" target="_blank" class="btn btn-primary text-white" data-toggle="tooltip" title="Set up the Analytics global site tag"><i class="far fa-info-square"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        {$SITEMAP}
                                    </div>
                                    <div class="card-body">
                                    {if isset($SITEMAP_LAST_GENERATED)}
                                        <p class="text-info">{$SITEMAP_LAST_GENERATED}</p>
                                        <p><b>{$LINK}</b><br /><code>{$SITEMAP_FULL_LINK}</code></p>
                                        <form action="" method="post">
                                            <input type="hidden" name="token" value="{$TOKEN}">
                                            <input type="hidden" name="type" value="sitemap">
                                            <input type="submit" class="btn btn-primary btn-sm" value="{$GENERATE}">
                                            <a href="{$SITEMAP_LINK}" class="btn btn-primary btn-sm" download>{$DOWNLOAD_SITEMAP}</a>
                                        </form>
                                    {else}
                                        <p>{$SITEMAP_NOT_GENERATED}</p>
                                        <form action="" method="post">
                                            <input type="hidden" name="token" value="{$TOKEN}">
                                            <input type="hidden" name="type" value="sitemap">
                                            <input type="submit" class="btn btn-primary btn-sm" value="{$GENERATE}">
                                        </form>
                                    {/if}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">{$PAGE_METADATA}</div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="SEO" class="table table-bordered table-striped dataTables-pages">
                                                <thead>
                                                <tr>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                {foreach from=$PAGE_LIST key=key item=item}
                                                    <tr>
                                                        <td><a href="{$EDIT_LINK|replace:'{x}':$item.id}">{$key|escape}</a></td>
                                                        <td class="text-right">
                                                            <a href="{$EDIT_LINK|replace:'{x}':$item.id}" class="btn btn-outline-success btn-ssm" data-toggle="tooltip" title="Edit"><i class="far fa-pen"></i></a>
                                                        </td>
                                                    </tr>
                                                {/foreach}
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
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