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
                                                <input type="text" class="form-control" id="inputFieldName" name="name" minlength="2" maxlength="16" placeholder="{$FIELD_NAME}" value="{$FIELD_NAME_VALUE}">
                                            </div>
                                            <div class="col-md-6">
                                                <label for="inputFieldType">{$TYPE}</label>
                                                <select class="form-control" name="type" id="inputFieldType">
                                                    {foreach from=$TYPES key=key item=item}
                                                        <option value="{$key}" {if $key eq $TYPE_VALUE} selected{/if}>{$item}</option>
                                                    {/foreach}
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputDescription">{$DESCRIPTION}</label>
                                        <input type="text" class="form-control" id="inputDescription" name="description">
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
                                        <input class="form-check form-switch" type="checkbox" id="inputRequired" name="required" switch="success">
                                        <label class="form-label" for="inputRequired" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                        <label for="inputRequired"> &nbsp;{$REQUIRED} <i class="fas fa-question-circle" data-container="body" data-toggle="popover" title="{$INFO}" data-content="{$REQUIRED_HELP}"></i></label>
                                    </div>
                                    <div class="d-flex">
                                        <input class="form-check form-switch" type="checkbox" id="inputEditable" name="editable" switch="success">
                                        <label class="form-label" for="inputEditable" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                        <label for="inputEditable"> &nbsp;{$EDITABLE} <i class="fas fa-question-circle" data-container="body" data-toggle="popover" title="{$INFO}" data-content="{$EDITABLE_HELP}"></i></label>
                                    </div>
                                    <div class="d-flex">
                                        <input class="form-check form-switch" type="checkbox" id="inputPublic" name="public" switch="success">
                                        <label class="form-label" for="inputPublic" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                        <label for="inputPublic"> &nbsp;{$PUBLIC} <i class="fas fa-question-circle" data-container="body" data-toggle="popover" title="{$INFO}" data-content="{$PUBLIC_HELP}"></i></label>
                                    </div>
                                    <div class="d-flex">
                                        <input class="form-check form-switch" type="checkbox" id="inputForum" name="forum" switch="success">
                                        <label class="form-label" for="inputForum" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                        <label for="inputForum"> &nbsp;{$DISPLAY_FIELD_ON_FORUM} <i class="fas fa-question-circle" data-container="body" data-toggle="popover" title="{$INFO}" data-content="{$DISPLAY_FIELD_ON_FORUM_HELP}"></i></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <hr>
                            <div class="form-group">
                                <input type="submit" class="btn btn-outline-primary" value="{$L_CREATE}">
                                <a class="btn btn-outline-warning float-end" href="{$CANCEL_LINK}">{$L_BACK}</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        {include file='footer.tpl'}
    </div>
</div>
{include file='scripts.tpl'}
</body>
</html>