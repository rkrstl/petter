document.addEventListener('DOMContentLoaded', function(){
  const ImageList = document.getElementById('image-list');
  document.getElementById('user_image').addEventListener('change',function(e){

    const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }
    const file=e.target.files[0];
    const blob=window.URL.createObjectURL(file);
   
    // 画像表示のためのdiv
    const imageElement = document.createElement('div');
    // 表示する画像
    const blobImage=document.createElement('img')
    blobImage.setAttribute('src', blob);

    imageElement.appendChild(blobImage);
    ImageList.appendChild(imageElement)
  });


});