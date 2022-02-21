import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  var messagesController: MessagesFlowViewController!

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    let window = UIWindow(windowScene: windowScene)
    messagesController = MessagesFlowViewController(
      viewModel: MessagesViewModel()
    )
    window.rootViewController = messagesController

    self.window = window
    window.makeKeyAndVisible()
  }
}

