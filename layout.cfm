<cfimport prefix="mango" taglib="../../tags/mango" />
<cfimport prefix="mangox" taglib="../../tags/mangoextras" />
<cfimport prefix="template" taglib="." />
<cfimport prefix="cms" taglib="assets/customtags" />

<cfif thisTag.executionMode eq "start">

	<cfparam name="attributes.sidebar" default="true" />

	<cfsavecontent variable="variables.basepath"><mango:Blog basePath /></cfsavecontent>
	<cfset variables.basePath = trim(variables.basePath) />

	<cfsavecontent variable="variables.blogUrl"><mango:Blog url /></cfsavecontent>
	<cfparam name="attributes.socialURL" default="#trim(variables.blogUrl)#" />

	<cfsavecontent variable="variables.skinurl"><mango:Blog skinurl /></cfsavecontent>
	<cfset variables.skinurl = trim(variables.skinurl) />

	<cfsavecontent variable="variables.defaultTitle"><mango:Blog title /></cfsavecontent>
	<cfparam name="attributes.title" default="#variables.defaultTitle#" />

	<cfsavecontent variable="variables.tagline"><mango:Blog tagline /></cfsavecontent>
	<cfset variables.tagline = trim(variables.tagline) />

	<cfsavecontent variable="variables.rssurl"><mango:Blog rssurl /></cfsavecontent>
	<cfset variables.rssurl = trim(variables.rssurl) />

	<cfsavecontent variable="variables.atomurl"><mango:Blog atomurl /></cfsavecontent>
	<cfset variables.atomurl = trim(variables.atomurl) />

	<cfsavecontent variable="variables.apiurl"><mango:Blog apiurl /></cfsavecontent>
	<cfset variables.apiurl = trim(variables.apiurl) />

	<cfsavecontent variable="variables.tmpsearch"><mango:Blog searchUrl /></cfsavecontent>
	<cfset variables.tmpsearch = trim(variables.tmpsearch) />

	<cfparam name="attributes.showHeaderImage" default="true" />
	<cfparam name="attributes.showFooter" default="true" />
	<cfparam name="attributes.fullscreenBG" default="false" />

	<cfparam name="attributes.postImage" default="[error: no post image]" />
	<cfparam name="attributes.postTitle" default="[error: no post title]" />
	<cfparam name="attributes.postByline" default="[error: no post byline]" />
	<cfparam name="attributes.postLink" default="" />

	<cfset variables.cssUrl = variables.skinurl & "assets/css" />
	<cfset variables.jsUrl = variables.skinurl & "assets/js" />

	<cfcontent reset="true" /><!DOCTYPE html>
	<html lang="en">
		<head>
			<cfoutput>
				<meta charset="utf-8" />
				<title>#attributes.title#</title>
				<meta name="viewport" content="width=device-width, initial-scale=1.0" />
				<meta name="description" content="#attributes.title#" />
				<meta name="author" content="CounterMarch Systems" />

				<!--[if lt IE 9]>
				<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
				<![endif]-->

				<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
				<!--- <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css"> --->
				<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:400,300,700,600" />
				<link href="#variables.cssUrl#/bundle.min.css" rel="stylesheet" />

				<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="#variables.rssurl#" />
				<link rel="alternate" type="application/atom+xml" title="Atom" href="#variables.atomurl#" />
				<link rel="EditURI" type="application/rsd+xml" title="RSD" href="#variables.apiurl#" />

				<meta property="og:site_name" content="CounterMarch Systems Blog"/>
				<meta property="og:url" content="#attributes.socialURL#"/>
				<meta property="og:title" content="#attributes.title#"/>
				<meta property="og:type" content="blog"/>
				<meta property="og:description" content="#attributes.title#"/>

				<mango:Event name="beforeHtmlHeadEnd" />
			</cfoutput>
		</head>
		<body id="top">

			<mango:Event name="beforeHtmlBodyStart" />

			<cfif attributes.fullscreenBG>
				<div id="archives-bg">
					<div class="bg-normal"></div>
					<div class="bg-blur"></div>
				</div>
			</cfif>

			<cfif attributes.showHeaderImage>
				<div class="bg">
					<div class="bg-normal" style="background-image:url(<cfoutput>#attributes.postImage#</cfoutput>)"></div>
					<div class="bg-blur" style="background-image:url(<cfoutput>#attributes.postImage#</cfoutput>)"></div>
				</div>

				<header>
					<div class="slogan-holder">
						<cfoutput>
							<h2>#attributes.postTitle#</h2>
							<h4>
								#attributes.postByline#
								<br/><a href="#attributes.postLink#">permanent link</a>
							</h4>
						</cfoutput>
					</div>
					<div class="nav-holder">
						<ul class="nav">
							<li><a class="blog-nav-item" href="http://www.alumniq.com">AlumnIQ Home</a></li>
							<li><a class="blog-nav-item active" href="http://blog.alumniq.com">Blog</a></li>
							<li><a class="blog-nav-item" href="http://www.alumniq.com/#about">About</a></li>
							<li><a class="blog-nav-item" href="http://www.alumniq.com/#features">Features</a></li>
						</ul>
					</div>
				</header>
			</cfif>

			<cfif !attributes.fullscreenBG><div class="wrapper"></cfif>
			<div class="container">
				<div class="row">
					<div class="col-sm-12 blog-main">
<cfelse>
					</div>
				</div>

			</div><!--- /container --->

			<cfif attributes.showFooter>
				<!--- bottom bar (in lieu of sidebar) --->
				<cfinclude template="sidebar.cfm" />
			</cfif>
		<cfif !attributes.fullscreenBG></div></cfif><!--- /wrapper --->

			<cfoutput>
				<cfif attributes.showFooter>
					<footer class="blog-footer">
						<p>Content Copyright &copy; #year(now())# CounterMarch Systems LLC</p>
					</footer>
				</cfif>

				<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
				<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
				<script src="#variables.skinurl#assets/shadowbox/shadowbox.js"></script>
				<script src="#variables.jsUrl#/CMS.js"></script>
				<script src="#variables.jsUrl#/60fps-scroll.js"></script>
			</cfoutput>

			<cms:htmlfoot output="true" />

			<mango:Event name="beforeHtmlBodyEnd" />

		</body>
	</html>
</cfif>
