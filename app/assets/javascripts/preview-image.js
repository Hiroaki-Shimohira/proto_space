window.addEventListener( 'load', function() {
    for ( num = 1; num < 5; num++ ) {
        ( function( num ) { // 即時関数
            document.getElementById( 'file' + num ).addEventListener( 'change', function() {
                var fileList = this.files;
                var type = fileList.type;
                var i = 0;
                var fileReader = new FileReader();
                fileReader.onload = function() {
                    document.getElementById( 'js-pre-image' + num ).src = this.result;
                }
                fileReader.readAsDataURL( fileList[ i ] );
            } );
        } )( num ); // 即時関数
    }
} );
