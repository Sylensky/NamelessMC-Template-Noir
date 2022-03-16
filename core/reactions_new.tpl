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
                                <h4 class="mb-sm-0">{$CREATING_REACTION}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                        <li class="breadcrumb-item active">{$CONFIGURATION}</li>
                                        <li class="breadcrumb-item active">{$CREATING_REACTION}</li>
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
                            <span class="font-size-22">{$CREATING_REACTION}</span>
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
                                    <option value="2">{$POSITIVE}</option>
                                    <option value="1">{$NEUTRAL}</option>
                                    <option value="-1">{$NEGATIVE}</option>
                                </select>
                            </div>
                            <div class="d-flex">
                                <input class="form-check form-switch" type="checkbox" id="enabled" name="enabled" switch="success">
                                <label class="form-label" for="enabled" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                <label for="enabled"> &nbsp;{$ENABLED}</label>
                            </div>
                        </div>
                        <div class="card-footer">
                            <input type="submit" value="Save" class="btn btn-primary btn-s">
                            <span class="float-end">
                                <a href="#" class="btn btn-warning btn-sm" onclick="showCancelModal()">{$CANCEL}</a>
                            </span>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
            {include file='footer.tpl'}
        </div>
        <!-- Cancel modal -->
        <div class="modal fade" id="cancelModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body text-center">
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
    </div>
    {include file='scripts.tpl'}
    <script type="text/javascript">
        function showCancelModal() {
            $('#cancelModal').modal().show();
        }
    </script>
</body>
</html>