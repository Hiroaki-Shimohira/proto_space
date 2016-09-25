# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.addEventListener( 'load', ->
  for num in [1..4]
    do (num) ->
      document.getElementById( 'file' + num ).addEventListener( 'change', ->
        fileList = this.files
        type = fileList.type
        i = 0
        fileReader = new FileReader()
        fileReader.onload = ->
          document.getElementById( 'js-pre-image' + num ).src = this.result;
        fileReader.readAsDataURL( fileList[ i ] );
      );
);
