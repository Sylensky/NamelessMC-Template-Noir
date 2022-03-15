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
                            <h4 class="mb-sm-0">{$USERS}</h4>
                            <div class="page-title-right d-none d-sm-block">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item active">{$USER_MANAGEMENT}</li>
                                    <li class="breadcrumb-item active">{$USERS}</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                {include file='includes/update.tpl'}
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table-hover dataTables-users table table-striped dt-responsive" style="width:100%">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>{$USER}</th>
                                    <th>{$GROUP}</th>
                                    <th>{$REGISTERED}</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {include file='footer.tpl'}
    </div>
</div>
{include file='scripts.tpl'}
</body>
</html>