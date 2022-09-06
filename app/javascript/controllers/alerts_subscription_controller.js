import { Controller } from "@hotwired/stimulus"
import { cable } from "@hotwired/turbo-rails"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { userId: Number }

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "AlertChannel", id: this.userIdValue },
         { received: data => this.element.insertAdjacentHTML("afterbegin", data) }
      )
  }
}
