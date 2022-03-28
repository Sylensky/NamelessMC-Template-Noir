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
                                <h4 class="mb-sm-0">{$AVATARS}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                        <li class="breadcrumb-item">{$CONFIGURATION}</li>
                                        <li class="breadcrumb-item">{$AVATARS}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        {include file='includes/update.tpl'}
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-xl-6">
                            <div class="card">
                                <div class="card-header">{$L_AVATAR_SETTINGS}</div>
                                <div class="card-body">
                                    <form action="" method="post">
                                        <input type="hidden" name="token" value="{$TOKEN}">
                                        <div class="form-group">
                                            <label for="inputDefaultAvatar">{$DEFAULT_AVATAR}</label>
                                            <select class="form-select Xselect" name="default_avatar" id="inputDefaultAvatar" onchange="this.form.submit()">
                                                <option value="minecraft" {if $DEFAULT_AVATAR_VALUE eq "minecraft" } selected{/if}>{$MINECRAFT_AVATAR}</option>
                                                <option value="custom" {if $DEFAULT_AVATAR_VALUE eq "custom" } selected{/if}>{$CUSTOM_AVATAR}</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputMinecraftAvatarSource">{$MINECRAFT_AVATAR_SOURCE}</label>
                                            <select class="form-select Xselect" name="avatar_source" id="inputMinecraftAvatarSource" onchange="this.form.submit()">
                                                {foreach from=$MINECRAFT_AVATAR_VALUES key=name item=url}
                                                    <option value="{$name}" {if $name eq $MINECRAFT_AVATAR_VALUE} selected{/if}>{$url}</option>
                                                {/foreach}
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputAvatarPerspective">{$MINECRAFT_AVATAR_PERSPECTIVE}</label>
                                            <select class="form-select Xselect" name="avatar_perspective" id="inputAvatarPerspective" onchange="this.form.submit()"></select>
                                        </div>
                                        <div class="d-flex">
                                            <input class="form-check form-switch" type="checkbox" id="inputCustomAvatars" name="custom_avatars" switch="success" value="1" {if $CUSTOM_AVATARS_VALUE eq 1} checked{/if} onchange="this.form.submit()">
                                            <label class="form-label" for="inputCustomAvatars" data-on-label="{$L_YES}" data-off-label="{$L_NO}"></label>
                                            <label for="inputCustomAvatars"> &nbsp;{$CUSTOM_AVATARS}</label>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-12 col-xl-6">
                            <div class="card">
                                <div class="card-header">{$DEFAULT_AVATAR}</div>
                                <div class="card-body">
                                {if count($IMAGES)}
                                    <form action="" method="post">
                                    <input type="hidden" name="token" value="{$TOKEN}">
                                        <div class="form-group">
                                            <label for="selectDefaultAvatar">{$SELECT_DEFAULT_AVATAR}</label>
                                            <select class="image-picker show-html" id="selectDefaultAvatar" name="avatar" onchange="this.form.submit()">
                                                {foreach from=$IMAGES key=key item=item}
                                                    <option data-img-src="{$key}" value="{$item}" {if $DEFAULT_AVATAR_IMAGE eq $item} selected{/if}>{$item}</option>
                                                {/foreach}
                                            </select>
                                        </div>
                                    </form>
                                {else}
                                    {$NO_AVATARS}
                                {/if}
                                <hr>
                                    <form action="{$UPLOAD_FORM_ACTION}" class="dropzone" id="upload_avatar_dropzone">
                                        <input type="hidden" name="token" value="{$TOKEN}">
                                        <input type="hidden" name="type" value="default_avatar">
                                        <div class="dz-message" data-dz-message>
                                            <span>{$DRAG_FILES_HERE}</span>
                                        </div>
                                    </form>
                                    <a href="#" class="btn btn-outline-primary btn-block btn-sm mt-1" onclick="location.reload();"><b>{$L_SAVE}</b></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {include file='footer.tpl'}
        </div>
    </div>
    <script>
        const perspective_selector = document.getElementById('inputAvatarPerspective');
        const source_selector = document.getElementById('inputMinecraftAvatarSource');
        source_selector.addEventListener('change', () => reloadPerspectives(source_selector.value));

        document.onLoad = reloadPerspectives(source_selector.value, true);

        function reloadPerspectives(source, firstLoad = false) {
            removeOptions(perspective_selector);
            {foreach $MINECRAFT_AVATAR_PERSPECTIVE_VALUES key=source item=perspectives}
                if ('{$source}' == source) {
                    {foreach $perspectives item=$perspective}
                        if (firstLoad) {
                            {if $perspective|strtolower eq $MINECRAFT_AVATAR_PERSPECTIVE_VALUE|strtolower}
                                option = new Option('{$perspective|ucfirst}', '{$perspective|ucfirst}', true, true);
                                perspective_selector.add(option, undefined);
                            {else}
                                option = new Option('{$perspective|ucfirst}', '{$perspective|ucfirst}');
                                perspective_selector.add(option, undefined);
                            {/if}
                        } else {
                            option = new Option('{$perspective|ucfirst}', '{$perspective|ucfirst}');
                            perspective_selector.add(option, undefined);
                        }
                    {/foreach}
                }
            {/foreach}
        }

        function removeOptions(selectElement) {
        var i, L = selectElement.options.length - 1;
        for(i = L; i >= 0; i--) {
            selectElement.remove(i);
        }
        }
    </script>
    {include file='scripts.tpl'}
</body>
</html>