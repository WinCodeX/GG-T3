import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "step", "recipientName", "recipientPhone", "senderAgent", "deliveryType",
    "location", "receiverAgent", "courier", "destination",
    "doorFields", "agentFields", "parcelFields"
  ]

  static values = { step: Number }

  connect() {
    this.hideAllSteps()
    this.showStep(this.stepValue || 1)
  }

  open() {
    this.element.classList.remove("hidden")
    this.stepValue = 1
    this.showStep(this.stepValue)
  }

  close() {
    this.element.classList.add("hidden")
  }

  next() {
    if (this.stepValue < this.stepTargets.length) {
      this.stepValue++
      this.showStep(this.stepValue)
    }
  }

  back() {
    if (this.stepValue > 1) {
      this.stepValue--
      this.showStep(this.stepValue)
    }
  }

  showStep(step) {
    this.hideAllSteps()
    const target = this.stepTargets.find(s => s.dataset.step === step.toString())
    if (target) target.classList.remove("hidden")
  }

  hideAllSteps() {
    this.stepTargets.forEach(el => el.classList.add("hidden"))
  }

  selectType(event) {
    const value = event.target.value

    this.doorFieldsTarget.classList.add("hidden")
    this.agentFieldsTarget.classList.add("hidden")
    this.parcelFieldsTarget.classList.add("hidden")

    if (value === "door") {
      this.doorFieldsTarget.classList.remove("hidden")
    } else if (value === "agent") {
      this.agentFieldsTarget.classList.remove("hidden")
    } else if (value === "parcel") {
      this.parcelFieldsTarget.classList.remove("hidden")
    }
  }
}
