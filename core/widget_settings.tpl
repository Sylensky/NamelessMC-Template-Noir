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
                            <h4 class="mb-sm-0">{$EDITING_WIDGET}</h4>
                            <div class="page-title-right">
                                {if isset($SETTINGS)}
                                <a href="{$SETTINGS_LINK}" class="btn btn-outline-success">{$SETTINGS}</a>
                                {/if}
                                <a href="{$BACK_LINK}" class="btn btn-outline-primary">{$BACK}</a>
                            </div>
                        </div>
                    </div>
                    {include file='includes/update.tpl'}
                </div>
                <div class="row">
                    {if isset($SETTINGS_TEMPLATE)}
                        {include file=$SETTINGS_TEMPLATE}
                    {/if}
                </div>
            </div>
        </div>
        {include file='footer.tpl'}
    </div>
</div>
lude file='scripts.tpl'}
</body>
</html>