<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">

<cfsavecontent variable="t"><mango:Message title /></cfsavecontent>

<template:layout showHeaderImage="false" title="#trim(t)# &bull; AlumnIQ Blog">
	<div class="post">
		<h1><mango:Message title /></h1>
		<p><mango:Message text /></p>
		<p><mango:Message data /></p>
	</div>
</template:layout>
