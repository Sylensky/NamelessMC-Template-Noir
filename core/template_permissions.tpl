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
                                <h4 class="mb-sm-0">{$EDITING_TEMPLATE}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item active">{$LAYOUT}</li>
                                        <li class="breadcrumb-item"><a href="{$BACK_LINK}">{$TEMPLATES}</a></li>
                                        <li class="breadcrumb-item active">{$EDITING_TEMPLATE}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        {include file='includes/update.tpl'}
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <span class="font-size-20">{$EDITING_TEMPLATE}</span>
                            <span class="float-end">
                                <a href="{$BACK_LINK}" class="btn btn-primary btn-sm">{$BACK}</a>
                            </span>
                        </div>
                        <div class="card-body">
                            <form role="form" action="" method="post">
                            <input type="hidden" name="token" value="{$TOKEN}">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <colgroup>
                                            <col span="1" style="width:70%">
                                            <col span="1" style="width:30%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>{$GROUP}</th>
                                                <th><a href="#" onclick="selectAllPerms(); return false;">{$SELECT_ALL}</a> | <a href="#" onclick="deselectAllPerms(); return false;">{$DESELECT_ALL}</a></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>{$GUEST}</td>
                                                <td>
                                                    <div class="d-flex">
                                                        <input type="hidden" name="perm-use-0" value="0" />
                                                        <input class="form-check form-switch" onclick="colourUpdate(this);" type="checkbox" id="Input-use-0" name="perm-use-0" switch="primary" value="1" {if isset($GUEST_PERMISSIONS->can_use_template) && $GUEST_PERMISSIONS->can_use_template eq 1} checked{/if} onchange="this.form.submit()">
                                                        <label class="form-label" for="Input-use-0" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                                    </div>
                                                </td>
                                            </tr>
                                            {foreach from=$GROUP_PERMISSIONS item=group}
                                            <tr>
                                                <td>{$group->name|escape}</td>
                                                <td>
                                                    <div class="d-flex">
                                                        <input type="hidden" name="perm-use-{$group->id|escape}" value="0" />
                                                        <input class="form-check form-switch" onclick="colourUpdate(this);" type="checkbox" id="Input-use-{$group->id|escape}" name="perm-use-{$group->id|escape}" switch="primary" value="1" {if isset($group->can_use_template) && $group->can_use_template eq 1} checked{/if} onchange="this.form.submit()">
                                                        <label class="form-label" for="Input-use-{$group->id|escape}" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                                    </div>
                                                </td>
                                            </tr>
                                            {/foreach}
                                        </tbody>
                                    </table>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            {include file='footer.tpl'}
        </div>
    </div>
    {include file='scripts.tpl'}
    <script type="text/javascript">
        function selectAllPerms() {
            var table = $('table');
            table.find('tbody tr td .form-switch').each(function() {
                $(this).prop('checked', true);
                onChange(this);
            });
            return false;
        }

        function deselectAllPerms() {
            var table = $('table');
            table.find('tbody tr td .form-switch').each(function() {
                $(this).prop('checked', false);
                onChange(this);
            });
            return false;
        }

        function onChange(el) {
            if (typeof Event === 'function' || !document.fireEvent) {
                var event = document.createEvent('HTMLEvents');
                event.initEvent('change', true, true);
                el.dispatchEvent(event);
            } else {
                el.fireEvent('onchange');
            }
        }
    </script>
</body>
</html>