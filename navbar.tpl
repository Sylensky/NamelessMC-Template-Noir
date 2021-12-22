<nav class="navbar navbar-expand navbar-light topbar mb-4 static-top shadow">
    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
    </button>
    <a href="{$SITE_HOME}" target="_blank" class="btn btn-primary" data-toggle="tooltip" title="{$VIEW_SITE}"><i class="far fa-eye"></i></a>
    <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                {if $NOTICES|count > 0}
                    <span class="badge badge-danger badge-counter">{$NOTICES|count}</span>
                {/if}
            </a>
            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                {if $NOTICES|count eq 0}
                    <span class="dropdown-item d-flex align-items-center">{$NO_NOTICES}</span>
                {else}
                    {foreach from=$NOTICES key=url item=notice}
                        <a href="{$url}" class="dropdown-item d-flex align-items-center" style="color:#6c757d!important">{$notice}</a>
                    {/foreach}
                {/if}
            </div>
        </li>
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link" href="{$LOGGED_IN_USER.panel_profile}">
                <img class="img-profile rounded-circle mr-2" src="{$LOGGED_IN_USER.avatar}" alt="{$LOGGED_IN_USER.username}">
                <span class="d-none d-lg-inline">{$LOGGED_IN_USER.nickname}</span>
            </a>
        </li>
    </ul>
</nav>