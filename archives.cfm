<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">

<template:layout showHeaderImage="false" showFooter="false" fullscreenBG="true" title="Archives &bull; AlumnIQ Blog">

	<mango:Archive pageSize="100">

		<div id="archives-banner">
			<cfset archiveType = "" />
			<mango:ArchiveProperty ifIsType="category">
				<h1><mango:ArchiveProperty title /></h1>
				<p>All entries in this category</p>
				<cfset archiveType = "category" />
			</mango:ArchiveProperty>
			<mango:ArchiveProperty ifIsType="month">
				<h1><mango:ArchiveProperty title dateformat="mmmm yyyy" /></h1>
				<cfset archiveType = "month" />
			</mango:ArchiveProperty>
			<mango:ArchiveProperty ifIsType="day">
				<h1><mango:ArchiveProperty title dateformat="dd mmmm yyyy" /></h1>
				<cfset archiveType = "day" />
			</mango:ArchiveProperty>
			<mango:ArchiveProperty ifIsType="year">
				<h1><mango:ArchiveProperty title dateformat="yyyy" /></h1>
				<cfset archiveType = "year" />
			</mango:ArchiveProperty>
			<mango:ArchiveProperty ifIsType="search">
				<p>Search Results for:</p>
				<h1><mango:ArchiveProperty title format="escapedHtml" /></h1>
				<cfset archiveType = "search" />
			</mango:ArchiveProperty>
			<cfif archiveType eq "">
				<h1>Recent Posts</h1>
			</cfif>
		</div>

		<div id="archives">
			<mango:Posts count="100">
				<mango:Post>
					<cfsavecontent variable="variables.postDate"><mango:PostProperty date dateformat="yyyy-mm-dd" /> @ <mango:PostProperty time timeFormat="hh:MM" /></cfsavecontent>
					<div class="row margin-top-50">
						<div class="col-sm-7 col-sm-offset-3 archive-list-item">
							<img src="<mango:PostProperty customField="postImage-v1" />" style="float:left;margin-right:20px;max-width:100px;max-height:100px;width:100%" />
							<h3><a href="<mango:PostProperty link />" rel="bookmark" title="Permanent link to: <mango:PostProperty title />"><mango:PostProperty title /></a></h3>
							<p>By <mango:PostProperty author /> in <mango:Categories><mango:Category><mango:CategoryProperty title /></mango:Category></mango:Categories></p>
						</div>
					</div><!-- /row -->
				</mango:Post>
			</mango:Posts>
		</div>

		<div class="bottomFix"></div>
		<div id="archiveNav">
			<mango:ArchiveProperty ifHasPreviousPage>
				<a class="btn btn-lg btn-danger pull-right" href="<mango:ArchiveProperty link pageDifference='-1' />">Newer Entries <i class="glyphicon glyphicon glyphicon-arrow-right"></i></a>
			</mango:ArchiveProperty>
			<mango:ArchiveProperty ifHasNextPage>
				<a class="btn btn-lg btn-danger pull-left" href="<mango:ArchiveProperty link pageDifference='1' />"><i class="glyphicon glyphicon glyphicon-arrow-left"></i> Older Entries</a>
			</mango:ArchiveProperty>
		</div>

	</mango:Archive>
</template:layout>
