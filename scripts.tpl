{foreach from=$TEMPLATE_JS item=script}
    {$script}
{/foreach}
{if isset($SUCCESS)}
<script>
    Command: toastr["success"]("{$SUCCESS}")
</script>
{/if}
{if isset($ERRORS) && count($ERRORS)}
<script>
    {foreach from=$ERRORS item=error}
        Command: toastr["error"]("{$error}")
    {/foreach}
</script>
{/if}