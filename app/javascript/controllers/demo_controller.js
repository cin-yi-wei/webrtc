import { Controller } from "stimulus"
export default class extends Controller {
  static targets = [ "main", "remote" ]
  connect() {
    console.log('test')
  }

  getUserMedia() {
    navigator.mediaDevices.getUserMedia({
      audio: false,
      video: true
    }).then((stream) => {
      // this.connection.localStream = stream
      this.mainTarget.srcObject = stream
      // this.channel.send({type: "TOKEN"})
    })
  }

}