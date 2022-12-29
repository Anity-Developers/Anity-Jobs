import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['elapsedTime'];

  connect() {
    this.startTime = Date.now();
    requestAnimationFrame(() => this.updateElapsedTime());
  }

  updateElapsedTime() {
    this.elapsedTimeTarget.textContent = Math.round((Date.now() - this.startTime) / 1000);
    let job_id = window.location.href.split("/").pop();
    console.log(this.elapsedTimeTarget.textContent);

    var elapsedTime = this.elapsedTimeTarget.textContent;
    if (elapsedTime > 10 ) {
      console.log("you have spend 15 seconds on this page");
      var xhr = new XMLHttpRequest();
      xhr.open('POST', `/track_time/${job_id}`, true);
      xhr.setRequestHeader('Content-Type', 'application/json');
      xhr.send(JSON.stringify({ elapsedTime: elapsedTime }));
      xhr.setRequestHeader
    } else {
      requestAnimationFrame(() => this.updateElapsedTime());

    }
  }

}
