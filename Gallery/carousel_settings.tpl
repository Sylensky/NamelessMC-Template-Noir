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
						<div class="float-md-right">
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


					<section class="content">

						<h5 class="text-center">{$CAROUSEL_SETTINGS}</h5>

						<form action="" method="post">
							<div class="form-group">
								<label>{$CAROUSEL_ENABLE}</label>
								<select class="form-control mr-sm-2" name="car_enable">

									<option {if $ENABLE_VAR === 1} selected {/if} value="1">{$ENABLED}</option>
									<option {if $ENABLE_VAR === 2} selected {/if} value="2">{$DISABLED}</option>

								</select>
							</div>

							<div class="form-group">
								<label>{$CAROUSEL_PAGINATION}</label>
								<button type="button" class="btn btn-light btn-sm" data-toggle="tooltip" data-placement="top"
									title="{$PAGINATION_HELP}">
									<i class="fa fa-question-circle" aria-hidden="true"></i>
								</button>
								<select class="form-control mr-sm-2" name="car_pagination">

									<option {if $PAGINATION_VAR === 1} selected {/if} value="1">{$ENABLED}</option>
									<option {if $PAGINATION_VAR === 2} selected {/if} value="2">{$DISABLED}</option>

								</select>
							</div>

							<div class="form-group">
								<label>{$SORT}</label>
								<select class="form-control mr-sm-2" name="car_sort">

									<option {if $SORT_VAR === 1} selected {/if} value="1">{$DESC}</option>
									<option {if $SORT_VAR === 2} selected {/if} value="2">{$ASC}</option>

								</select>
							</div>

							<div class="form-group">
								<label>{$CAROUSEL_STYLE}</label>
								<select class="form-control mr-sm-2" name="car_style">

									<option {if $STYLE_VAR === 1} selected {/if} value="1">{$FULL_ING_STYLE}</option>
									<option {if $STYLE_VAR === 2} selected {/if} value="2">{$BOOTSTRAP_STYLE}</option>

								</select>
							</div>

							<div class="form-group">
								<label>{$INDICATORS}</label>
								<select class="form-control mr-sm-2" name="car_indicator">

									<option {if $INDICATOR_VAR === 1} selected {/if} value="1">{$ENABLED}</option>
									<option {if $INDICATOR_VAR === 2} selected {/if} value="2">{$DISABLED}</option>

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


	<!-- ./wrapper -->

	{include file='scripts.tpl'}


</body>

</html>