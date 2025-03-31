import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["link"];

  connect() {
    this.updateActiveLink();
  }

  setActive(event) {
    this.linkTargets.forEach((link) => link.classList.remove("bg-yellow-500"));
    event.currentTarget.classList.add("bg-yellow-500");
    localStorage.setItem("activeSidebarLink", event.currentTarget.dataset.path);
  }

  updateActiveLink() {
    const activePath = localStorage.getItem("activeSidebarLink") || window.location.pathname;
    this.linkTargets.forEach((link) => {
      if (link.dataset.path === activePath) {
        link.classList.add("bg-yellow-500");
      } else {
        link.classList.remove("bg-yellow-500");
      }
    });
  }
}
