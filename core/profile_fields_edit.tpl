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
                            <h4 class="mb-sm-0">{$EDITING_PROFILE_FIELD}</h4>
                        </div>
                    </div>
                </div>
                {include file='includes/update.tpl'}
                <div class="row">
                <form class="d-contents" action="" method="post">
                <input type="hidden" name="token" value="{$TOKEN}">
                <input type="hidden" name="action" value="update">
                        <div class="col-md-8">
                            <div class="card">
                                <div class="card-header">
                                    {$L_FIELD_INFORMATION}
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="inputFieldName">{$FIELD_NAME}</label>
                                                <input type="text" class="form-control" id="inputFieldName" name="name" minlength="2" maxlength="16" placeholder="{$FIELD_NAME}" value="{$FIELD_NAME_VALUE}" onchange="this.form.submit()">
                                            </div>
                                            <div class="col-md-6">
                                                <label for="inputFieldType">{$TYPE}</label>
                                                <select class="form-control" name="type" id="inputFieldType" onchange="this.form.submit()">
                                                    {foreach from=$TYPES key=key item=item}
                                                        <option value="{$key}" {if $key eq $TYPE_VALUE} selected{/if}>{$item}</option>
                                                    {/foreach}
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputDescription">{$DESCRIPTION}</label>
                                        <input class="form-control" type="text" id="inputDescription" name="description" value="{$DESCRIPTION_VALUE}" onchange="this.form.submit()">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header">
                                    {$L_FIELD_SETTINGS}
                                </div>
                                <div class="card-body">
                                    <div class="d-flex">
                                        <input class="form-check form-switch" type="checkbox" id="inputRequired" name="required" switch="success" {if $REQUIRED_VALUE eq 1}checked{/if} onchange="this.form.submit()">
                                        <label class="form-label" for="inputRequired" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                        <label for="inputRequired"> &nbsp;{$REQUIRED} <i class="fas fa-question-circle" data-container="body" data-bs-toggle="popover" title="{$INFO}" data-content="{$REQUIRED_HELP}"></i></label>
                                    </div>
                                    <div class="d-flex">
                                        <input class="form-check form-switch" type="checkbox" id="inputEditable" name="editable" switch="success" {if $EDITABLE_VALUE eq 1}checked{/if} onchange="this.form.submit()">
                                        <label class="form-label" for="inputEditable" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                        <label for="inputEditable"> &nbsp;{$EDITABLE} <i class="fas fa-question-circle" data-container="body" data-bs-toggle="popover" title="{$INFO}" data-content="{$EDITABLE_HELP}"></i></label>
                                    </div>
                                    <div class="d-flex">
                                        <input class="form-check form-switch" type="checkbox" id="inputPublic" name="public" switch="success" {if $PUBLIC_VALUE eq 1}checked{/if} onchange="this.form.submit()">
                                        <label class="form-label" for="inputPublic" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                        <label for="inputPublic"> &nbsp;{$PUBLIC} <i class="fas fa-question-circle" data-container="body" data-bs-toggle="popover" title="{$INFO}" data-content="{$PUBLIC_HELP}"></i></label>
                                    </div>
                                    <div class="d-flex">
                                        <input class="form-check form-switch" type="checkbox" id="inputForum" name="forum" switch="success" {if $DISPLAY_FIELD_ON_FORUM_VALUE eq 1}checked{/if} onchange="this.form.submit()">
                                        <label class="form-label" for="inputForum" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                        <label for="inputForum"> &nbsp;{$DISPLAY_FIELD_ON_FORUM} <i class="fas fa-question-circle" data-container="body" data-bs-toggle="popover" title="{$INFO}" data-content="{$DISPLAY_FIELD_ON_FORUM_HELP}"></i></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <hr>
                            <input type="submit" class="btn btn-outline-primary" value="{$L_SAVE}">
                            <a class="btn btn-outline-danger float-end ml-3" href="#" onclick="showDeleteModal()">{$DELETE}</a>
                            <a class="btn btn-outline-warning float-end" href="{$CANCEL_LINK}">{$L_BACK}</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        {include file='footer.tpl'}
    </div>
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body text-center text-warning">
                    {$CONFIRM_DELETE}
                </div>
                <div class="modal-footer">
                    <form class="float-start" action="" method="post">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="{$FIELD_ID}">
                        <input type="submit" class="btn btn-primary btn-sm" value="{$YES}">
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
    $('#cancelModal').modal().show();
  }

  function showDeleteModal() {
    $('#deleteModal').modal().show();
  }
</script>
</body>
</html>