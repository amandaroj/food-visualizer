// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="reviews-subscription"
// export default class extends Controller {
//   connect() {
//   }
// }

import { Controller } from "@hotwired/stimulus"
import { cable } from "@hotwired/turbo-rails"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { userId: Number }
  // static targets = ["reviews"], if you wanted to target something, e.g. if you want to use this somewhere later

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ReviewChannel", id: this.userIdValue },
      // you want the reviewchannel/cable to be availbe for user with useridvalue
      // { received: data => console.log(data) } here you were just printing whatever they kicked out of the channel
      // data is whatever comes out of the channel/pipeline
      { received: data => this.element.insertAdjacentHTML("afterbegin", data) }
      // # this is the Controller, element refers to the html, the div: div data-controller="reviews-subscription" is what you refer to here
      // what you do with the data you receive from the channel: it's the data that comes down
      // from the server to the client, so from new review to the user's dashboard.
    )
  }
}

// channel = the cable, so now you define, who you want to access the channel
// who do you want to create a reviews channel for,
