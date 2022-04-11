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
                            <h4 class="mb-sm-0">{$EDITING_USER}</h4>
                            <div class="page-title-right d-none d-sm-block">
                                <a class="btn btn-outline-info btn-sm" href="{$BACK_LINK}" data-bs-toggle="tooltip" data-placement="top" title="{$L_BACK}"><i class="fad fa-arrow-left"></i> {$L_BACK}</a>
                                <button class="btn btn-outline-success btn-sm" type="button" onclick="document.getElementById('SaveUserSettings').submit();" data-bs-toggle="tooltip" data-placement="top" title="{$L_SAVE}"><i class="fad fa-save"></i> {$L_SAVE}</button>
                            </div>
                        </div>
                    </div>
                </div>
                {include file='includes/update.tpl'}
                <form role="form" id="SaveUserSettings" action="" method="post">
                <input type="hidden" name="token" value="{$TOKEN}">
                <input type="hidden" name="action" value="update">
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-xl-12">
                            <div class="card mb-4">
                                <div class="card-header">
                                {if isset($UPDATE_MINECRAFT_USERNAME)}
                                    <a class="btn btn-outline-success btn-sm ml-1" data-bs-toggle="tooltip" data-placement="top" title="{$UPDATE_MINECRAFT_USERNAME}" href="{$UPDATE_MINECRAFT_USERNAME_LINK}"><i class="far fa-check-double"></i> {$UPDATE_MINECRAFT_USERNAME}</a>
                                {/if}
                                {if isset($UPDATE_UUID)}
                                    <a class="btn btn-outline-success btn-sm ml-1" data-bs-toggle="tooltip" data-placement="top" title="{$UPDATE_UUID}" href="{$UPDATE_UUID_LINK}"><i class="far fa-fingerprint"></i> {$UPDATE_UUID}</a>
                                {/if}

                                    <span class="float-end">
                                        {if isset($VALIDATE_USER)}
                                        <a class="btn btn-outline-warning btn-sm ml-1" data-bs-toggle="tooltip" data-placement="top" title="{$VALIDATE_USER}" href="#" onclick="validateUser()"><i class="far fa-user-check"></i> {$VALIDATE_USER}</a>
                                        {/if}
                                        {if isset($RESEND_ACTIVATION_EMAIL)}
                                        <a class="btn btn-outline-warning btn-sm ml-1" data-bs-toggle="tooltip" data-placement="top" title="{$RESEND_ACTIVATION_EMAIL}" href="{$RESEND_ACTIVATION_EMAIL_LINK}"><i class="far fa-reply"></i> {$RESEND_ACTIVATION_EMAIL}</a>
                                        {/if}
                                        {if isset($DELETE_USER)}
                                            <a class="btn btn-outline-danger btn-sm" data-bs-toggle="tooltip" data-placement="top" title="{$DELETE_USER}" href="#" onclick="showDeleteModal()"><i class="far fa-trash"></i> {$DELETE_USER}</a>
                                        {/if}
                                    </span>
                                </div>
                                <div class="card-body">
                                    {if isset($WARNINGS) && count($WARNINGS)}
                                        <div class="alert bg-warning text-white alert-dismissible">
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                            <h5><i class="icon fas fa-exclamation-triangle"></i> {$WARNINGS_TITLE}</h5>
                                            <ul>
                                                {foreach from=$WARNINGS item=warning}
                                                    <li>{$warning}</li>
                                                {/foreach}
                                            </ul>
                                        </div>
                                    {/if}
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="InputMCUsername">{$USERNAME}</label>
                                                <input type="text" name="username" class="form-control" id="InputMCUsername" placeholder="{$USERNAME}" value="{$USERNAME_VALUE}">
                                            </div>
                                        </div>
                                        {if $DISPLAYNAMES eq true}
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="InputUsername">{$NICKNAME}</label>
                                                <input type="text" name="nickname" class="form-control" id="InputUsername" placeholder="{$NICKNAME}" value="{$NICKNAME_VALUE}">
                                            </div>
                                        </div>
                                        {else}
                                            <input type="hidden" name="nickname" value="{$NICKNAME_VALUE}">
                                        {/if}
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="InputEmail">{$EMAIL_ADDRESS}</label>
                                                <input type="email" name="email" class="form-control" id="InputEmail" placeholder="{$EMAIL_ADDRESS}" value="{$EMAIL_ADDRESS_VALUE}">
                                            </div>
                                        </div>
                                        {if $UUID_LINKING eq true}
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="InputUUID">{$UUID}</label>
                                                <input type="text" name="UUID" class="form-control" id="InputUUID" placeholder="{$UUID}" value="{$UUID_VALUE}">
                                            </div>
                                        </div>
                                        {/if}
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="InputTitle">{$USER_TITLE}</label>
                                                <input type="text" name="title" class="form-control" id="InputTitle" placeholder="{$USER_TITLE}" value="{$USER_TITLE_VALUE}">
                                            </div>
                                        </div>
                                        {if isset($DISCORD_ID_VALUE)}
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="InputDiscordId">{$DISCORD_ID}</label>
                                                <input type="text" class="form-control" id="InputDiscordId" value="{$DISCORD_ID_VALUE}" disabled>
                                            </div>
                                        </div>
                                        {/if}
                                        {if $PRIVATE_PROFILE_ENABLED eq true}
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="inputPrivateProfile">{$PRIVATE_PROFILE}</label>
                                                <select name="privateProfile" class="form-control" id="inputPrivateProfile">
                                                    <option value="1"{if $PRIVATE_PROFILE_VALUE eq 1} selected{/if}>{$ENABLED}</option>
                                                    <option value="0"{if $PRIVATE_PROFILE_VALUE eq 0} selected{/if}>{$DISABLED}</option>
                                                </select>
                                            </div>
                                        </div>
                                        {else}
                                            <input type="hidden" name="privateProfile" value="0">
                                        {/if}
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="inputTemplate">{$ACTIVE_TEMPLATE}</label>
                                                <select name="template" class="form-control" id="inputTemplate">
                                                    {foreach from=$TEMPLATES item=template}
                                                        <option value="{$template.id}"{if $template.active eq true} selected{/if}>{$template.name}</option>
                                                    {/foreach}
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-sm-12 col-md-12 col-xl-6">
                            <div class="card">
                                <div class="card-header">{$GROUPS}
                                <span class="float-end">
                                    <i class="icon far fa-info-circle text-warning" data-bs-toggle="tooltip" data-placement="top" title="{$GROUPS_INFO}"></i>
                                </span>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <b>{$MAIN_GROUP_INFO}</b> <span class="badge bg-info">{$MAIN_GROUP->name}</span> {if isset($CANT_EDIT_GROUP)} <i>({$CANT_EDIT_GROUP})</i>{/if}
                                        <hr>
                                        <select multiple="multiple" size="8" name="groups[]" id="inputGroups">
                                            {foreach from=$ALL_GROUPS item=item}
                                            <option value="{$item->id}" {if in_array($item->id, $GROUPS_VALUE)} selected{/if}>{$item->name|escape}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-12 col-xl-6">
                            <div class="card mb-4">
                                <div class="card-header">{$SIGNATURE}</div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <textarea style="width:100%" rows="10" name="signature" id="XInputSignature">{$SIGNATURE_VALUE}</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        {include file='footer.tpl'}
    </div>
    {if isset($DELETE_USER)}
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
                        {$CONFIRM_DELETE_USER}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                        <form action="" method="post">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="{$USER_ID}">
                            <input type="submit" class="btn btn-primary" value="{$YES}">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    {/if}
</div>
<form style="display:none" action="{$VALIDATE_USER_LINK}" method="post" id="validateUserForm">
    <input type="hidden" name="token" value="{$TOKEN}" />
</form>
{include file='scripts.tpl'}
<script type="text/javascript">
    {if isset($DELETE_USER)}
    function showDeleteModal() {
      $('#deleteModal').modal('show');
    }
    {/if}

    {if isset($VALIDATE_USER)}
    function validateUser() {
      $('#validateUserForm').submit();
    }
    {/if}
</script>
<script>

var UserGroups = $('select[name="groups[]"]').bootstrapDualListbox({
  nonSelectedListLabel: '<span class="text-success">Available Groups</span>',
  selectedListLabel: '<span class="text-info">User Group</span>',
  moveOnSelect: true,
  showFilterInputs: false,
  infoText: false,
  moveAllLabel: 'Move all',
  removeAllLabel: 'Remove all',
  removeAllLabel: 'false'
});
</script>
</body>
</html>