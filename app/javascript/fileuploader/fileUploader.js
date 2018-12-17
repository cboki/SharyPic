function fileUploader() {

 var myUploadWidget;

     if (document.getElementById("upload_widget_opener"))
          document.addEventListener("DOMContentLoaded", function() {
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
                  .then((resp) => resp.json())
                  .then(function(response) {
                    myUploadWidget.close();
                    window.location.replace(`/events/${response.event_id}`);
                  })
                }
            });
    }, false);
}

export { fileUploader };

