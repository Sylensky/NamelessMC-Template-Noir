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

                <!-- Success and Error Alerts -->
                {include file='includes/alerts.tpl'}

                <div class="card shadow mb-4">
                    <div class="card-body">
                        <form action="/panel/socialize/posts" method="post">
                            <div class="form-group">
                                <label for="search">{$LANG.posts_search}</label>
                                <input type="text" class="form-control" id="search" name="search" placeholder="{$LANG.username}">
                            </div>

                            <div class="form-group">
                                <input type="hidden" name="token" value="afcae16e9c1adb5db78c3fc67af5f26b">
                                <input type="submit" class="btn btn-primary" value="Submit">
                            </div>
                        </form>
                    </div>
                </div>

                {if isset($SEARCHING_FOR) && $SEARCHING_FOR != 0}
                  <h1 class="h4 mb-0 text-gray-800">Searching for all posts by: <b>{$SEARCHING_FOR}</b> </h1>
                  <br>
                {/if}

               {if $POSTS != null && count($POSTS)}
                  {foreach from=$POSTS item=item}
                  <div class="card shadow mb-4 border-left-primary">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="font-weight-bold text-primary" style="margin-right: auto;"><a style="font-size:16px;{$item.authorStyle};" href="/profile/{$item.authorUsername}/">
                              <img class="ui circular image" src="{$item.authorAvatar}" style="width:32px;margin-right:4px;border-radius:6px;">{$item.authorUsername}</a> | {$item.timeAgo}
                            </h6>
                        </div>
                        <div class="card-body">
                            <p>{$item.content}</p>
                            {$totalImages=0}
                            {foreach from=$item.images item=image}
                              {if $totalImages >= 2}
                              <br />
                                <a href="/socialize/post?id={$item.id}">
                                  <div class="ui message">
                                    <p>This post has total of <b>{count($item.images)}</b> media content. Click here to see all!</p>
                                  </div>
                                </a>
                                {break}
                              {/if}
                              {if $image.ext != 'mp4'}
                                <img class="mediaFile" style="max-width:25%;border-radius:4px;" src="{$image.url_media}{$image.normal_name}{$image.ext}" alt=""><br>
                              {else}
                                <video class="mediaFile" loop="true" controls muted style="max-width:25%;border-radius:4px;">
                                 <source src="{$image.url_media}{$image.normal_name}{$image.ext}" type="video/mp4">
                                   Your browser does not support the video tag.
                                </video><br>
                              {/if}
                              {$totalImages=$totalImages+1}
                            {/foreach}
                            <br />
                            <a target="_blank" href="/socialize/post?id={$item.id}" onclick="return 0;" class="btn btn-info btn-icon-split">
                                <span class="icon text-white-50">
                                    <i class="fas fa-heart"></i>
                                </span>
                                <span class="text">{$item.likesCount}</span>
                            </a>
                            <a target="_blank" href="/socialize/post?id={$item.id}" onclick="return 0;" class="btn btn-info btn-icon-split">
                                <span class="icon text-white-50">
                                    <i class="far fa-comment-dots"></i>
                                </span>
                                <span class="text">{$item.commentsCount}</span>
                            </a>
                            <a target="_blank" href="/socialize/post?id={$item.id}" onclick="return 0;" class="btn btn-info btn-icon-split">
                                <span class="icon text-white-50">
                                    <i class="fas fa-eye"></i>
                                </span>
                            </a>
                            <a href="/panel/socialize/posts?delete=true&id={$item.id}" class="btn btn-danger btn-icon-split">
                              <span class="icon text-white-50">
                                  <i class="fas fa-trash"></i>
                              </span>
                          </a>
                        </div>
                    </div>

                  {/foreach}
                  <br>

                  {if {$PAGE_LOAD_MORE} == true}
                    <a href="/panel/socialize/posts?page={$PAGE}" class="btn btn-facebook btn-block"><i class="fas fa-angle-double-right"></i> Next page</a>
                  {/if}

                {else}

                <div class="card shadow border-left-primary">
                    <div class="card-body">
                        <h5><i class="icon fa fa-info-circle"></i> {$LANG.warning_no_posts_found_title}</h5>
                        {$LANG.warning_no_posts_found_desc}
                    </div>
                </div>
                {/if}
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
