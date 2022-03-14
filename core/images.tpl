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
                                <h4 class="mb-sm-0">{$IMAGES}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                        <li class="breadcrumb-item active">{$LAYOUT}</li>
                                        <li class="breadcrumb-item active">{$IMAGES}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        {include file='includes/update.tpl'}
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            {if isset($BACKGROUNDS_NOT_WRITABLE) || isset($TEMPLATE_BANNERS_DIRECTORY_NOT_WRITABLE) || isset($LOGOS_DIRECTORY_NOT_WRITABLE) || isset($FAVICONS_DIRECTORY_NOT_WRITABLE)}
                            <div class="alert alert-danger alert-dismissible">
                                <h5><i class="icon far fa-exclamation-triangle"></i> {$ERRORS_TITLE}</h5>
                                <ul>
                                    {if isset($BACKGROUNDS_NOT_WRITABLE)}
                                    <li>{$BACKGROUNDS_NOT_WRITABLE}</li>
                                    {/if}
                                    {if isset($TEMPLATE_BANNERS_DIRECTORY_NOT_WRITABLE)}
                                    <li>{$TEMPLATE_BANNERS_DIRECTORY_NOT_WRITABLE}</li>
                                    {/if}
                                    {if isset($LOGOS_DIRECTORY_NOT_WRITABLE)}
                                    <li>{$LOGOS_DIRECTORY_NOT_WRITABLE}</li>
                                    {/if}
                                    {if isset($FAVICONS_DIRECTORY_NOT_WRITABLE)}
                                    <li>{$FAVICONS_DIRECTORY_NOT_WRITABLE}</li>
                                    {/if}
                                </ul>
                            </div>
                            {/if}
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header">
                                    {$LOCALE.Background_image}
                                    <span class="float-right">
                                        <i class="far fa-question text-warning" data-toggle="popover" data-title="{$INFO}" data-content="{$BACKGROUND_IMAGE_INFO}"></i>
                                    </span>
                                </div>
                                <div class="card-body pb-1 pt-3">
                                    <div class="images-extra-scroll">
                                        <form action="" method="post" style="display:inline;">
                                            <input type="hidden" name="token" value="{$TOKEN}">
                                            <select name="bg" class="image-picker show-html" onchange="this.form.submit()">
                                                {foreach from=$BACKGROUND_IMAGES_ARRAY item=image}
                                                <option data-img-src="{$image.src}" value="{$image.value}" {if $image.selected} selected{/if}>{$image.n}</option>
                                                {/foreach}
                                            </select>
                                        </form>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#uploadModal">{$UPLOAD_NEW_IMAGE}</button>
                                    <span class="float-right">
                                        <a href="{$RESET_LINK}" class="btn btn-danger btn-sm">{$LOCALE.Reset_Image}</a>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header">{$LOCALE.Banner_image}</div>
                                <div class="card-body pb-1 pt-3">
                                    <div class="images-extra-scroll">
                                        <form action="" method="post" style="display:inline;">
                                            <input type="hidden" name="token" value="{$TOKEN}">
                                            <select name="banner" class="image-picker show-html" onchange="this.form.submit()">
                                                {foreach from=$BANNER_IMAGES_ARRAY item=image}
                                                <option data-img-src="{$image.src}" value="{$image.value}" {if $image.selected} selected{/if}>{$image.n}</option>
                                                {/foreach}
                                            </select>
                                        </form>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#uploadBannerModal">{$UPLOAD_NEW_IMAGE}</button>
                                    <span class="float-right">
                                        <a href="{$RESET_BANNER_LINK}" class="btn btn-danger btn-sm">{$LOCALE.Reset_Image}</a>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header">{$LOCALE.Logo_image}</div>
                                <div class="card-body pb-1 pt-3">
                                    <div class="images-extra-scroll">
                                        <form action="" method="post" style="display:inline;">
                                            <input type="hidden" name="token" value="{$TOKEN}">
                                            <select name="logo" class="image-picker show-html" onchange="this.form.submit()">
                                                {foreach from=$LOGO_IMAGES_ARRAY item=image}
                                                <option data-img-src="{$image.src}" value="{$image.value}" {if $image.selected} selected{/if}>{$image.n}</option>
                                                {/foreach}
                                            </select>
                                        </form>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#uploadLogoModal">{$UPLOAD_NEW_IMAGE}</button>
                                    <span class="float-right">
                                        <a href="{$RESET_LOGO_LINK}" class="btn btn-danger btn-sm">{$LOCALE.Reset_Image}</a>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header">{$LOCALE.Favicon_image}</div>
                                <div class="card-body pb-1 pt-3">
                                    <div class="images-extra-scroll">
                                        <form action="" method="post" style="display:inline;">
                                            <input type="hidden" name="token" value="{$TOKEN}">
                                            <select name="favicon" class="image-picker show-html" onchange="this.form.submit()">
                                                {foreach from=$FAVICON_IMAGES_ARRAY item=image}
                                                <option data-img-src="{$image.src}" value="{$image.value}" {if $image.selected} selected{/if}>{$image.n}</option>
                                                {/foreach}
                                            </select>
                                        </form>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#uploadFaviconModal">{$UPLOAD_NEW_IMAGE}</button>
                                    <span class="float-right">
                                        <a href="{$RESET_FAVICON_LINK}" class="btn btn-danger btn-sm">{$LOCALE.Reset_Image}</a>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {include file='footer.tpl'}
        </div>

        <div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="uploadModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="uploadModalLabel">{$UPLOAD_NEW_IMAGE}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="{$UPLOAD_PATH}" class="dropzone" id="uploadBackgroundDropzone">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <input type="hidden" name="type" value="background">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-success btn-sm" onclick="location.reload();" data-dismiss="modal">{$LOCALE.Save}</button>
                        <span class="float-right">
                            <button type="button" class="btn btn-outline-primary btn-sm" data-dismiss="modal">{$CLOSE}</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="uploadBannerModal" tabindex="-1" role="dialog" aria-labelledby="uploadBannerModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="uploadBannerModalLabel">{$UPLOAD_NEW_IMAGE}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="{$UPLOAD_PATH}" class="dropzone" id="uploadBannerDropzone">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <input type="hidden" name="type" value="template_banner">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-success btn-sm" onclick="location.reload();" data-dismiss="modal">{$LOCALE.Save}</button>
                        <span class="float-right">
                            <button type="button" class="btn btn-outline-primary btn-sm" data-dismiss="modal">{$CLOSE}</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="uploadLogoModal" tabindex="-1" role="dialog" aria-labelledby="uploadLogoModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="uploadLogoModalLabel">{$UPLOAD_NEW_IMAGE}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="{$UPLOAD_PATH}" class="dropzone" id="uploadLogoDropzone">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <input type="hidden" name="type" value="logo">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-success btn-sm" onclick="location.reload();" data-dismiss="modal">{$LOCALE.Save}</button>
                        <span class="float-right">
                            <button type="button" class="btn btn-outline-primary btn-sm" data-dismiss="modal">{$CLOSE}</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="uploadFaviconModal" tabindex="-1" role="dialog" aria-labelledby="uploadFaviconModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="uploadFaviconModalLabel">{$UPLOAD_NEW_IMAGE}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="{$UPLOAD_PATH}" class="dropzone" id="uploadFaviconDropzone">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <input type="hidden" name="type" value="favicon">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-success btn-sm" onclick="location.reload();" data-dismiss="modal">{$LOCALE.Save}</button>
                        <span class="float-right">
                            <button type="button" class="btn btn-outline-primary btn-sm" data-dismiss="modal">{$CLOSE}</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {include file='scripts.tpl'}
</body>

</html>