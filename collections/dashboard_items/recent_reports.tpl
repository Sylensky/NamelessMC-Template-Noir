<div class="card mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold"><i class="fas fa-exclamation-triangle fa-fw"></i> {$RECENT_REPORTS}</h6>
    </div>
    <div class="card-body">
        {if count($REPORTS)}
        <div id="AReports">
            {assign var=i value=1} {foreach from=$REPORTS item=report}
        <div class="card mb-1 c-pointer " id="HReports{$i}" data-toggle="collapse" data-target="#CReports{$i}" aria-expanded="true" aria-controls="CReports{$i}">
            <div class="card-header ama">
                <div class="mb-0">
                    <span style="{$report.reported_style}"><img class="rounded user-img" src="{$report.reported_avatar}" alt="{$report.reported_username}"> {$report.reported_nickname}</span>
                    <span class="float-right">
                    {if $report.type eq 0}
                        <span class="badge badge-info">{$WEBSITE}</span>
                    {else}
                        <span class="badge badge-info">{$INGAME}</span>
                    {/if}
                    </span>
                </div>
                <div class="collapse" id="CReports{$i}" aria-labelledby="HReports{$i}" data-parent="#AReports">
                    <hr>
                        <b>{$CREATED}</b> <span data-toggle="tooltip" data-title="{$report.time_full}">{$report.time}</span><br>
                        <b>{$REPORTED_BY}</b> <span style="{$report.reporter_style}"><img class="rounded user-img" src="{$report.reporter_avatar}"  alt="{$report.reporter_username}"> {$report.reporter_nickname}</span><br>
                        <b>{$REASON}</b> {$report.reason}
                    <hr>
                    <a class="btn btn-primary btn-block btn-sm" href="{$report.url}">{$VIEW}</a>
                </div>
            </div>
        </div>
            {assign var=i value=($i+1)} {/foreach}
        </div>
        {else}
            <div class="text-info text-center">{$NO_REPORTS}</div>
        {/if}
    </div>
</div>