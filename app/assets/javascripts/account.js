(() => {
	setUpEditPageScripts = () => {
		if (!document.querySelector('.edit-profile-form')) return;
		
		document.querySelector('.open-file-upload').onclick = () => {
			document.querySelector('.picture-input').click()
		}
		
		document.querySelector('.picture-input').onchange = ev => this.readImageUpload(ev.target);
		
		readImageUpload = input => {
			if (input.files && input.files[0]) {
				let reader = new FileReader();
				reader.onload = e => setPicturePreview(e.target.result);
				reader.readAsDataURL(input.files[0]);
			}
		}
		
		setPicturePreview = image => document.querySelector('.picture-preview').src = image;
	}
	
	setUpEditPageScripts();
})();