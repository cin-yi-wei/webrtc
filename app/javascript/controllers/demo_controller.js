import { Controller } from "stimulus"
export default class extends Controller {
  static targets = [ "main", "remote" ]
  connect() {
    console.log('test')
  }
}