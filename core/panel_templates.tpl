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
                                <h4 class="mb-sm-0">{$PANEL_TEMPLATES}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item active">{$LAYOUT}</li>
                                        <li class="breadcrumb-item active">{$PANEL_TEMPLATES}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        {include file='includes/update.tpl'}
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <a class="btn btn-outline-primary" href="{$INSTALL_TEMPLATE_LINK}">{$INSTALL_TEMPLATE}</a>
                            <a class="btn btn-outline-secondary" href="{$CLEAR_CACHE_LINK}">{$CLEAR_CACHE}</a>
                            <span class="float-end">
                                <a class="btn btn-outline-primary" href="{$VIEW_ALL_PANEL_TEMPLATES_LINK}" target="_blank"><i class="far fa-external-link"></i> {$FIND_TEMPLATES}</a>
                            </span>
                        </div>
                        <div class="col-md-12">
                            {if isset($WEBSITE_TEMPLATES_ERROR)}
                            <div class="alert bg-danger text-white">{$WEBSITE_TEMPLATES_ERROR}</div>
                            {/if}
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                    {foreach from=$TEMPLATE_LIST item=template}
                        <div class="col-sm-12 col-md-6 col-xl-6">
                            <div class="card">
                                <div class="card-body">
                                    {$template.name} - {$template.version}
                                    {if $template.version_mismatch}
                                    <i class="fa fa-exclamation-triangle text-warning" data-bs-toggle="popover" data-title="{$WARNING}" data-content="{$template.version_mismatch}"></i>
                                    {/if}
                                    <span class="float-end">{$template.author_x}</span>
                                </div>
                                <div class="card-footer">
                                    {if $template.enabled}
                                    {if $template.deactivate_link}
                                    <span class="float-end">
                                        <a class="btn btn-warning btn-sm" href="{$template.deactivate_link}">{$DEACTIVATE}</a>
                                    </span>
                                    {else}
                                    <span class="float-end">
                                        <button role="button" class="btn btn-success btn-sm" disabled>{$ACTIVE}</button>
                                    </span>
                                    {/if}
                                    {if $template.default}
                                    <button role="button" class="btn btn-success btn-sm" disabled>{$DEFAULT}</button>
                                    {else}
                                    <a class="btn btn-primary btn-sm" href="{$template.default_link}">{$MAKE_DEFAULT}</a>
                                    {/if}
                                    {else}
                                    <a class="btn btn-primary btn-sm" href="{$template.activate_link}">{$ACTIVATE}</a>
                                    <span class="float-end">
                                        <button role="button" onclick="showDeleteModal('{$template.delete_link}')" class="btn btn-danger btn-sm"><i class="far fa-trash"></i></button>
                                    </span>
                                    {/if}
                                </div>
                            </div>
                        </div>
                        {/foreach}
                    </div>
                </div>
            </div>
            {include file='footer.tpl'}
        </div>
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">{$ARE_YOU_SURE}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        {$CONFIRM_DELETE_TEMPLATE}
                    </div>
                    <div class="modal-footer">
                        <a href="#" id="deleteLink" class="btn btn-primary btn-sm">{$YES}</a>
                        <span class="float-end">
                            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">{$NO}</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {include file='scripts.tpl'}
    <script type="text/javascript">
        function showDeleteModal(id) {
            $('#deleteLink').attr('href', id);
            $('#deleteModal').modal('show');
        }

        var $star_rating = $('.star-rating.view .fa-star');

        var SetRatingStar = function(type = 0) {
            if (type === 0) {
                return $star_rating.each(function() {
                    if (parseInt($(this).parent().children('input.rating-value').val()) >= parseInt($(this).data('rating'))) {
                        return $(this).removeClass('far').addClass('fas');
                    } else {
                        return $(this).removeClass('fas').addClass('far');
                    }
                });
            }
        };

        SetRatingStar();
    </script>
</body>
</html>