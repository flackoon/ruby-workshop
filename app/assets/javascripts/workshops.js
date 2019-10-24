$(document).ready(function() {
	$('[data-toggle="tooltip"]').tooltip();

	document.querySelector('.submit-comment-btn').onclick = () => {
		let content = document.querySelector('.comment-input').value;
		let workshop_id = document.querySelector('.card').getAttribute('data-workshop-id');

		window.fetch('/comments', {
			method: 'post',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({ 
				content,
				workshop_id
			})
		})
		.then(result => {
			console.log(result);
		})
	}
});