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
                            <h4 class="mb-sm-0">{$SOCIAL_MEDIA}</h4>
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                    <li class="breadcrumb-item active">{$CONFIGURATION}</li>
                                    <li class="breadcrumb-item active">{$SOCIAL_MEDIA}</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                {include file='includes/update.tpl'}
                <div class="row text-center">
                    <div class="offset-4 col-md-4">{include file='includes/alerts.tpl'}</div>
                </div>
                <form action="" method="post">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header"><i class="fab fa-youtube"></i> YouTube</div>
                                <div class="card-body">
                                    <label for="InputYoutube">{$YOUTUBE_URL}</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="url" name="youtubeurl" class="form-control" id="InputYoutube" placeholder="{$YOUTUBE_URL}" value="{$YOUTUBE_URL_VALUE}">
                                            {if $YOUTUBE_URL_VALUE}
                                            <div class="input-group-append">
                                                <a class="btn btn-youtube" href="{$YOUTUBE_URL}"><i class="fab fa-youtube"></i></a>
                                            </div>
                                            {/if}
                                        </div>
                                    </div>
                                    <input type="hidden" name="token" value="{$TOKEN}">
                                    <input type="submit" class="btn btn-primary" value="{$SUBMIT}">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header"><i class="fab fa-facebook"></i> Facebook</div>
                                <div class="card-body">
                                    <label for="InputFacebook">{$FACEBOOK_URL}</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="url" name="fburl" class="form-control" id="InputFacebook" placeholder="{$FACEBOOK_URL}" value="{$FACEBOOK_URL_VALUE}">
                                            {if $FACEBOOK_URL_VALUE}
                                            <div class="input-group-append">
                                                <a class="btn btn-facebook" href="{$FACEBOOK_URL}"><i class="fab fa-facebook"></i></a>
                                            </div>
                                            {/if}
                                        </div>
                                    </div>
                                    <input type="hidden" name="token" value="{$TOKEN}">
                                    <input type="submit" class="btn btn-primary" value="{$SUBMIT}">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header"><i class="fab fa-twitter"></i> Twitter</div>
                                <div class="card-body">
                                    <label for="InputYoutube">{$TWITTER_URL}</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="url" name="twitterurl" class="form-control" id="InputTwitter" placeholder="{$TWITTER_URL}" value="{$TWITTER_URL_VALUE}">
                                            {if $TWITTER_URL_VALUE}
                                            <div class="input-group-append">
                                                <a class="btn btn-twitter" href="{$TWITTER_URL}"><i class="fab fa-twitter"></i></a>
                                            </div>
                                            {/if}
                                        </div>
                                    </div>
                                    <div class="d-flex">
                                        <input class="form-check form-switch" type="checkbox" id="twitter_dark_theme" switch="success" value="1" {if $TWITTER_STYLE_VALUE eq 'dark' } checked{/if} name="twitter_dark_theme">
                                        <label class="form-label" for="twitter_dark_theme" data-on-label="On" data-off-label="Off"></label>
                                        <label for="InputTwitterStyle"> &nbsp;{$TWITTER_STYLE}</label>
                                    </div>
                                    <input type="hidden" name="token" value="{$TOKEN}">
                                    <input type="submit" class="btn btn-primary" value="{$SUBMIT}">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header"><i class="fab fa-discord"></i> Discord</div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="InputDiscord">{$DISCORD_SERVER_ID}</label>
                                        <input type="text" name="discordid" class="form-control" id="InputDiscord" placeholder="{$DISCORD_SERVER_ID}" value="{$DISCORD_SERVER_ID_VALUE}">
                                    </div>
                                    <input type="hidden" name="token" value="{$TOKEN}">
                                    <input type="submit" class="btn btn-primary" value="{$SUBMIT}">
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