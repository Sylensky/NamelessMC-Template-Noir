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
                            <h4 class="mb-sm-0">{$PROFILE_FIELDS}</h4>
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item">{$CONFIGURATION}</li>
                                    <li class="breadcrumb-item">{$PROFILE_FIELDS}</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                {include file='includes/update.tpl'}
                <div class="row">
                   <div class="col-md-12 text-center">
                        <div class="input-group">
                        <input class="form-control text-center" type="text" id="SearchFields" onkeyup="Search_Fields()" placeholder="{$L_SEARCH_PROFILE_FIELDS}">
                            <div class="input-group-append">
                                <a href="{$NEW_FIELD_LINK}" class="btn btn-primary text-white">{$L_CREATE_NEW_FIELD}</a>
                            </div>
                        </div>
                        <hr>
                   </div>
                    {if count($FIELDS)}
                    {foreach from=$FIELDS item=field}
                    <div class="col-sm-12 col-md-12 col-xl-4 HI">
                        <div class="card">
                            <div class="card-header">
                                <span class="text-info SFields">{$field.name}</span>
                                <span class="float-end">
                                    <a class="btn btn-outline-warning btn-ssm" data-bs-toggle="tooltip" data-html="true" data-placement="top" title="Edit - <b>{$field.name}</b>" href="{$field.edit_link}"><i class="far fa-pen"></i></a>
                                </span>
                            </div>
                            <div class="card-body">
                                <b>Name</b> - {$field.name}<br>
                                <b>{$TYPE}</b> - <code>{$field.type}</code><br>
                                <hr>
                                {if $field.required eq 1}<i class="far fa-check-circle text-success"></i>{else}<i class="far fa-times-circle text-danger"></i>{/if} {$REQUIRED}<br>
                                {if $field.editable eq 1}<i class="far fa-check-circle text-success"></i>{else}<i class="far fa-times-circle text-danger"></i>{/if} {$EDITABLE}<br>
                                {if $field.public eq 1}<i class="far fa-check-circle text-success"></i>{else}<i class="far fa-times-circle text-danger"></i>{/if} {$PUBLIC}<br>
                                {if $field.forum_posts eq 1}<i class="far fa-check-circle text-success"></i>{else}<i class="far fa-times-circle text-danger"></i>{/if} {$FORUM_POSTS}<br>
                            </div>
                        </div>
                    </div>
                    {/foreach}
                    {else}
                    <div class="col-md-12 text-center">
                        <div class="text-warning">{$NO_FIELDS}</div>
                    </div>
                    {/if}
                </div>
            </div>
        </div>
        {include file='footer.tpl'}
    </div>
</div>
<script>
    function Search_Fields() {
        let input = document.getElementById('SearchFields').value
        input=input.toLowerCase();
        let x = document.getElementsByClassName('SFields');
        let A = document.getElementsByClassName('HI');
        for (i = 0; i < x.length; i++) {
            if (!x[i].innerHTML.toLowerCase().includes(input)) {
                A[i].style.display="none";
            }
            else {
                A[i].style.display="";
            }
        }
    }
    </script>
{include file='scripts.tpl'}
</body>
</html>