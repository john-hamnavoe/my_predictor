
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autosave"
export default class extends Controller {
  connect() {
    this.element.setAttribute("data-action", "change->autosave#submit")
  }

  submit() {
    let data = new FormData()
    data.append(this.element.name, this.value())

    // regular expression here to find the last value in [brackets] e.g. competition_entry[predictions_attributes][0][home_score] gives home_score
    // we replace that with "id" to see if have nested attributes autosaving as we need to send the id of the nested object
    let field_name_id  = this.element.name.replace(/[^\[\]]+(?!.*\[)/, 'id');
    if (document.getElementsByName(field_name_id).length == 1) {
      console.log("appending-id for " + field_name_id)
      data.append(field_name_id, document.getElementsByName(field_name_id)[0].value)
    }

    fetch(this.url(), {
      method: "PUT",
      headers: {
        Accept: "text/vnd.turbo-stream.html",
        "X-CSRF-Token": this.csrf_token()
      },
      redirect: "manual",
      body: data
    })
  }

  value() {
   // console.log(this.element.type)
    switch (this.element.type) {
      case "checkbox":
        return this.element.checked == true ? 1 : 0
      default: 
        return this.element.value
    }
  }

  url() {
    return this.element.form.action
  }

  csrf_token() {
    return document.head.querySelector('meta[name="csrf-token"]').getAttribute("content")
  }
}