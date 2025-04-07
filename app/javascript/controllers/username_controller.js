import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "feedback"]

  check() {
    const username = this.inputTarget.value
    if (username.length < 3) {
      this.feedbackTarget.innerText = ""
      return
    }

    fetch(`/username_check?username=${username}`)
      .then(response => response.json())
      .then(data => {
        if (data.available) {
          this.feedbackTarget.innerHTML = `✅ <strong>${data.username}</strong> is available`
        } else {
          this.feedbackTarget.innerHTML = `❌ Taken. Try <strong>${data.suggestion}</strong>`
        }
      })
  }
}
