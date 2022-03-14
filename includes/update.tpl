{if isset($NEW_UPDATE)}
<div class="col-md-12">
    {if $NEW_UPDATE_URGENT eq true}
    <div class="alert alert-danger text-center">
        {$NEW_UPDATE} <br>
        <span class="text-warning">{$CURRENT_VERSION}</span> | <span class="text-success">{$NEW_VERSION}</span><br>
        <a href="{$UPDATE_LINK}" class="btn btn-info">{$UPDATE}</a>
    </div>
    {else}
    <div class="alert alert-warning text-center">
        {$NEW_UPDATE} <br>
        <span class="text-warning">{$CURRENT_VERSION}</span> | <span class="text-success">{$NEW_VERSION}</span><br>
        <a href="{$UPDATE_LINK}" class="btn btn-info">{$UPDATE}</a>
    </div>
    {/if}
</div>
{/if}
