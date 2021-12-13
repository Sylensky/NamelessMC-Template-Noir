{foreach from=$TEMPLATE_JS item=script}
    {$script}
{/foreach}
<script>
    {if isset($SUCCESS)}
        Command: toastr["success"]("{$SUCCESS}")
    {/if}
</script>
<script>
{if isset($ERRORS) && count($ERRORS)}
    {foreach from=$ERRORS item=error}
        Command: toastr["error"]("{$error}")
    {/foreach}
{/if}
</script>
{if isset($NEW_UPDATE)}
    {if $NEW_UPDATE_URGENT ne true}
        <script type="text/javascript">
            $(document).ready(function() {
                $('#closeUpdate').click(function(event) {
                    event.preventDefault();

                    let expiry = new Date();
                    let length = 3600000;
                    expiry.setTime(expiry.getTime() + length);

                    $.cookie('update-alert-closed', 'true', { path: '/', expires: expiry });
                });

                if ($.cookie('update-alert-closed') === 'true') {
                    $('#updateAlert').hide();
                }
            });
        </script>
    {/if}
{/if}