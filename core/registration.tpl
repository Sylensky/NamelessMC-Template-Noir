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
                                <h4 class="mb-sm-0">{$REGISTRATION}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                        <li class="breadcrumb-item">{$CONFIGURATION}</li>
                                        <li class="breadcrumb-item">{$REGISTRATION}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        {include file='includes/update.tpl'}
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-xl-8">
                            <div class="card">
                                <div class="card-body">
                                    <form id="enableRegistration" action="" method="post">
                                        <input type="hidden" name="token" value="{$TOKEN}">
                                        <div class="d-flex">
                                            <input type="hidden" name="enable_registration" value="0">
                                            <input class="form-check form-switch" type="checkbox" id="enable_registration" name="enable_registration" switch="success" value="1" {if $REGISTRATION_ENABLED eq 1}checked{/if} onchange="this.form.submit()">
                                            <label class="form-label" for="enable_registration" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                            <label for="enable_registration"> &nbsp;{$ENABLE_REGISTRATION}</label>
                                        </div>
                                    </form>
                                    <hr>
                                    <form action="" method="post">
                                    <input type="hidden" name="token" value="{$TOKEN}">
                                    <div class="form-group">
                                        <label for="InputRegistrationDisabledMessage">{$REGISTRATION_DISABLED_MESSAGE}</label>
                                        <textarea style="width:100%" rows="10" name="message" id="InputRegistrationDisabledMessage">{$REGISTRATION_DISABLED_MESSAGE_VALUE}</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-12 col-xl-4">
                            <div class="card mb-3">
                                <div class="card-header">
                                    Registration
                                </div>
                                <div class="card-body">
                                    <div class="d-flex">
                                        <input class="form-check form-switch" type="checkbox" id="InputVerification" name="verification" switch="success" {if $EMAIL_VERIFICATION_VALUE eq 1}checked{/if} onchange="this.form.submit()">
                                        <label class="form-label" for="InputVerification" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                        <label for="InputVerification"> &nbsp;{$EMAIL_VERIFICATION}</label>
                                    </div>
                                </div>
                            </div>
                            <div class="card mb-3">
                                <div class="card-header">
                                    {$VALIDATE_PROMOTE_GROUP} <i class="far fa-question-circle text-warning" data-bs-toggle="tooltip" title="{$VALIDATE_PROMOTE_GROUP_INFO}"></i>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <select class="form-control d-block" id="InputValidationPromoteGroup" name="promote_group" onchange="this.form.submit()">
                                            {foreach from=$GROUPS item=group}
                                            <option value="{$group->id}" {if $group->id eq $VALIDATION_GROUP} selected{/if}>{$group->name|escape}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header">
                                    Captcha
                                </div>
                                <div class="card-body">
                                    <div class="d-flex">
                                        <input class="form-check form-switch" type="checkbox" id="InputEnableRecaptcha" name="enable_recaptcha" switch="success" value="1" {if $CAPTCHA_GENERAL_VALUE eq 'true' } checked{/if} onchange="this.form.submit()">
                                        <label class="form-label" for="InputEnableRecaptcha" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                        <label for="InputEnableRecaptcha"> &nbsp;{$CAPTCHA_GENERAL}</label>
                                    </div>
                                    <div class="d-flex">
                                        <input class="form-check form-switch" type="checkbox" id="InputEnableRecaptchaLogin" name="enable_recaptcha_login" switch="success" value="1" {if $CAPTCHA_LOGIN_VALUE eq 'true' } checked{/if} onchange="this.form.submit()">
                                        <label class="form-label" for="InputEnableRecaptchaLogin" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                        <label for="InputEnableRecaptchaLogin"> &nbsp;{$CAPTCHA_LOGIN}</label>
                                    </div>
                                    <div class="form-group">
                                        <label for="InputCaptchaType">{$CAPTCHA_TYPE}</label>
                                        <select name="captcha_type" id="InputCaptchaType" class="form-control d-block" onchange="this.form.submit()">
                                            {foreach from=$CAPTCHA_OPTIONS item=option}
                                            <option value="{$option.value}" {if $option.active} selected{/if}>
                                                {$option.value}
                                            </option>
                                            {/foreach}
                                        </select>
                                    </div>
                                    <hr>
                                    <div class="form-group">
                                        <label for="InputRecaptcha">{$CAPTCHA_SITE_KEY}</label>
                                        <input type="text" name="recaptcha" minlength="2" maxlength="2048" class="form-control" id="InputRecaptcha" placeholder="{$CAPTCHA_SITE_KEY}" value="{$CAPTCHA_SITE_KEY_VALUE}" onchange="this.form.submit()">
                                    </div>
                                    <div class="form-group">
                                        <label for="InputRecaptchaSecret">{$CAPTCHA_SECRET_KEY}</label>
                                        <input type="text" name="recaptcha_secret" minlength="2" maxlength="2048" class="form-control" id="InputRecaptchaSecret" placeholder="{$CAPTCHA_SECRET_KEY}" value="{$CAPTCHA_SECRET_KEY_VALUE}" onchange="this.form.submit()">
                                    </div>
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            {include file='footer.tpl'}
        </div>
    </div>
    {include file='scripts.tpl'}
</body>
</html>