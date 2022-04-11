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
                                <h4 class="mb-sm-0">Editing Group Permissions</h4>
                                <div class="page-title-right">
                                    <a class="btn btn-outline-info btn-sm" href="{$BACK_LINK}" data-bs-toggle="tooltip" data-placement="top" title="{$L_BACK}"><i class="fad fa-arrow-left"></i> {$L_BACK}</a>
                                    <button class="btn btn-outline-success btn-sm" type="button" onclick="document.getElementById('SavePermission').submit();" data-bs-toggle="tooltip" data-placement="top" title="{$L_SAVE}"><i class="fad fa-save"></i> {$L_SAVE}</button>
                                </div>
                            </div>
                        </div>
                        {include file='includes/update.tpl'}
                    </div>
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <div class="input-group">
                                <input class="form-control text-center" type="text" id="X_Search" onkeyup="XSearch()" placeholder="Search Permissions">
                            </div>
                            <hr>
                        </div>
                        <form class="d-contents" id="SavePermission" action="" method="post">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        {foreach from=$ALL_PERMISSIONS key=key item=item}
                            <div class="col-sm-12 col-md-12 col-xl-12">
                                <div class="card" id="{$key|escape}">
                                    <div class="card-header">
                                        <span class="font-size-22"> {$key|escape}</span>
                                        <span class="float-end">
                                            <a href="#" class="btn btn-outline-success btn-sm" onclick="selectAllPerms('{$key|escape}'); return false;" data-bs-toggle="tooltip" data-placement="top" title="{$SELECT_ALL}"><i class="far fa-check-square"></i> {$SELECT_ALL}</a>
                                            <a href="#" class="btn btn-outline-danger btn-sm" onclick="deselectAllPerms('{$key|escape}'); return false;" data-bs-toggle="tooltip" data-placement="top" title="{$DESELECT_ALL}"><i class="far fa-times-square"></i> {$DESELECT_ALL}</a>
                                        </span>
                                    </div>
                                    <div class="card-body">
                                    {foreach from=$item key=permission item=title}
                                        <div class="HI">
                                            <label class="ms-2 card-header p-1 mb-1 d-block c-pointer" for="InputP[{$permission|escape}]">
                                                <label class="m-0 c-pointer PName" for="InputP[{$permission|escape}]"><i class="fas fa-file text-info" data-bs-toggle="tooltip" title="" data-bs-original-title="Allow Group to access <span class='text-warning'>{$title}</span>"></i> {$title}</label>
                                                <span class="float-end">
                                                    <div class="d-flex">
                                                        <input class="form-check form-switch" type="checkbox" name="permissions[{$permission|escape}]" id="InputP[{$permission|escape}]" switch="success" value="1" {if is_array($PERMISSIONS_VALUES) && array_key_exists($permission|escape, $PERMISSIONS_VALUES)} checked{/if}>
                                                        <label class="form-label" for="InputP[{$permission|escape}]" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                                    </div>
                                                </span>
                                            </label>
                                        </div>
                                    {/foreach}
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                        </form>
                    </div>
                </div>
            </div>
            {include file='footer.tpl'}
        </div>
    </div>
    {include file='scripts.tpl'}
    <script type="text/javascript">
        function selectAllPerms(section) {
            var card = $('.card#' + section);
            card.find('.form-switch').each(function() {
                $(this).prop('checked', true);
                onChange(this);
            });
            return false;
        }

        function deselectAllPerms(section) {
            var card = $('.card#' + section);
            card.find('.form-switch').each(function() {
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

        function XSearch() {
            let input = document.getElementById('X_Search').value
            input=input.toLowerCase();
            let x = document.getElementsByClassName('PName');
            let A = document.getElementsByClassName('HI');
            for (i = 0; i < x.length; i++) {
                if (!x[i].innerHTML.toLowerCase().includes(input)) {
                    A[i].style.display="none";
                }
                else {
                    A[i].style.display="";
                }
            }
        }
    </script>
</body>
</html>