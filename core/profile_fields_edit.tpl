{include file='header.tpl'}
<body id="page-top">
<div id="wrapper">
    {include file='sidebar.tpl'}
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            {include file='navbar.tpl'}
            <!--  -->
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
                                    Field Information
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="inputFieldName">{$FIELD_NAME}</label>
                                                <input type="text" class="form-control" id="inputFieldName" name="name" placeholder="{$FIELD_NAME}" value="{$FIELD_NAME_VALUE}" onchange="this.form.submit()">
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
                                        <textarea class="form-control" id="inputDescription" name="description" onchange="this.form.submit()">{$DESCRIPTION_VALUE}</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header">
                                    Field Settings
                                </div>
                                <div class="card-body">
                                    <div class="d-flex">
                                        <input class="form-check form-switch" type="checkbox" id="inputRequired" name="required" switch="success" {if $REQUIRED_VALUE eq 1}checked{/if} onchange="this.form.submit()">
                                        <label class="form-label" for="inputRequired" data-on-label="Yes" data-off-label="No"></label>
                                        <label for="inputRequired"> &nbsp;{$REQUIRED} <i class="fas fa-question-circle" data-container="body" data-toggle="popover" title="{$INFO}" data-content="{$REQUIRED_HELP}"></i></label>
                                    </div>
                                    <div class="d-flex">
                                        <input class="form-check form-switch" type="checkbox" id="inputEditable" name="editable" switch="success" {if $EDITABLE_VALUE eq 1}checked{/if} onchange="this.form.submit()">
                                        <label class="form-label" for="inputEditable" data-on-label="Yes" data-off-label="No"></label>
                                        <label for="inputEditable"> &nbsp;{$EDITABLE} <i class="fas fa-question-circle" data-container="body" data-toggle="popover" title="{$INFO}" data-content="{$EDITABLE_HELP}"></i></label>
                                    </div>
                                    <div class="d-flex">
                                        <input class="form-check form-switch" type="checkbox" id="inputPublic" name="public" switch="success" {if $PUBLIC_VALUE eq 1}checked{/if} onchange="this.form.submit()">
                                        <label class="form-label" for="inputPublic" data-on-label="Yes" data-off-label="No"></label>
                                        <label for="inputPublic"> &nbsp;{$PUBLIC} <i class="fas fa-question-circle" data-container="body" data-toggle="popover" title="{$INFO}" data-content="{$PUBLIC_HELP}"></i></label>
                                    </div>
                                    <div class="d-flex">
                                        <input class="form-check form-switch" type="checkbox" id="inputForum" name="forum" switch="success" {if $DISPLAY_FIELD_ON_FORUM_VALUE eq 1}checked{/if} onchange="this.form.submit()">
                                        <label class="form-label" for="inputForum" data-on-label="Yes" data-off-label="No"></label>
                                        <label for="inputForum"> &nbsp;{$DISPLAY_FIELD_ON_FORUM} <i class="fas fa-question-circle" data-container="body" data-toggle="popover" title="{$INFO}" data-content="{$DISPLAY_FIELD_ON_FORUM_HELP}"></i></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <input type="submit" class="btn btn-outline-primary" value="Save">
                                <a class="btn btn-outline-danger float-right ml-3" href="#" onclick="showDeleteModal()">{$DELETE}</a>
                                <a class="btn btn-outline-warning float-right" href="{$CANCEL_LINK}">Back</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!--  -->
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
                    {$CONFIRM_DELETE}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                    <form action="" method="post">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="{$FIELD_ID}">
                        <input type="submit" class="btn btn-primary" value="{$YES}">
                    </form>
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