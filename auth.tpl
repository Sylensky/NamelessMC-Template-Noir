{include file='header.tpl'}

<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-4 col-lg-6 col-md-8">
                {if isset($ERROR)}
                    <div class="card-header bg-danger text-white text-center mt-5">{$ERROR}</div>
                {/if}
                <div class="card my-5">
                    <div class="card-body p-4">
                        <div class="">
                            <h4 class="font-size-18 text-muted mt-2 mb-4 text-center">{$PLEASE_REAUTHENTICATE}</h4>
                            <form class="form-horizontal user" action="" method="post">
                            <input type="hidden" name="token" value="{$TOKEN}">
                                <div class="row">
                                    <div class="col-md-12">
                                        {if isset($EMAIL)}
                                        <div class="mb-4">
                                            <label class="form-label" for="email">{$EMAIL}</label>
                                            <input type="email" name="email" id="email" autocomplete="off" class="form-control" placeholder="{$EMAIL}">
                                        </div>
                                        {else}
                                        <div class="mb-4">
                                            <label class="form-label" for="username">{$USERNAME}</label>
                                            <input type="text" name="username" id="username" autocomplete="off" class="form-control" placeholder="{$USERNAME}">
                                        </div>
                                        {/if}
                                        <div class="mb-4">
                                            <label class="form-label" for="password">{$PASSWORD}</label>
                                            <input type="password" class="form-control" name="password" id="password" placeholder="{$PASSWORD}">
                                        </div>
                                        <div class="d-row mt-4">
                                            <button class="btn btn-outline-primary waves-effect waves-light" type="submit">{$SUBMIT}</button>
                                            <span class="float-right">
                                                <a class="btn btn-outline-warning waves-effect waves-light" href="{$SITE_HOME}">{$CANCEL}</a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {include file='scripts.tpl'}
</body>
</html>