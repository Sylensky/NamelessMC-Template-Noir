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
                            <h4 class="mb-sm-0">Group Sync</h4>
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                    <li class="breadcrumb-item active">{$CONFIGURATION}</li>
                                    <li class="breadcrumb-item active">Group Sync</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    {include file='includes/update.tpl'}
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <form action="" method="post">
                            <div class="card">
                                <div class="card-header">
                                    {$NEW_RULE}
                                    <span class="float-end">
                                        <a href="{$BACK_LINK}" data-bs-toggle="tooltip" data-placement="top" title="{$BACK}"><i class="fas fa-arrow-left"></i></a>
                                    </span>
                                </div>
                                <div class="card-body border-left-primary">
                                    {$GROUP_SYNC_INFO}
                                </div>
                                <div class="card-body">
                                    <input type="hidden" name="token" value="{$TOKEN}">
                                    <input type="hidden" name="action" value="create">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label for="inputIngame">{$INGAME_GROUP_NAME}</label>
                                                {if count($INGAME_GROUPS)}
                                                    <select name="ingame_rank_name" class="form-select" id="inputIngame">
                                                        <option value="0">{$NONE} ({$DISABLED})</option>
                                                        {foreach from=$INGAME_GROUPS item=group}
                                                            <option value="{$group}">{$group}</option>
                                                        {/foreach}
                                                    </select>
                                                {else}
                                                    <p class="text-muted" style="padding-top: 5px">{$GROUP_SYNC_PLUGIN_NOT_SET_UP}</p>
                                                    <input name="ingame_rank_name" type="hidden" id="inputIngame">
                                                {/if}
                                            </div>
                                            <div class="col-md-4">
                                                <label for="inputDiscord">{$DISCORD_ROLE_ID}</label>
                                                {if count($DISCORD_GROUPS)}
                                                    <select name="discord_role_id" class="form-select" id="inputDiscord">
                                                        <option value="0">{$NONE} ({$DISABLED})</option>
                                                        {foreach from=$DISCORD_GROUPS item=group}
                                                            <option value="{$group.id}">{$group.name} ({$group.id})</option>
                                                        {/foreach}
                                                    </select>
                                                {else}
                                                    <p class="text-muted" style="padding-top: 5px">{$DISCORD_INTEGRATION_NOT_SETUP}</p>
                                                    <input class="form-control" name="discord_role_id" type="hidden" id="inputDiscord" value="0">
                                                {/if}
                                            </div>
                                            <div class="col-md-3">
                                                <label for="inputWebsite">{$WEBSITE_GROUP}</label>
                                                <select name="website_group" class="form-select" id="inputWebsite">
                                                    {foreach from=$GROUPS item=group}
                                                        <option value="{$group.id}">{$group.name}</option>
                                                    {/foreach}
                                                </select>
                                            </div>
                                            <div class="col-md-1">
                                                <div style="height:32px"></div>
                                                <input type="submit" class="btn btn-outline-success" value="{$SUBMIT}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                {if count($GROUP_SYNC_VALUES)}
                <div class="row mt-3">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                {$EXISTING_RULES}
                                <span class="float-end">
                                    <a class="btn btn-outline-primary btn-ssm" href="{$BACK_LINK}">{$BACK}</a>
                                </span>
                            </div>
                        </div>
                    </div>
                    {foreach from=$GROUP_SYNC_VALUES item=group_sync}
                    <form class="col-md-4" action="" method="post">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <input type="hidden" name="action" value="update">
                        <div class="GBox">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <label for="inputIngame">{$INGAME_GROUP_NAME}</label>
                                    {if count($INGAME_GROUPS)}
                                        <select name="ingame_group[{$group_sync.id}]" class="form-select" id="inputIngame" onchange="this.form.submit()">
                                            <option value="0" {if {$group_sync.ingame} == NULL} selected{/if}>{$NONE} ({$DISABLED})</option>
                                            {foreach from=$INGAME_GROUPS item=group}
                                                <option value="{$group}" {if {$group_sync.ingame} eq $group} selected{/if}>{$group}</option>
                                            {/foreach}
                                        </select>
                                    {else}
                                        <p class="text-muted" style="padding-top: 5px">{$GROUP_SYNC_PLUGIN_NOT_SET_UP}</p>
                                        <input name="ingame_group[{$group_sync.id}]" type="hidden" id="inputIngame" value="{$group_sync.ingame}">
                                    {/if}
                                </div>
                                <div class="col-md-12">
                                    <label for="inputDiscord"">{$DISCORD_ROLE_ID}</label>
                                    {if count($DISCORD_GROUPS)}
                                        <select name="discord_role[{$group_sync.id}]" class="form-select" id="inputDiscord" onchange="this.form.submit()">
                                            <option value="0" {if {$group_sync.discord} == NULL} selected{/if}>{$NONE} ({$DISABLED})</option>
                                            {foreach from=$DISCORD_GROUPS item=group}
                                                <option value="{$group.id}" {if {$group_sync.discord} eq $group.id} selected{/if}>{$group.name}
                                                    ({$group.id})
                                                </option>
                                            {/foreach}
                                        </select>
                                    {else}
                                        <p class="text-muted" style="padding-top: 5px">{$DISCORD_INTEGRATION_NOT_SETUP}</p>
                                        <input name="discord_role[{$group_sync.id}]" type="hidden" id="inputDiscord" value="0">
                                    {/if}
                                </div>
                                <div class="col-md-12">
                                    <label for="inputWebsite">{$WEBSITE_GROUP}</label>
                                    <select name="website_group[{$group_sync.id}]" class="form-select" id="inputWebsite" onchange="this.form.submit()">
                                        {foreach from=$GROUPS item=group}
                                            <option value="{$group.id}"{if $group_sync.website eq $group.id} selected{/if}>{$group.name}</option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="col-md-12">
                                    <button type="button" onclick="deleteGroupSync('{$group_sync.id}')" class="btn btn-outline-danger btn-sm btn-block">{$DELETE}</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    {/foreach}
                </div>
                {else}
                    <div class="col-md-12 text-center">
                    <hr>
                        <div class="text-info">No existing rules found</div>
                    </div>
                {/if}
            </div>
        </div>
        {include file='footer.tpl'}
    </div>
</div>
{include file='scripts.tpl'}
<script type="text/javascript">
    function deleteGroupSync(id) {
      const response = $.post("{$DELETE_LINK}", { id, action: 'delete', token: "{$TOKEN}" });
      response.done(function() { window.location.replace("{$DELETE_LINK}"); })
    }
</script>
</body>
</html>