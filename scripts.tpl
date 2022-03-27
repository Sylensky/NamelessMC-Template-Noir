<script type="text/javascript" src="{$ASSETSPATH}/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="{$ASSETSPATH}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="{$ASSETSPATH}/js/app.js"></script>
<script type="text/javascript" src="{$ASSETSPATH}/js/jquery.cookie.js"></script>
<script type="text/javascript" src="{$ASSETSPATH}/plugins/toastr/toastr.min.js"></script>
<script type="text/javascript" src="{$ASSETSPATH}/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>
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