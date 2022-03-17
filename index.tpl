{include file='header.tpl'}
<body id="page-top">
    <div id="wrapper">
    {include file='sidebar.tpl'}
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                {include file='navbar.tpl'}
                <div class="container-fluid">
                    {include file='includes/update.tpl'}
                    {if isset($DIRECTORY_WARNING)}
                    <div class="alert alert-warning">
                        {$DIRECTORY_WARNING}
                    </div>
                    {/if}
                    {if count($DASHBOARD_STATS)} {assign var="i" value=0}
                    <div class="row">
                        {foreach from=$DASHBOARD_STATS item=stat} {if $i % 4 eq 0}
                    </div>
                    <div class="row">
                        {/if} {$stat->getContent()} {assign var="i" value=$i+1} {/foreach}
                    </div>
                    {/if}
                    <div class="row">
                        <div class="col-md-9">
                        {if count($GRAPHS)}
                            <div class="card">
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold"><i class="far fa-chart-bar"></i> {$STATISTICS}</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i></a>
                                        <div class="dropdown-menu dropdown-menu-right animated--fade-in" aria-labelledby="dropdownMenuLink">
                                            {assign var="i" value=0} {foreach from=$GRAPHS key=key item=graph}
                                            <a class="dropdown-item" href="#" onclick="drawChart({$i})">{$key}</a> {assign var="i" value=$i+1} {/foreach}
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div id="chart"></div>
                                </div>
                            </div>
                        {/if}<br>
                        {if count($MAIN_ITEMS)} {assign var="i" value=0} {assign var="counter" value=0}
                            <div class="row justify-content-md-center">
                                {foreach from=$MAIN_ITEMS item=item} {assign var="width" value=(12*$item->getWidth())|round:1} {assign var="counter" value=($counter+$width)} {if $counter > 12} {assign var="counter" value=0}
                            </div><br />
                            <div class="row justify-content-md-center">
                                {/if}
                                <div class="col-md-{$width}">{$item->getContent()}</div>
                                {assign var="i" value=$i+1} {/foreach}
                            </div>
                        {/if}
                        </div>
                        <div class="col-md-3">
                            <div class="card mb-4">
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold"><i class="far fa-newspaper"></i> {$NAMELESS_NEWS}</h6>
                                </div>
                                <div class="card-body">
                                    {if isset($NO_NEWS)}
                                    <div class="alert alert-warning">{$NO_NEWS}</div>
                                    {else} {foreach from=$NEWS item=item name=newsarray}
                                    <a href="#" onclick="confirmLeaveSite('{$item.url}')">{$item.title}</a>
                                    <br /><small>{$item.author} | <span data-bs-toggle="tooltip" title="{$item.date}">{$item.date_friendly}</span></small> {if not $smarty.foreach.newsarray.last}
                                    <hr />{/if} {/foreach} {/if}
                                </div>
                            </div>
                            {if isset($SERVER_COMPATIBILITY)}
                            <div class="card mb-4">
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold"><i class="fas fa-wrench"></i> {$SERVER_COMPATIBILITY}</h6>
                                </div>
                                <div class="card-body">
                                    {$NAMELESS_VERSION}
                                    <hr> {foreach from=$COMPAT_SUCCESS item=item}<i class="fas fa-check-circle text-success"></i> {$item}<br> {/foreach} {if count($COMPAT_ERRORS)}
                                    <hr> {foreach from=$COMPAT_ERRORS item=item}<i class="fas fa-times-circle text-danger"></i> {$item}<br> {/foreach} {/if}
                                </div>
                            </div>
                            {/if}
                        </div>
                    </div>
                    <div style="height:1rem;"></div>
                </div>
            </div>
            {include file='footer.tpl'}
        </div>
        <div class="modal fade" id="confirmLeaveSiteModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        {$CONFIRM_LEAVE_SITE}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                        <a href="#" id="leaveSiteA" class="btn btn-primary" target="_blank">{$YES}</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {include file='scripts.tpl'}
    {if count($GRAPHS)}
    <script type="text/javascript">
        var options = {
            {foreach from=$GRAPHS item=graph}
            series: [
                {foreach from=$graph.datasets item=dataset}
                {
                    name: "{$dataset.label}",
                    data: [{foreach from=$dataset.data item=data name=ds} {$data}{if not $smarty.foreach.ds.last}, {/if}{/foreach}]
                },
                {/foreach}
            ],
            chart: {
                height: 500,
                type: 'line',
                zoom: {
                    enabled: false
                },
            },
            dataLabels: {
                enabled: false
            },
            stroke: {
                width: [5, 5, 5],
                curve: 'straight',
                dashArray: [0, 0, 0]
            },
            legend: {
                tooltipHoverFormatter: function(val, opts) {
                    return val + ' - ' + opts.w.globals.series[opts.seriesIndex][opts.dataPointIndex] + ''
                },
                position: 'top',
                labels: {
                    colors: '#919bae',
                    useSeriesColors: false
                },
            },
            markers: {
                size: 0,
                hover: {
                    sizeOffset: 6
                }
            },
            xaxis: {
                categories: [{foreach from=$graph.keys key=key item=item}'{$item}',{/foreach}],
                labels: {
                    show: true,
                    style: {
                        colors: [{foreach from=$graph.keys key=key item=item}'#919bae',{/foreach}]
                    },
                },
                tooltip: {
                    enabled: true
                },
            },
            yaxis: {
                labels: {
                    show: true,
                    style: {
                        colors: [{foreach from=$graph.keys key=key item=item}'#919bae',{/foreach}]
                    },
                },

            },
            tooltip: {
                y: [{
                        title: {
                            formatter: function(val) {
                                return val;
                            }
                        }
                    },
                    {
                        title: {
                            formatter: function(val) {
                                return val;
                            }
                        }
                    },
                    {
                        title: {
                            formatter: function(val) {
                                return val;
                            }
                        }
                    }
                ],
            },
            grid: {
                borderColor: '#919bae'
            }
            {/foreach}
        };
        var chart = new ApexCharts(document.querySelector("#chart"), options);
        chart.render();
    </script>
    {/if}
    <script type="text/javascript">
        function confirmLeaveSite(url) {
            $('#leaveSiteURL').html(url);
            $('#leaveSiteA').attr('href', url);
            $('#confirmLeaveSiteModal').modal().show();
        }
    </script>
</body>
</html>