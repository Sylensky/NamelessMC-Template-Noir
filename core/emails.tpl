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
                            <h4 class="mb-sm-0">{$EMAILS}</h4>
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                    <li class="breadcrumb-item">{$CONFIGURATION}</li>
                                    <li class="breadcrumb-item">{$EMAILS}</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                {include file='includes/update.tpl'}
                <form action="" method="post">
                <input type="hidden" name="token" value="{$TOKEN}">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <div class="d-flex">
                                    <input class="form-check form-switch" type="checkbox" id="inputMailer" name="enable_mailer" switch="success" value="1" {if $ENABLE_MAILER_VALUE eq 1} checked{/if} onchange="this.form.submit()">
                                    <label class="form-label" for="inputMailer" data-on-label="Yes" data-off-label="No"></label>
                                    <label for="inputMailer"> &nbsp;{$ENABLE_MAILER} <i class="far fa-question-circle text-warning" data-toggle="popover" data-title="{$INFO}" data-placement="bottom" data-content="{$ENABLE_MAILER_HELP}"></i></label>
                                </div>
                            </div>
                            <div class="card-body">
                            {if $ENABLE_MAILER_VALUE eq 1}
                                <div class="form-group">
                                    <label for="inputUsername">{$USERNAME}</label>
                                    <input class="form-control" type="text" name="username" value="{$USERNAME_VALUE}" id="inputUsername">
                                </div>
                                <div class="form-group">
                                    <span class="badge text-info">
                                        <i class="fas fa-question-circle" data-container="body" data-toggle="popover" data-placement="right" title="{$INFO}" data-content="{$PASSWORD_HIDDEN}"></i>
                                    </span>
                                    <label for="inputPassword">{$PASSWORD}</label>
                                    <input class="form-control" type="password" name="password" id="inputPassword">
                                </div>
                                <div class="form-group">
                                    <label for="inputName">{$NAME}</label>
                                    <input class="form-control" type="text" name="name" value="{$NAME_VALUE}" id="inputName">
                                </div>
                                <div class="form-group">
                                    <label for="inputHost">{$HOST}</label>
                                    <input class="form-control" type="text" name="host" value="{$HOST_VALUE}" id="inputHost">
                                </div>
                                <div class="form-group">
                                    <label for="inputPort">{$PORT}</label>
                                    <input class="form-control" type="text" name="port" value="{$PORT_VALUE}" id="inputPort">
                                </div>
                            {else}
                            <div class="text-center text-warning">Enable PHPMailer to change settings {$Langa}</div>
                            {/if}
                            </div>
                        </div><br>
                        {if $ENABLE_MAILER_VALUE eq 1}
                        <div class="card border-left-primary">
                            <div class="card-body">
                                <h5><i class="icon fa fa-info-circle"></i> {$INFO}</h5>
                                {$MAILER_SETTINGS_INFO}
                            </div>
                        </div>
                        {/if}
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                {if isset($MASS_MESSAGE_LINK)}
                                <a href="{$MASS_MESSAGE_LINK}" class="btn btn-primary btn-sm">{$MASS_MESSAGE}</a>
                                {/if}
                                <a href="{$EDIT_EMAIL_MESSAGES_LINK}" class="btn btn-primary btn-sm">{$EDIT_EMAIL_MESSAGES}</a>
                                <span class="float-right">
                                    <a href="{$SEND_TEST_EMAIL_LINK}" class="btn btn-info btn-sm">{$SEND_TEST_EMAIL}</a>
                                    <a href="{$EMAIL_ERRORS_LINK}" class="btn btn-warning btn-sm">{$EMAIL_ERRORS}</a>
                                </span>
                            </div>
                            <div class="card-body">
                                    <div class="form-group">
                                        <label for="InputOutgoingEmail">{$OUTGOING_EMAIL}</label>
                                        <span class="badge text-info">
                                            <i class="fas fa-question-circle" data-container="body" data-toggle="popover" data-placement="right" title="{$INFO}" data-content="{$OUTGOING_EMAIL_INFO}"></i>
                                        </span>
                                        <input type="text" id="InputOutgoingEmail" name="email" value="{$OUTGOING_EMAIL_VALUE}" class="form-control">
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
</div>
{include file='scripts.tpl'}
</body>
</html>