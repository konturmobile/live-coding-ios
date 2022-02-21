import Foundation

/// Перед тобой json чата. Вся история сообщений хранится на серверах.
/// Сообщения бывают:
/// - текст
/// - ответ
/// - изображение (ссылка)
/// Перевести из json в модель и отобразить во ViewController
/// Можно пользоваться документацией и гуглить
///
/// MessagesViewModel - преобразует данные для отображения
/// MessageFlowController — получает ViewModel и связывает её с View
/// MessageViewController - вью слой, который отображает данные
/// SceneDelegate - собирает вместе MessageFlowController и MessageViewModel
/// MessageCell - базовая ячейка

let json = """
{
  "title": "Chat with Craig",
  "senderId": "1234512",
  "recipientId": "594442",
  "messages": [
    {
      "id": "9899987",
      "timestamp": 1640590670,
      "sender": "1234512",
      "text": "Hello, Craig!",
      "reply": null,
      "image": null
    },
    {
      "id": "9899986",
      "timestamp": 1640590678,
      "sender": "594442",
      "text": null,
      "reply": null,
      "image": "https://picsum.photos/500/600"
    },
    {
      "id": "9899985",
      "timestamp": 1640590681,
      "sender": "594442",
      "text": "Yes, you`re right",
      "reply": "9899987",
      "image": null
    }
  ]
}
""".data(using: .utf8)!
