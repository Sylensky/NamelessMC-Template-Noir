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
                                <h4 class="mb-sm-0">{$API_ENDPOINTS}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                        <li class="breadcrumb-item active">{$CONFIGURATION}</li>
                                        <li class="breadcrumb-item active">{$API_ENDPOINTS}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        {include file='includes/update.tpl'}
                    </div>
                    <div class="card mb-4">
                        <div class="card-header">
                            {$ENDPOINTS_INFO}
                            <span class="float-right">
                                <a href="{$BACK_LINK}" data-toggle="tooltip" data-placement="top" title="{$BACK}"><i class="fas fa-arrow-left"></i></a>
                            </span>
                        </div>
                        <div class="card-body">
                            {if count($ENDPOINTS_ARRAY)}
                                <div class="table-responsive">
                                    <table class="table table-borderless table-striped">
                                        <thead>
                                            <th>{$ROUTE}</th>
                                            <th>{$DESCRIPTION}</th>
                                            <th>{$MODULE}</th>
                                            <th>Method</th>
                                        </thead>
                                        <tbody>
                                        {foreach from=$ENDPOINTS_ARRAY item=endpoint}
                                            <tr>
                                                <td>
                                                    <div><code>/{$endpoint.route}</code></div>
                                                </td>
                                                <td>
                                                    <div>{$endpoint.description}</div>
                                                </td>
                                                <td>
                                                    <div class="badge badge-info">{$endpoint.module}</div>
                                                </td>
                                                <td>
                                                    <div><kbd>{$endpoint.method}</kbd></div>
                                                </td>
                                            </tr>
                                        {/foreach}
                                        </tbody>
                                    </table>
                                </div>
                            {/if}
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