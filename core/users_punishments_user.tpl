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
                                <h4 class="mb-sm-0">{$VIEWING_USER}</h4>
                                <div class="page-title-right">
                                    {if isset($RESET_AVATAR)}
                                    <button data-bs-toggle="modal" data-target="#resetAvatarModal" class="btn btn-warning btn-sm" {if ($HAS_AVATAR !=true)} disabled {/if}>{$RESET_AVATAR} </button>
                                    {/if}
                                    {if isset($WARN)}
                                    <a href="#" data-bs-toggle="modal" data-target="#warnModal" class="btn btn-warning btn-sm">{$WARN}</a>
                                    {/if}
                                    {if isset($BAN)}
                                    <a href="#" data-bs-toggle="modal" data-target="#banModal" class="btn btn-danger btn-sm">{$BAN}</a>
                                    {/if}
                                    {if isset($BAN_IP)}
                                    <a href="#" data-bs-toggle="modal" data-target="#banIPModal" class="btn btn-danger btn-sm">{$BAN_IP}</a>
                                    {/if}
                                    <a href="{$BACK_LINK}" class="btn btn-primary btn-sm">{$BACK}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    {include file='includes/update.tpl'}
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">{$PREVIOUS_PUNISHMENTS}</div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        {if count($PREVIOUS_PUNISHMENTS_LIST)}
                            {foreach from=$PREVIOUS_PUNISHMENTS_LIST item=punishment name=punishments}
                            <div class="col-md-6">
                                <div class="card mb-1">
                                    <div class="card-header">
                                        <div class="mb-0">
                                            <span style="{$punishment.issued_by_style}">{$punishment.issued_by_nickname}</span> - <span data-bs-toggle="tooltip" data-title="{$punishment.date_full}">{$punishment.date_friendly}</span>
                                            <span class="float-end">
                                                {if $punishment.type_numeric == 1}
                                                    <span class="badge badge-danger">{$punishment.type}</span>
                                                {elseif $punishment.type_numeric == 2 || $punishment.type_numeric == 4}
                                                    <span class="badge badge-warning">{$punishment.type}</span>
                                                {elseif $punishment.type_numeric == 3}
                                                    <span class="badge badge-danger">{$punishment.type}</span>
                                                {/if}
                                                {if $punishment.revoked == 1}
                                                    <span class="badge badge-success">{$REVOKED}</span>
                                                {/if}
                                                {if $punishment.revoked == 0 && $punishment.revoke_link != 'none'}
                                                <a href="#" class="ml-2 text-danger" data-bs-toggle="tooltip" data-title="{$REVOKE}" onclick="showRevokeModal('{$punishment.revoke_link}', '{$punishment.confirm_revoke_punishment|replace:"'":"\'"}')"><i class="far fa-trash-alt"></i></a>
                                                {/if}
                                            </span>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <b>{$REASON}:</b> {$punishment.reason}
                                    </div>
                                </div>
                            </div>
                            {/foreach}
                        {else}
                        <div class="col-md-12 text-info text-center">
                            {$NO_PREVIOUS_PUNISHMENTS}
                        </div>
                        {/if}
                    </div>
                </div>
            </div>
            {include file='footer.tpl'}
        </div>
        {if isset($RESET_AVATAR)}
        <div class="modal fade" id="resetAvatarModal" tabindex="-1" role="dialog" aria-labelledby="resetAvatarModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="warnModalLabel">{$RESET_AVATAR}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="" method="post">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="InputReason">{$REASON}</label>
                                <textarea class="form-control" id="InputReason" name="reason"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-warning btn-sm" data-dismiss="modal">{$CANCEL}</button>
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <input type="hidden" name="type" value="reset_avatar">
                            <input type="submit" class="btn btn-danger btn-sm" value="{$SUBMIT}">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        {/if}
        {if isset($WARN)}
        <div class="modal fade" id="warnModal" tabindex="-1" role="dialog" aria-labelledby="warnModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="warnModalLabel">{$WARN_USER}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="" method="post">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <input type="hidden" name="type" value="warn">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="InputReason">{$REASON}</label>
                                <textarea class="form-control" id="InputReason" name="reason"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success btn-sm" value="{$SUBMIT}">
                            <span class="float-end">
                                <button type="button" class="btn btn-warning btn-sm" data-dismiss="modal">{$CANCEL}</button>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        {/if}
        {if isset($BAN)}
        <div class="modal fade" id="banModal" tabindex="-1" role="dialog" aria-labelledby="banModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="banModalLabel">{$BAN_USER}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="" method="post">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <input type="hidden" name="type" value="ban">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="InputReason">{$REASON}</label>
                                <textarea class="form-control" id="InputReason" name="reason"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success btn-sm" value="{$SUBMIT}">
                            <span class="float-end">
                                <button type="button" class="btn btn-warning btn-sm" data-dismiss="modal">{$CANCEL}</button>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        {/if}
        {if isset($BAN_IP)}
        <div class="modal fade" id="banIPModal" tabindex="-1" role="dialog" aria-labelledby="banIPModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="banIPModalLabel">{$BAN_IP}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="" method="post">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <input type="hidden" name="type" value="ban_ip">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="InputReason">{$REASON}</label>
                                <textarea class="form-control" id="InputReason" name="reason"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success btn-sm" value="{$SUBMIT}">
                            <span class="float-end">
                                <button type="button" class="btn btn-warning btn-sm" data-dismiss="modal">{$CANCEL}</button>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        {/if}
        {if isset($REVOKE_PERMISSION)}
        <div class="modal fade" id="revokeModal" tabindex="-1" role="dialog" aria-labelledby="revokeModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="revokeModalLabel">{$ARE_YOU_SURE}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" id="revokeModalContents"></div>
                    <div class="modal-footer">
                        <form action="" method="post" id="revokeForm">
                            <input type="hidden" name="token" value="{$TOKEN}" />
                            <input type="submit" class="btn btn-success btn-sm" value="{$YES}">
                            <span class="float-end">
                                <button type="button" class="btn btn-warning btn-sm" data-dismiss="modal">{$NO}</button>
                            </span>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        {/if}
    </div>
    {include file='scripts.tpl'}
    <script type="text/javascript">
        function showRevokeModal(link, text) {
            $('#revokeModalContents').html(text);
            $('#revokeForm').attr('action', link);
            $('#revokeModal').modal('show');
        }
    </script>
</body>
</html>