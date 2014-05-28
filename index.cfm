<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">

<cfsavecontent variable="variables.postImage"><mango:Posts count="1"><mango:Post><mango:PostProperty customField="postImage-v1" /></mango:Post></mango:Posts></cfsavecontent>
<cfsavecontent variable="variables.postTitle"><mango:Posts count="1"><mango:Post><mango:PostProperty title /></mango:Post></mango:Posts></cfsavecontent>
<cfsavecontent variable="variables.postByline"><mango:Posts count="1"><mango:Post>By <mango:PostProperty author /> in <mango:Categories><mango:Category><mango:CategoryProperty title /></mango:Category></mango:Categories></mango:Post></mango:Posts></cfsavecontent>
<cfsavecontent variable="variables.postLink"><mango:Posts count="1"><mango:Post><mango:PostProperty link /></mango:Post></mango:Posts></cfsavecontent>

<template:layout
	postImage="#trim(variables.postImage)#"
	postTitle="#trim(variables.postTitle)#"
	postByline="#trim(variables.postByline)#"
	postLink="#trim(variables.postLink)#">
		<mango:Posts count="1">
			<mango:Post>
				<div class="post">
					<mango:PostProperty body />
					<mango:Event name="beforePostContentEnd" template="index" mode="excerpt" />
				</div><!-- /post -->
			</mango:Post>
		</mango:Posts>

		<!--- save the next post title for use in the button --->
		<mango:Posts count="2">
			<mango:Post>
				<cfsavecontent variable="variables.nextTitle"><mango:PostProperty title /></cfsavecontent>
			</mango:Post>
		</mango:Posts>

		<mango:Archive pageSize="1">
			<div class="row">
				<div id="col-md-12">
					<mango:ArchiveProperty ifHasNextPage>
						<a class="btn btn-lg btn-danger pull-left" href="<mango:ArchiveProperty link pageDifference='1' />"
						><i class="glyphicon glyphicon-arrow-left"></i> Previous: <cfoutput>#trim(variables.nextTitle)#</cfoutput></a>
					</mango:ArchiveProperty>
				</div>
			</div>
		</mango:Archive>
</template:layout>
