function show_reply_box(id) {
	
	$("#comment-"+id).append("<% (render('users/follow')) %>");
}