import UIKit

struct Props {
  let title: String

  struct Item {
    // TODO: добавить свойства каждого сообщения
  }

  let items: [Item]

  static let initial = Props(title: "", items: [])
}

class MessagesViewModel {
  // TODO: добавить необходимые зависимости
  init() {

  }

  // Outputs
  enum ChatViewError: Error {
    case networking
    case dataError
  }

  var chatOutput: ((Props) -> Void)?
  var errorOutput: ((ChatViewError) -> Void)?

  // Inputs
  func load() {
    // TODO: сделать настоящую реализацию
    chatOutput?(Props(title: "mock title", items: [
      .init(),
      .init()
    ]))
  }
}
