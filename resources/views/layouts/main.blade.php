<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="robots" content="noindex">
    <meta name="csrf-token" content="{{ csrf_token() }}">
	<title>Metro City | Новостройки</title>
	<!-- <link rel="stylesheet" href="libs/bootstrap/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="fonts/icomoon/icon-font.css">
	<link rel="stylesheet" href="libs/animate/animate.min.css">
	<link rel="stylesheet" href="css/style.min.css" />
</head>

<body>

	<main class="main">

		<div class="container">

			<div class="page-top">

				<nav class="page-breadcrumb" itemprop="breadcrumb">
	<a href="/">Главная</a>
	<span class="breadcrumb-separator"> > </span>
	
	Новостройки
</nav>

				<div class="page-top__switchers">

					<div class="container">
						<div class="row">

							<div class="page-top__switchers-inner">

								<a href="#" class="page-top__filter">
									<span class="icon-filter"></span>
									Фильтры
								</a>

								<a href="#" data-tab-name="loop" class="page-top__switcher tab-nav active">
									<span class="icon-grid"></span>
								</a>

								<a href="#" data-tab-name="map" class="page-top__switcher tab-nav">
									<span class="icon-marker"></span>
								</a>

							</div>

						</div>
					</div>

				</div>

			</div>

			<div class="page-section">
                @yield('content')

			</div>

		</div>

	</main>

	<!-- <footer style="height: 500px; background-color: #fff;"></footer> -->

	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<script src="libs/bootstrap/js/popper.min.js"></script>
	<script src="libs/bootstrap/js/bootstrap.min.js"></script>
	<script src="libs/ofi/ofi.min.js"></script>
	<script src="libs/wowjs/wow.min.js"></script>
	<script src="js/scripts.js"></script>
    @stack('script')

</body>

</html>