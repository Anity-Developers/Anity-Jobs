import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "loadMore" ]

  connect() {
    console.log("load more controller connected...")
    this.checkScroll()
  }

  checkScroll(){
    let currentUrl = window.location.href
    let params = new URLSearchParams(currentUrl.split("?")[1])
    let page = params.get("page")

    if (page > 1) {
      let jobs = document.getElementById("jobs")
      console.log("jobs: ", jobs)
      setTimeout(function(){
        console.log("scrolling to bottom of page...")
        jobs.scrollIntoView({behavior: "smooth", block: "end", inline: "nearest"})
      })
    }
  }
}