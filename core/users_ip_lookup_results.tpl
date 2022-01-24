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
                        {$COUNT_ACCOUNTS}
                        <span class="float-right">
                            <a class="btn btn-outline-warning btn-ssm" href="{$BACK_LINK}">{$BACK}</a>
                         </span>
                    </div>
                    <div class="card-body">
                        <ul>
                            {if isset($IP_SEARCH)}
                                {foreach from=$ACCOUNTS item=account}
                                    <li><a href="{$account.account_ips}" style="{$account.style}">{$account.username}</a></li>
                                {/foreach}
                            {else}
                                {foreach from=$ACCOUNTS item=account}
                                    <li><a href="{$account.link}">{$account.ip}</a></li>
                                {/foreach}
                            {/if}
                        </ul>

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