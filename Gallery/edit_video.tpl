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


						<div class="row mb-2">
							<div class="col-sm-6">
								<h1 class="m-0 text-dark">{$TITLE}</h1>
							</div>
						</div>
						<div class="float-end mr-sm-2">
							<button style="display:inline" class="btn btn btn-danger" type="button" data-toggle="modal"
								data-target="#delete_modal{$ID}">{$REMOVE} <i class="fas fa-trash fa-fw"></i></button>
							<a style="display:inline" href="{$BACK_LINK}" class="btn btn-warning">{$BACK}</a>
						</div>
					</div>


					<hr>

					{if isset($SUCCESS)}
						<div class="alert alert-success alert-dismissible">
							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h5><i class="icon fa fa-check"></i> {$SUCCESS_TITLE}</h5>
							{$SUCCESS}
						</div>
					{/if}

					{if isset($ERRORS) && count($ERRORS)}
						<div class="alert alert-danger alert-dismissible">
							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h5><i class="icon fas fa-exclamation-triangle"></i> {$ERRORS_TITLE}</h5>
							<ul>
								{foreach from=$ERRORS item=error}
									<li>{$error}</li>
								{/foreach}
							</ul>
						</div>
					{/if}

					<section class="content">

						<h4 class="text-center">{$ADD_VIDEO}</h4>

						<form action="" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label>{$ENABLED_GALLERY}</label>
								<div class="form-group">
									<select class="form-control mr-sm-2" name="display_gallery">

										<option {if $DISPLAY_GALLERY === 1} selected {/if} value="1">{$ENABLED}</option>
										<option {if $DISPLAY_GALLERY === 0} selected {/if} value="0">{$DISABLED}</option>

									</select>
								</div>
							</div>

							<div class="form-group">
								<label>{$NAME}</label>
								<input type="text" name="name" class="form-control" value="{$VIDEO_NAME}">
							</div>

							<div class="form-group">
								<label>{$DESC}</label>
								<textarea type="text" name="description" class="form-control">{$VIDEO_DESC}</textarea>
							</div>

							<label>{$CATEGORY}</label>
							<div class="form-group">
								<select class="form-control mr-sm-2" name="category">

									<option value="0">{$NO_CATEGORY}</option>
									{foreach from=$CATEGORY_LIST item=category}
										<option {if $category.id === $CATEGORY_ID} selected {/if} value="{$category.id}">{$category.name}
										</option>
									{/foreach}

								</select>
							</div>

							<div class="form-group">
								<label>{$URL}</label>
								<input type="text" name="video_code" class="form-control" value="https://youtu.be/{$VIDEO_CODE}">
							</div>

							<div class="form-group">
								<input type="hidden" name="id" value="{$ID}">
								<input type="hidden" name="token" value="{$TOKEN}">
								<input type="submit" class="btn btn-primary" value="{$SAVE}">
							</div>

						</form>


						<!-- Delete modal -->
						<div class="modal fade" id="delete_modal{$ID}" tabindex="-1" role="dialog">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h2 class="modal-title">{$ARE_YOU_SURE}</h2>
									</div>
									<div class="modal-body">
										<p>{$CONFIRM_DELETE}</p>
										<form action="" id="delete" method="post">
											<input type="hidden" name="token" value="{$TOKEN}">
											<input type="hidden" name="delete_video" value="{$ID}">
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-danger" data-dismiss="modal">{$NO}</button>
										<button type="submit" form="delete" class="btn btn-success">{$YES}</button>
									</div>
								</div>
							</div>
						</div>



					</section>
				</div>

			</div>

			{include file='footer.tpl'}


		</div>
	</div>

	{include file='scripts.tpl'}

</body>

</html>