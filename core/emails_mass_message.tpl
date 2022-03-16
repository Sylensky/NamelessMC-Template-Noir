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
                                <h4 class="mb-sm-0">{$EMAILS_MASS_MESSAGE}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb float-sm-right">
                                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                        <li class="breadcrumb-item active">{$CONFIGURATION}</li>
                                        <li class="breadcrumb-item"><a href="{$BACK_LINK}">{$EMAILS}</a></li>
                                        <li class="breadcrumb-item active">{$EMAILS_MASS_MESSAGE}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        {include file='includes/update.tpl'}
                    </div>
                    <form action="" method="post">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <div class="card">
                        <div class="card-body">
                            <div class="form-group">
                                <label for="inputSubject">{$SUBJECT}</label>
                                <input class="form-control" type="text" name="subject" id="inputSubject">
                            </div>
                            <div class="form-group">
                                <label for="inputContent">{$CONTENT}
                                    <i class="fas fa-question-circle text-info" data-container="body" data-toggle="popover" data-placement="top" data-content="{$REPLACEMENT_INFO}"></i>
                                </label>
                                {if isset($MARKDOWN)}
                                <div class="field">
                                    <textarea name="content" id="markdown"></textarea>
                                </div>
                                {else}
                                <div class="field">
                                    <textarea name="content" id="EmailMassMessage"></textarea>
                                </div>
                                {/if}
                            </div>
                        </div>
                        <div class="card-footer">
                            <input type="submit" class="btn btn-primary btn-sm" value="Send" onclick="$('#loading').css('visibility', 'visible');">
                            <span class="float-end">
                                <a href="{$BACK_LINK}" data-toggle="tooltip" data-placement="top" title="{$BACK}"><i class="fas fa-arrow-left"></i></a>
                            </span>
                        </div>
                    </div><br>
                    <div class="alert alert-info text-center" id="loading" style="visibility:hidden;">
                        {$LOADING}
                    </div>
                    </form>
                </div>
            </div>
            {include file='footer.tpl'}
        </div>
    </div>
    {include file='scripts.tpl'}
    <script>
    ClassicEditor
        .create(document.querySelector('#EmailMassMessage'), {
            toolbar: ['bold', 'italic', 'strikethrough', '|', 'fontColor', 'fontSize', '|', 'bulletedList', 'numberedList']
        })
        .catch(error => {
            console.log(error);
        });
    </script>
</body>
</html>