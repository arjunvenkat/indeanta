//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


function uploadAttachment(attachment){
  var file = attachment.file;
  var form = new FormData;
  const token = document.getElementsByName(
    "csrf-token"
  )[0].content;
  form.append("Content-Type", file.type);
  form.append("photo[image_data]", file);
  var xhr = new XMLHttpRequest;
  xhr.open("POST", "/photos.json", true);

  xhr.setRequestHeader("X-CSRF-Token", token)
  xhr.upload.onprogress = function(event){
    var progress = event.loaded / event.total * 100;
    attachment.setUploadProgress(progress);
  }
  xhr.onload = function() {
    console.log(xhr.status == 201)
    if (xhr.status == 201) {
      var data = JSON.parse(xhr.responseText);
      console.log(data)
      $.get( data.url, function( photoData ) {
        console.log(photoData)
        alert( "Load was performed." );
        return attachment.setAttributes({
          url: photoData.image_url,
          href: photoData.image_url
        })
      });
      // return;
    }
  }
  return xhr.send(form)
}

document.addEventListener("trix-attachment-add", function(event){
  var attachment = event.attachment;
  if (attachment.file) {
    return uploadAttachment(attachment);
  }
})
