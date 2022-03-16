<div class="card mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold"><i class="fas fa-gavel fa-fw"></i> {$RECENT_PUNISHMENTS}</h6>
    </div>
    <div class="card-body">
        {if count($PUNISHMENTS)}
        <div id="APunishment">
            {assign var=i value=1} {foreach from=$PUNISHMENTS item=punishment}
            <div class="card mb-1 c-pointer" id="HPunishment{$i}}" data-toggle="collapse" data-target="#CPunishment{$i}" aria-expanded="true" aria-controls="CPunishment{$i}">
                <div class="card-header ama">
                    <div class="mb-0">
                            <span style="{$punishment.punished_style}"><img src="{$punishment.punished_avatar}" class="rounded user-img" alt="{$punishment.punished_username}"> {$punishment.punished_nickname}</span>
                            <span class="float-end">
                                {if $punishment.type eq 1}
                                    <span class="badge badge-danger">{$BAN}</span>
                                {elseif $punishment.type eq 2}
                                    <span class="badge badge-warning">{$WARNING}</span>
                                {elseif $punishment.type eq 3}
                                    <span class="badge badge-danger">{$IP_BAN}</span>
                                {/if}
                                {if $punishment.revoked eq 1}
                                    <span class="badge badge-success">{$REVOKED}</span>
                                {/if}
                            </span>
                    </div>
                    <div class="collapse" id="CPunishment{$i}" aria-labelledby="HPunishment{$i}" data-parent="#APunishment">
                        <hr>
                        <b>{$CREATED}</b> <span data-toggle="tooltip" data-title="{$punishment.time_full}">{$punishment.time}</span><br>
                        <b>{$STAFF}</b> <span style="{$punishment.staff_style}"><img src="{$punishment.staff_avatar}" class="rounded user-img" alt="{$punishment.staff_username}"> {$punishment.staff_nickname}</span><br>
                        <b>{$REASON}</b> {$punishment.reason}<br>
                        <hr>
                        <a class="btn btn-primary btn-block btn-sm" href="{$punishment.url}">{$VIEW}</a>
                    </div>
                </div>
            </div>
            {assign var=i value=($i+1)} {/foreach}
        </div>
        {else}
            <div class="text-info text-center">{$NO_PUNISHMENTS}</div>
        {/if}
    </div>
</div>