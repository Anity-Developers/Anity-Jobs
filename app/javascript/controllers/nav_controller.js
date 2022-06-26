import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "toggler", "navContainer", "mobileNavContainer" ]

  connect() {
    console.log("nav controller connected")
  }

  toggleMenu() {
    this.navContainerTarget.classList.toggle("shadow")
    this.mobileNavContainerTarget.classList.toggle(["hidden"])
  }
}
