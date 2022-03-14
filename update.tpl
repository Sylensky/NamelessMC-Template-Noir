{if isset($NEW_UPDATE)}
    <div class="col-md-12">
        {if $NEW_UPDATE_URGENT eq true}
        <div class="alert bg-danger">
            {else}
            <div class="alert bg-primary alert-dismissible" id="updateAlert">
                <button type="button" class="close" id="closeUpdate" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                {/if}
                {$NEW_UPDATE}<br />
                <a href="{$UPDATE_LINK}" class="btn btn-info" style="text-decoration:none">{$UPDATE}</a>
                <hr style="border-color: rgba(0,0,0,.1)" /> {$CURRENT_VERSION}
                <br />{$NEW_VERSION}
            </div>
        </div>
    </div>
    {/if}