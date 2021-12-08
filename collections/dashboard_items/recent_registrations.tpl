<div class="card mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold"><i class="fas fa-user fa-fw"></i> {$RECENT_REGISTRATIONS}</h6>
    </div>
    <div class="card-body">
        {if count($REGISTRATIONS)}
        <div id="ARegistration">
            {assign var=i value=1} {foreach from=$REGISTRATIONS item=registration}
            <div class="card mb-1 c-pointer" id="HRegistration{$i}" data-toggle="collapse" data-target="#CRegistration{$i}" aria-expanded="true" aria-controls="CRegistration{$i}">
                <div class="card-header ama">
                    <div class="mb-0">
                        <span style="{$registration.style}"><img src="{$registration.avatar}" class="rounded user-img" alt="{$registration.username}"> {$registration.nickname}</span>
                        <span class="float-right">{$registration.groups[0]}</span>
                    </div>
                    <div class="collapse" id="CRegistration{$i}" aria-labelledby="HRegistration{$i}" data-parent="#ARegistration">
                        <hr>
                        <b>{$REGISTERED}</b> <span data-toggle="tooltip" data-title="{$registration.time_full}">{$registration.time}</span><br>
                        <hr>
                        <a class="btn btn-primary btn-block btn-sm" href="{$registration.url}">{$VIEW}</a>
                    </div>
                </div>
            </div>
            {assign var=i value=($i+1)} {/foreach}
        </div>
        {/if}
    </div>
</div>