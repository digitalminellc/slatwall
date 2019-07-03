<cfoutput>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>#$.slatwall.getCurrentRequestSite().getSiteName()#</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="#request.slatwallScope.getBaseURL()#/org/Hibachi/HibachiAssets/js/jquery-ui.min.js"></script>

		<!--- This creates a client side object for Slatwall so that $.slatwall API works from the client side --->
		#$.slatwall.renderJSObject( subsystem="public" )#
		<style>
			[ng\:cloak],
			[ng-cloak],
			[data-ng-cloak],
			[x-ng-cloak],
			.ng-cloak,
			.x-ng-cloak {
				display: none !important;
			}
		</style>
		<script>
			var hibachiConfig = {
				action: 'slatAction',
				basePartialsPath: '/org/Hibachi/client/src/',
				customPartialsPath: '/custom/apps/#$.slatwall.getSite().getApp().getAppName()#/#$.slatwall.getSite().getSiteName()#/templates/partials/'
			};
		</script>
		<link href="#request.slatwallScope.getBaseURL()#/org/Hibachi/HibachiAssets/css/jquery-ui.min.css" rel="stylesheet">
		<link href="//stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
		<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

		<style media="screen">
			@media (min-width: 768px) {
				.card .collapse {
					display: block;
				}
			}
		</style>

	</head>

	<body ng-cloak>
		<cfinclude template="inc/globalAngularVariables.cfm" />
		
		<!--- Header Nav --->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container">
				<a class="navbar-brand" href="/">#$.slatwall.getCurrentRequestSite().getSiteName()#</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="##navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-end" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link" href="/product-listing/">Product Listing</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/shopping-cart/">Shopping Cart</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/checkout/">Checkout</a>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle col-xs-12" href="##" id="navbarDropdown" role="button" data-toggle="dropdown">
								Mini Cart <span ng-show="slatwall.cart.orderItems.length">{{slatwall.cart.orderItems.length}}</span>
							</a>
							<div class="dropdown-menu px-2">
								<cfinclude template="inc/header/minicart.cfm" />
							</div>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/my-account/" class="user-btn">My Account</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/" ng-show="slatwall.hasAccount() && slatwall.userIsLoggedIn()" ng-click="slatwall.doAction('logout')">Log out</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
</cfoutput>



