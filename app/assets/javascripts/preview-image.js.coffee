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