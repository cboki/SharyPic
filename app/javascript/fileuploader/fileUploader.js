function fileUploader() {

 var myUploadWidget;
    document.getElementById("upload_widget_opener").addEventListener("click", function() {
        myUploadWidget = cloudinary.openUploadWidget({
                cloudName: "mmg420cloud",
                uploadPreset: "bp7yx9sg",
                //Step 3:  Add list of sources that should be added as tabs in the widget.
                sources: [
                    "local",
                    "camera"
                ],
                //UI Customization
                styles: {
                    palette: {
                        window: "#ffffff",
                        sourceBg: "#f4f4f4",
                        windowBorder: "#900808",
                        tabIcon: "#900808",
                        inactiveTabIcon: "#f9eded",
                        menuIcons: "#900808",
                        link: "#900808",
                        action: "#900808",
                        inProgress: "#900808",
                        complete: "#3ccc3c",
                        error: "#cc3333",
                        textDark: "#000000",
                        textLight: "#ffffff"
                    }
                },
                fonts: {
                    default: null,
                    "'Cute Font', cursive": "https://fonts.googleapis.com/css?family=Cute+Font",
                    "'Gamja Flower', cursive": "https://fonts.googleapis.com/css?family=Gamja+Flower|PT+Serif"
                }
            },
            function(error, result) {

                //Step 2.3:  Listen to 'success'

                if (result.event === "success") {
                  var data = new FormData;
                  data.append('photo[file]', result.info.secure_url);
                  fetch('/photos', {
                      method: "POST",
                      body: data,
                      headers: {
                        'X-CSRF-Token': Rails.csrfToken(),
                      },
                      credentials: 'same-origin'
                    })


                    //Step 2.4:  Call the .close() method in order to close the widget

                    myUploadWidget.close();
                }
            });
    }, false);

    //Step 2.2:  Call the .open() method in order to open the widget

}

export { fileUploader };
