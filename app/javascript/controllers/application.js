import { Application } from "@hotwired/stimulus"
import Rails from "@rails/ujs"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application
window.Rails = Rails

export { application }
export { Rails }
