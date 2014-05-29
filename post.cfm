<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">

<cfsavecontent variable="variables.postImage"><mango:Post><mango:PostProperty customField="postImage-v1" /></mango:Post></cfsavecontent>
<cfsavecontent variable="variables.postTitle"><mango:Post><mango:PostProperty title /></mango:Post></cfsavecontent>
<cfsavecontent variable="variables.postByline"><mango:Post>By <mango:PostProperty author /> in <mango:Categories><mango:Category><mango:CategoryProperty title /></mango:Category></mango:Categories></mango:Post></cfsavecontent>
<cfsavecontent variable="variables.postLink"><mango:Post><mango:PostProperty link /></mango:Post></cfsavecontent>

<template:layout
	postImage="#trim(variables.postImage)#"
	postTitle="#trim(variables.postTitle)#"
	postByline="#trim(variables.postByline)#"
	postLink="#trim(variables.postLink)#">
		<mango:Post>
			<div class="post">
				<mango:PostProperty body />
				<mango:Event name="beforePostContentEnd" template="post" />

				<mango:PostProperty ifcommentsallowed>
					<section id="comments">
						<hr />

						<mango:PostProperty ifCommentCountGT="0">
							<h3><mango:PostProperty commentCount /> comment<mango:PostProperty ifCommentCountGT="1">s</mango:PostProperty>:</h3>
						</mango:PostProperty>
						<mango:PostProperty ifCommentCountLT="1">
							<h3 id="respond">Be the first to leave a comment:</h3>
						</mango:PostProperty>

						<mango:Comments>
							<mango:Comment>
								<div class="row comment" id="comment-<mango:CommentProperty id />">
									<div class="col-sm-3 meta" style="border-right: 1px solid #efefef">
										<cfsavecontent variable="tmpEmail"><mango:CommentProperty email /></cfsavecontent>
										<cfset variables.tmpEmail = lcase(hash(lcase(trim(variables.tmpEmail)))) />
										<mango:CommentProperty ifhasurl>
											<a class="gravatar" href="<mango:CommentProperty url />"><mangox:Gravatar size="60" class="img-thumbnail gravatar" /><br/><mango:CommentProperty name /></a>
										</mango:CommentProperty>
										<mango:CommentProperty ifNothasurl>
											<mangox:Gravatar size="60" class="img-thumbnail gravatar" />
											<br/>
											<mango:CommentProperty name />
										</mango:CommentProperty>
										<br/>
										<mango:CommentProperty date dateformat="yyyy-mm-dd" />
										<br/><mango:CommentProperty time />
										<a href="#comment-<mango:CommentProperty id />" title="Link to this comment"><i class="icon icon-link"></i></a>
									</div>
									<div class="col-sm-7">
										<mango:CommentProperty content />
									</div>
								</div>
							</mango:Comment>
						</mango:Comments>

						<article id="respond">
							<mango:PostProperty ifCommentCountGT="0">
								<h2>Your comment:</h2>
							</mango:PostProperty>
							<form method="post" role="form" action="#respond">
								<input name="action" value="addComment" type="hidden" />
								<input name="comment_post_id" value="<mango:PostProperty id />" type="hidden" />
								<input name="comment_parent" value="" type="hidden" />
								<mango:Message ifMessageExists type="comment" status="error">
									<p class="error bg-danger">There was a problem: <mango:Message text /></p>
								</mango:Message>
								<mango:Message ifMessageExists type="comment" status="success">
									<p class="message"><mango:Message text /></p>
								</mango:Message>
								<mango:AuthenticatedAuthor ifIsLoggedIn>

									<div class="alert alert-success">
										You are logged in as
										<mangox:Gravatar imgtag class="gravatar" size="30" />
										<strong><mango:AuthorProperty name /></strong>
									</div>
									<input type="hidden" name="comment_name" value="<mango:AuthorProperty name />" />
									<input type="hidden" name="comment_email" value="<mango:AuthorProperty email />" />
									<input type="hidden" name="comment_website" value="<mango:Blog url />" />
								</mango:AuthenticatedAuthor>
								<mango:AuthenticatedAuthor ifNotIsLoggedIn>
									<div class="row">
										<div class="col-md-7">
											<p><input name="comment_name" class="form-control" value="" type="text" placeholder="Name (required)" /></p>
											<p><input name="comment_email" class="form-control" value="" type="email" placeholder="Email (required, not published)" /></p>
											<p><input name="comment_website" class="form-control" value="" type="url" placeholder="Website (optional, published)" /></p>
										</div>
										<div class="col-md-5">
											<p id="gravatar_preview" class="pull-right"></p>
										</div>
									</div>
								</mango:AuthenticatedAuthor>
								<div class="row">
									<div class="col-md-12">
										<textarea name="comment_content" class="resizable form-control" rows="10" placeholder="Your Comment"></textarea>
									</div>
								</div>
								<p><label><input id="subscribe" name="comment_subscribe" value="1" type="checkbox"> Email me when others comment</label></p>
								<p class="extra"><mango:Event name="beforeCommentFormEnd" /></p>
								<p><button class="btn btn-danger btn-lg"><i class="icon icon-comment-alt"></i> &nbsp;Submit Comment</button></p>
							</form>
						</article>
					</section>
				</mango:PostProperty><!-- /ifCommentsAllowed -->

			</div><!-- /post -->
		</mango:Post>
</template:layout>
