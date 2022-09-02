import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application


// TRY: 
// $(document).on("click", "#element", function(){
//   // do something here
// });

export { application }
