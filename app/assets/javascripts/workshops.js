$(document).ready(function () {
	if (document.querySelectorAll('.workshop-details-page')) {
		$('[data-toggle="tooltip"]').tooltip();

		if (document.querySelector('.comment-input-holder > textarea')) {

			document.querySelector('.comment-input-holder > textarea').onkeydown = ev => {
				if (ev.keyCode === 13)
					document.querySelector('.submit-comment-btn').click();
			}

			document.querySelector('.submit-comment-btn').onclick = () => {
				let content = document.querySelector('.comment-input').value;
				let workshop_id = document.querySelector('.card').getAttribute('data-workshop-id');

				if (!content)
					return alert('You cannot submit an empty comment!');

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
				.then(res => res.json())
				.then(data => displayNewComment(data));
			}
		}

		displayNewComment = comment => {
			let commentElement = document.createElement('div');
			['toast', 'show', 'comment'].forEach(className => commentElement.classList.add(className));

			let header = document.createElement('div');
			header.classList.add('toast-header');

			let picture = document.createElement('img');
			['rounded', 'comment-avatar'].forEach(className => picture.classList.add(className));
			picture.setAttribute('src', `/assets/${comment.user_avatar}`);
			picture.setAttribute('alt', 'Profile picture');

			let email = document.createElement('strong');
			email.classList.add('mr-auto');
			email.innerHTML = comment.user_email;

			let date = document.createElement('small');
			date.innerHTML = comment.created_at;

			let content = document.createElement('div');
			content.classList.add('toast-body');
			content.innerHTML = comment.content;

			[picture, email, date].forEach(el => header.appendChild(el));
			[header, content].forEach(el => commentElement.appendChild(el));

			let commentInput = document.querySelector('.comment-input-holder');
			commentInput.parentNode.insertBefore(commentElement, commentInput.nextSibling);

			commentInput.querySelector('textarea').value = '';
		}
	}
});