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
					<div class="d-sm-flex align-items-center justify-content-between mb-4>


						<div class=" row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0 text-dark">{$TITLE}</h1>
						</div>
						<div class="float-md-right mr-sm-2">
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

						<h4 class="text-center">{$EDIT_IMAGES}</h4>

						<form action="" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label>{$ENABLED_GALLERY}</label>
								<div class="form-group">
									<select class="form-control mr-sm-2" name="display_gallery">

										<option value="1">{$ENABLED}</option>
										<option value="0">{$DISABLED}</option>

									</select>
								</div>


							</div>

							<label>{$CATEGORY}</label>
							<div class="form-group">
								<select class="form-control mr-sm-2" name="category">

									<option value="0">{$NO_CATEGORY}</option>
									{foreach from=$CATEGORY_LIST item=category}
									<option value="{$category.id}">{$category.name}</option>
									{/foreach}

								</select>
							</div>

							<div class="form-group">
								<label for="uploadFileButton">{$IMG_DOWNLOAD}</label>
								<div class="custom-file">
									<input type="file" name="resourceFile" class="custom-file-input" id="uploadFileButton"
										accept="image/*" onchange="$('#uploadFileName').html(this.files[0].name)">
									<label for="uploadFileButton" class="custom-file-label" id="uploadFileName"></label>
								</div>
							</div>

							<h4 class="text-center">{$CAROUSEL_IMG_SETTINGS}</h4>


							<div class="form-group">
								<label>{$ENABLED_CAROUSEL}</label>
								<div class="form-group">
									<select class="form-control mr-sm-2" name="display_carousel">

										<option value="1">{$ENABLED}</option>
										<option value="0">{$DISABLED}</option>

									</select>
								</div>
							</div>


							<div class="form-group">
								<label>{$CAROUSEL_HEAD_LABEL}</label>
								<input type="text" name="carousel_head" class="form-control" value="{$CAROUSEL_HEAD}">
							</div>

							<label>{$HEAD_COLOR_CAROUSEL}</label>
							<div class="form-group">
								<select class="form-control mr-sm-2" name="carousel_head_color">

									<option class="text-primary" value="text-primary">text-primary</option>
									<option class="text-secondary" value="text-secondary">text-secondary</option>
									<option class="text-success" } value="text-success">text-success</option>
									<option class="text-danger" value="text-danger">text-danger</option>
									<option class="text-warning" value="text-warning">text-warning</option>
									<option class="text-info" value="text-info">text-info</option>
									<option class="text-light" value="text-light">text-light</option>
									<option class="text-dark" value="text-dark">text-dark</option>
									<option class="text-muted" value="text-muted">text-muted</option>
									<option class="text-white" value="text-white">text-white</option>


								</select>
							</div>


							<div class="form-group">
								<label>{$CAROUSEL_TITLE_LABEL}</label>
								<textarea type="text" name="carousel_title" class="form-control"></textarea>
							</div>

							<label>{$TITLE_COLOR_CAROUSEL}</label>
							<div class="form-group">
								<select class="form-control mr-sm-2" name="carousel_title_color">

									<option class="text-primary" value="text-primary">text-primary</option>
									<option class="text-secondary" value="text-secondary">text-secondary</option>
									<option class="text-success" } value="text-success">text-success</option>
									<option class="text-danger" value="text-danger">text-danger</option>
									<option class="text-warning" value="text-warning">text-warning</option>
									<option class="text-info" value="text-info">text-info</option>
									<option class="text-light" value="text-light">text-light</option>
									<option class="text-dark" value="text-dark">text-dark</option>
									<option class="text-muted" value="text-muted">text-muted</option>
									<option class="text-white" value="text-white">text-white</option>

								</select>
							</div>

							<div class="form-group">
								<input type="hidden" name="token" value="{$TOKEN}">
								<input type="submit" class="btn btn-primary" value="{$SAVE}">
							</div>

						</form>




					</section>
				</div>

			</div>

			{include file='footer.tpl'}


		</div>
	</div>

	{include file='scripts.tpl'}

</body>

</html>