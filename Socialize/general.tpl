{include file='header.tpl'}

<body id="page-top">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    {include file='sidebar.tpl'}

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main content -->
        <div id="content">

            <!-- Topbar -->
            {include file='navbar.tpl'}

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">{$SOCIALIZE_SETTINGS}</h1>
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                        <li class="breadcrumb-item active">{$SOCIALIZE_MP}</li>
                        <li class="breadcrumb-item active">{$GENERAL_SETTINGS}</li>
                    </ol>
                </div>

                <!-- Update Notification -->
                {include file='includes/update.tpl'}

                <div class="card shadow mb-4">
                    <div class="card-body">

                        <!-- Success and Error Alerts -->
                        {include file='includes/alerts.tpl'}
                        {if isset($SUCCESS_MESSAGE)}

                        {/if}
                        <form action="" method="post">
                          <div class="form-group">
                              <div class="row">
                                  <div class="col-md-6">
                                      <label for="inputSiteName">{$LANG.navbar_name}</label>
                                      <input type="text" class="form-control" id="socializeNBName" name="socializeNBName" placeholder="" value="{$NAVBAR_NAME}">
                                  </div>
                                  <div class="col-md-6">
                                      <label for="inputContactEmail">{$LANG.navbar_icon}</label>
                                      <br>
                                      {$LANG.navbar_icon_info}
                                  </div>
                              </div>
                          </div>
                            <div class="form-group">
                                <label for="link_location">{$LANG.post_content_type}</label>
                                <select class="form-control" id="socializePContent" name="socializePContent">
                                    <option value="1"{if $POST_CONTENT eq 1} selected{/if}>All</option>
                                    <option value="2"{if $POST_CONTENT eq 2} selected{/if}>Images only</option>
                                    <option value="3"{if $POST_CONTENT eq 3} selected{/if}>Video only</option>
                                    <option value="4"{if $POST_CONTENT eq 4} selected{/if}>Gif only</option>
                                    <option value="5"{if $POST_CONTENT eq 5} selected{/if}>Text only</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="socializeTrendingStatus">{$LANG.enable_trending}</label>
                                <input type="checkbox" name="socializeTrendingStatus" id="socializeTrendingStatus" class="js-switch" {if $TRENDING_STATUS} checked{/if} />
                            </div>
                            <div class="form-group">
                                <label for="socializeUserStatus">{$LANG.enable_user_stats}</label>
                                <input type="checkbox" name="socializeUserStatus" id="socializeUserStatus" class="js-switch" {if $USER_STATS_STATUS} checked{/if} />
                            </div>
                            <div class="form-group">
                                <label for="socializeTopUsersStatus">{$LANG.enable_top_users}</label>
                                <input type="checkbox" name="socializeTopUsersStatus" id="socializeTopUsersStatus" class="js-switch" {if $TOP_USERS_STATUS} checked{/if} />
                            </div>
                            <div class="form-group">
                                <label for="socializeChannelsStatus">{$LANG.enable_channels}</label>
                                <input type="checkbox" name="socializeChannelsStatus" id="socializeChannelsStatus" class="js-switch" {if $CHANNELS_STATUS} checked{/if} />
                            </div>
                            <div class="form-group">
                                <input type="hidden" name="token" value="{$TOKEN}">
                                <input type="submit" class="btn btn-primary" value="{$SUBMIT}" />
                            </div>
                        </form>

                    </div>
                </div>

                <!-- Spacing -->
                <div style="height:1rem;"></div>

                <!-- End Page Content -->
            </div>

            <!-- End Main Content -->
        </div>

        {include file='footer.tpl'}

        <!-- End Content Wrapper -->
    </div>

    <!-- End Wrapper -->
</div>

{include file='scripts.tpl'}
<script type="text/javascript">
  history.pushState({}, "", "")
</script>
</body>

</html>
