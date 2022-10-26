import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['form', 'status', 'commit']

  connect() {
    console.log('connected')
    this.timeout = null
    this.duration = this.data.get('duration') || 1000
  }

  save() {
    clearTimeout(this.timeout)

    this.commitTarget.value = "1"
    this.timeout = setTimeout(() => {
      this.statusTarget.textContent = 'Saving...'
      Rails.fire(this.formTarget, 'submit')
      this.commitTarget.value = "0"
    }, this.duration)
  }
}