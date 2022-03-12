{include file='header.tpl'}
<body id="page-top">
<div id="wrapper">
    {include file='sidebar.tpl'}
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            {include file='navbar.tpl'}
            <div class="container-fluid">
                {include file='includes/update.tpl'}
                <div class="row mb-4">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0">{$REACTIONS}</h4>
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                    <li class="breadcrumb-item active">{$CONFIGURATION}</li>
                                    <li class="breadcrumb-item active">{$REACTIONS}</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                {include file='includes/update.tpl'}
                <div class="card">
                    <div class="card-header">
                        <span class="font-size-22">{$REACTIONS}</span>
                        <span class="float-right">
                            <a href="{$NEW_REACTION_LINK}" class="btn btn-primary btn-sm">{$NEW_REACTION}</a>
                        </span>
                    </div>
                    <div class="card-body">
                        
                        <hr />
                        {if count($REACTIONS_LIST)}
                            <div class="table-responsive">
                                <table class="table table-borderless table-striped">
                                    <thead>
                                    <tr>
                                        <td>{$NAME}</td>
                                        <td>{$ICON}</td>
                                        <td>{$TYPE}</td>
                                        <td>{$ENABLED}</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {foreach from=$REACTIONS_LIST item=reaction}
                                        <tr>
                                            <td><a href="{$reaction.edit_link}">{$reaction.name}</a></td>
                                            <td>{$reaction.html}</td>
                                            <td>{$reaction.type}</td>
                                            <td>{if $reaction.enabled eq 1}
                                                    <i class="fa fa-check-circle fa-fw text-success"></i>
                                                {else}
                                                    <i class="fa fa-times-circle fa-fw text-danger"></i>
                                                {/if}
                                            </td>
                                        </tr>
                                    {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        {else}
                            {$NO_REACTIONS}
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