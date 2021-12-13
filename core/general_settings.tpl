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
                            <h4 class="mb-sm-0">{$GENERAL_SETTINGS}</h4>
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                    <li class="breadcrumb-item active">{$CONFIGURATION}</li>
                                    <li class="breadcrumb-item active">{$GENERAL_SETTINGS}</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                {include file='includes/update.tpl'}
                <div class="card">
                    <div class="card-body">
                        <form id="xxx" action="" method="post">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="inputSiteName">{$SITE_NAME_LABEL}</label>
                                        <input type="text" class="form-control" minlength="2" maxlength="64" id="inputSiteName" name="sitename" placeholder="{$SITE_NAME_LABEL}" value="{$SITE_NAME}">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputContactEmail">{$CONTACT_EMAIL_ADDRESS}</label>
                                        <input type="email" class="form-control" id="inputContactEmail" name="contact_email" placeholder="{$CONTACT_EMAIL_ADDRESS}" value="{$CONTACT_EMAIL_ADDRESS_VALUE}">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <span class="badge text-info">
                                            <i class="fas fa-question-circle" data-container="body" data-toggle="popover" data-placement="top" title="{$INFO}" data-content="{$DEFAULT_LANGUAGE_HELP}"></i>
                                        </span>
                                        <label for="inputDefaultLanguage">{$DEFAULT_LANGUAGE}</label>
                                        <div class="input-group">
                                            <select name="language" class="form-control" id="inputDefaultLanguage">
                                                {foreach from=$DEFAULT_LANGUAGE_VALUES item=item}
                                                    <option value="{$item->id}" {if $item->is_default eq 1} selected{/if}>{$item->name}</option>
                                                {/foreach}
                                            </select>
                                            <div class="input-group-append">
                                                <a class="btn btn-xma-outline" data-toggle="tooltip" title="{$INSTALL_LANGUAGE}" href="{$INSTALL_LANGUAGE_LINK}">
                                                    <i class="fas fa-plus-circle"></i>
                                                </a>
                                                <a class="btn btn-xma-outline" data-toggle="tooltip" title="{$UPDATE_USER_LANGUAGES}" onclick="showLanguageModal()">
                                                    <i class="fas fa-upload"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputDefaultTimezone">{$DEFAULT_TIMEZONE}</label>
                                        <select name="timezone" class="form-select" id="inputDefaultTimezone">
                                            {foreach from=$DEFAULT_TIMEZONE_LIST key=key item=item}
                                                <option value="{$key}" {if $DEFAULT_TIMEZONE_VALUE eq $key} selected{/if}>
                                                    ({$item.offset}) - {$item.name} ({$item.time})
                                                </option>
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="inputHomepage">{$HOMEPAGE_TYPE}</label>
                                        <select name="homepage" class="form-select" id="inputHomepage">
                                            <option value="default" {if $HOMEPAGE_VALUE eq 0} selected{/if}>{$HOMEPAGE_DEFAULT}</option>
                                            <option value="portal" {if $HOMEPAGE_VALUE eq 1} selected{/if}>{$HOMEPAGE_PORTAL}</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputFormatting">{$POST_FORMATTING}</label>
                                        <select name="formatting" class="form-select" id="inputFormatting">
                                            <option value="html" {if $POST_FORMATTING_VALUE eq "html" } selected{/if}>
                                                HTML
                                            </option>
                                            <option value="markdown" {if $POST_FORMATTING_VALUE eq "markdown" } selected{/if}>
                                                Markdown
                                            </option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <span class="badge text-info">
                                            <i class="fas fa-question-circle" data-container="body" data-toggle="popover" data-placement="top" title="{$INFO}" data-content="{$USE_FRIENDLY_URLS_HELP}"></i>
                                        </span>
                                        <label for="inputFriendlyURL">{$USE_FRIENDLY_URLS}</label>
                                        <select name="friendlyURL" class="form-select" id="inputFriendlyURL">
                                            <option value="true" {if $USE_FRIENDLY_URLS_VALUE} selected{/if}>{$ENABLED}</option>
                                            <option value="false" {if !$USE_FRIENDLY_URLS_VALUE} selected{/if}>{$DISABLED}</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputPrivateProfile">{$PRIVATE_PROFILES}</label>
                                        <select name="privateProfile" class="form-select" id="inputPrivateProfile">
                                            <option value="1" {if $PRIVATE_PROFILES_VALUE} selected{/if}>{$ENABLED}</option>
                                            <option value="0" {if !$PRIVATE_PROFILES_VALUE} selected{/if}>{$DISABLED}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <span class="badge text-info">
                                            <i class="fas fa-question-circle" data-container="body" data-toggle="popover" data-placement="top" title="{$INFO}" data-content="{$FORCE_HTTPS_HELP}"></i>
                                        </span>
                                        <label for="inputForceHTTPS">{$FORCE_HTTPS}</label>
                                        <select name="forceHTTPS" class="form-select" id="inputForceHTTPS">
                                            <option value="true" {if $FORCE_HTTPS_VALUE} selected{/if}>{$ENABLED}</option>
                                            <option value="false" {if !$FORCE_HTTPS_VALUE} selected{/if}>{$DISABLED}</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputForceWWW">{$FORCE_WWW}</label>
                                        <select name="forceWWW" class="form-select" id="inputForceWWW">
                                            <option value="true" {if $FORCE_WWW_VALUE} selected{/if}>{$ENABLED}</option>
                                            <option value="false" {if !$FORCE_WWW_VALUE} selected{/if}>{$DISABLED}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="inputEnableNicknames">{$ENABLE_NICKNAMES}</label>
                                        <select name="displaynames" class="form-select" id="inputEnableNicknames">
                                            <option value="true" {if $ENABLE_NICKNAMES_VALUE eq "true" } selected{/if}>{$ENABLED}</option>
                                            <option value="false" {if $ENABLE_NICKNAMES_VALUE eq "false" } selected{/if}>{$DISABLED}</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputLoginMethod">{$LOGIN_METHOD}</label>
                                        <select name="login_method" class="form-select" id="inputLoginMethod">
                                            <option value="email" {if $LOGIN_METHOD_VALUE eq "email" } selected{/if}>{$EMAIL}</option>
                                            <option value="username" {if $LOGIN_METHOD_VALUE eq "username" } selected{/if}>{$USERNAME}</option>
                                            <option value="email_or_username" {if $LOGIN_METHOD_VALUE eq "email_or_username" } selected{/if}>{$EMAIL_OR_USERNAME}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="hidden" name="token" value="{$TOKEN}">
                                <input type="submit" class="btn btn-primary" value="{$SUBMIT}">
                            </div>
                        </form>

                    </div>
                </div>
                <div style="height:1rem;"></div>
            </div>
        </div>
        {include file='footer.tpl'}
    </div>
    <div class="modal fade" id="languageModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{$ARE_YOU_SURE}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    {$UPDATE_USER_LANGUAGES_INFO}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                    <a href="{$UPDATE_USER_LANGUAGES_LINK}" class="btn btn-primary">{$YES}</a>
                </div>
            </div>
        </div>
    </div>
</div>
{include file='scripts.tpl'}
<script type="text/javascript">
  function showLanguageModal() {
    $('#languageModal').modal().show();
  }
</script>
</body>
</html>