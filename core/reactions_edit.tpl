{include file='header.tpl'}
<body id="page-top">
    <div id="wrapper">
        {include file='sidebar.tpl'}
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                {include file='navbar.tpl'}
                <div class="container-fluid">
                    <div class="row mb-4">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">{$EDITING_REACTION}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                        <li class="breadcrumb-item active">{$CONFIGURATION}</li>
                                        <li class="breadcrumb-item active">{$EDITING_REACTION}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                    {include file='includes/update.tpl'}
                    <form action="" method="post">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <div class="card">
                        <div class="card-header">
                            <span class="font-size-22">{$EDITING_REACTION}</span>
                            <span class="float-end">
                                <a href="#" class="btn btn-danger btn-sm" onclick="showDeleteModal()">{$DELETE}</a>
                            </span>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="InputReactionName">{$NAME}</label>
                                <input type="text" class="form-control" name="name" id="InputReactionName" placeholder="{$NAME}" value="{$NAME_VALUE}">
                            </div>
                            <div class="form-group">
                                <label for="InputReactionHTML">{$HTML}</label>
                                <input type="text" class="form-control" name="html" id="InputReactionHTML" placeholder="{$HTML}" value="{$HTML_VALUE}">
                            </div>
                            <div class="form-group">
                                <label for="InputReactionType">{$TYPE}</label>
                                <select name="type" class="form-control" id="InputReactionType">
                                    <option value="2" {if $TYPE_VALUE eq 2} selected{/if}>{$POSITIVE} </option>
                                    <option value="1" {if $TYPE_VALUE eq 1} selected{/if}>{$NEUTRAL} </option>
                                    <option value="-1" {if $TYPE_VALUE eq 0} selected{/if}>{$NEGATIVE} </option>
                                </select>
                            </div>
                            <div class="d-flex">
                                <input class="form-check form-switch" type="checkbox" id="enabled" name="enabled" switch="success" {if $ENABLED_VALUE eq 1}checked{/if}>
                                <label class="form-label" for="enabled" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                <label for="enabled"> &nbsp;{$ENABLED}</label>
                            </div>
                        </div>
                        <div class="card-footer">
                            <input type="submit" value="Save" class="btn btn-primary">
                            <span class="float-end">
                                <a href="#" class="btn btn-warning btn-sm mr-2" onclick="showCancelModal()">{$CANCEL}</a>
                            </span>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
            {include file='footer.tpl'}
        </div>
        <div class="modal fade" id="cancelModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body text-center text-info">
                        {$CONFIRM_CANCEL}
                    </div>
                    <div class="modal-footer">
                        <a href="{$CANCEL_LINK}" class="btn btn-primary">{$YES}</a>
                        <span class="float-end">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body text-warning text-center">
                        {$CONFIRM_DELETE}
                    </div>
                    <div class="modal-footer">
                        <form action="{$DELETE_LINK}" method="post" style="display: inline">
                            <input type="hidden" name="token" value="{$TOKEN}" />
                            <input type="submit" class="btn btn-primary btn-sm" value="{$YES}" />
                        </form>
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
        function showCancelModal() {
            $('#cancelModal').modal('show');
        }

        function showDeleteModal() {
            $('#deleteModal').modal('show');
        }
    </script>
</body>
</html>