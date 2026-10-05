import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  rewrite(event) {
    const input = event.currentTarget
    input.value = input.value.toUpperCase().split("").reverse().join("")
  }
}
