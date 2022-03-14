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
                                <h4 class="mb-sm-0">{$PRIVACY_AND_TERMS}</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                        <li class="breadcrumb-item active">{$CONFIGURATION}</li>
                                        <li class="breadcrumb-item active">{$PRIVACY_AND_TERMS}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        {include file='includes/update.tpl'}
                    </div>
                    <form class="row" action="" method="post">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <span class="font-size-22">{$PRIVACY_POLICY}</span>
                                </div>
                                <div class="card-body">
                                    <textarea style="width:100%" rows="10" name="privacy" id="InputPrivacy" onchange="this.form.submit()">{$PRIVACY_POLICY_VALUE}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <span class="font-size-22">{$TERMS_AND_CONDITIONS}</span>
                                </div>
                                <div class="card-body">
                                    <textarea style="width:100%" rows="10" name="terms" id="InputTerms" onchange="this.form.submit()">{$TERMS_AND_CONDITIONS_VALUE}</textarea>
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