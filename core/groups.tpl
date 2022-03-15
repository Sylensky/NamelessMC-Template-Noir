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
                            <h4 class="mb-sm-0">{$GROUPS}</h4>
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                                    <li class="breadcrumb-item active">{$GROUPS}</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    {include file='includes/update.tpl'}
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <a class="btn btn-primary btn-sm" style="margin-bottom: 10px" href="{$NEW_GROUP_LINK}">{$NEW_GROUP}</a>
                                <span class="float-right">
                                    <a class="btn btn-primary btn-sm" style="margin-bottom: 10px" href="{$GROUP_SYNC_LINK}"><i class="far fa-external-link-alt"></i> {$GROUP_SYNC}</a>
                                </span>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>{$ORDER}</th>
                                                <th>{$GROUP_ID}</th>
                                                <th>{$NAME}</th>
                                                <th>{$USERS}</th>
                                                <th>{$STAFF}</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="sortable">
                                        {foreach from=$GROUP_LIST item=group}
                                            <tr data-id="{$group.id}">
                                                <td>{$group.order}</td>
                                                <td>{$group.id}</td>
                                                <td><a href="{$group.edit_link}">{$group.name}</a></td>
                                                <td>{$group.users}</td>
                                                <td>{if $group.staff}
                                                        <i class="far fa-check-circle text-success"></i>
                                                    {else}
                                                        <i class="far fa-times-circle text-danger"></i>
                                                    {/if}
                                                </td>
                                                <td>
                                                    <div class="float-md-right">
                                                        <div class="btn btn-outline-info btn-sm"><i class="far fa-arrows-alt"></i></div>
                                                        <a href="{$group.edit_link}" class="btn btn-outline-warning btn-sm"><i class="far fa-edit fa-fw"></i></a>
                                                    </div>
                                                </td>
                                            </tr>
                                        {/foreach}
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {include file='footer.tpl'}
    </div>
</div>
{include file='scripts.tpl'}
<script type="text/javascript">
  $(document).ready(function () {
    $("#sortable").sortable({
      start: function (event, ui) {
        let start_pos = ui.item.index();
        ui.item.data('startPos', start_pos);
      },
      update: function (event, ui) {
        let groups = $("#sortable").children();
        let toSubmit = [];
        groups.each(function () {
          toSubmit.push($(this).data().id);
        });

        $.ajax({
          url: "{$REORDER_DRAG_URL}",
          type: "POST",
          data: {
            token: "{$TOKEN}",
            {literal}groups: JSON.stringify({"groups": toSubmit}){/literal}
          },
          success: function (response) {
            // Success
          },
          error: function (xhr) {
            // Error
            console.log(xhr);
          }
        });
      }
    });
  });
</script>
</body>
</html>