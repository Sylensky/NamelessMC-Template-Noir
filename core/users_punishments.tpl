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
                                <h4 class="mb-sm-0">{$PUNISHMENTS}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item active">{$USER_MANAGEMENT}</li>
                                        <li class="breadcrumb-item active">{$PUNISHMENTS}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                    {include file='includes/update.tpl'}
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    {$SEARCH}
                                </div>
                                <div class="card-body">
                                    <form action="" method="post">
                                        <input type="hidden" name="token" value="{$TOKEN}">
                                        <div class="form-group">
                                            <input type="text" placeholder="{$SEARCH}" class="form-control text-center" name="username" onchange="this.form.submit()">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    {if isset($RESULTS)}
                    <div class="row" id="APunishment">
                        {assign var=i value=1}
                        {foreach from=$RESULTS item=result}
                        <div class="col-md-6">
                            <div class="card mb-1">
                                <a href="#collapse{$i}" data-bs-toggle="collapse" aria-expanded="true" aria-controls="collapse{$i}">
                                    <div class="card-header" id="headingOne">
                                        <h6 class="m-0">
                                            <span style="{$result.style}"><img src="{$result.avatar}" class="rounded user-img" alt="{$result.nickname}"> {$result.nickname}</span>
                                            <span> - <span data-bs-toggle="tooltip" data-title="{$result.time_full}">{$result.time}</span></span>
                                            <span class="float-end">
                                                {if $result.type_numeric == 1}
                                                <span class="badge badge-danger">{$result.type}</span>
                                                {elseif $result.type_numeric == 2}
                                                <span class="badge badge-warning">{$result.type}</span>
                                                {elseif $result.type_numeric == 3}
                                                <span class="badge badge-danger">{$result.type}</span>
                                                {/if}
                                                {if $result.revoked == 1}
                                                <span class="badge badge-success">{$REVOKED}</span>
                                                {/if}
                                            </span>
                                        </h6>
                                    </div>
                                </a>
                                <div id="collapse{$i}" class="collapse" aria-labelledby="heading{$i}" data-bs-parent="#APunishment">
                                    <div class="card-body">
                                        <b>{$STAFF}:</b> <span style="{$result.staff_style}"><img src="{$result.staff_avatar}" class="rounded user-img" alt="{$result.staff_nickname}"> {$result.staff_nickname}</span><br>
                                        <hr>
                                        <a class="btn btn-primary btn-block btn-sm" href="{$result.link}">{$VIEW_USER}</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {assign var=i value=($i+1)}
                        {/foreach}
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-12 text-center">{$PAGINATION}</div>
                    </div>
                    {else}
                    <div class="row">
                        <div class="col-md-12 text-center text-warning">
                            {$NO_PUNISHMENTS}
                        </div>
                    </div>
                    {/if}
                </div>
            </div>
            {include file='footer.tpl'}
        </div>
    </div>
    {include file='scripts.tpl'}
    <script type="text/javascript">
        function showSearchModal() {
            $('#searchModal').modal('show');
        }
    </script>
</body>
</html>