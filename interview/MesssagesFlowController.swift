import UIKit

class MessagesFlowViewController: UIViewController {
  private let viewModel: MessagesViewModel
  private let contentController = MessagesViewController()

  init(viewModel: MessagesViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    addContentController()

    viewModel.chatOutput = { [unowned self] chat in
      contentController.render(chat)
    }

    viewModel.errorOutput = { [unowned self] error in
      showError(error)
    }
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    viewModel.load()
  }

  private func addContentController() {
    addChild(contentController)
    view.addSubview(contentController.view)
    contentController.view.translatesAutoresizingMaskIntoConstraints = false
    contentController.didMove(toParent: self)

    NSLayoutConstraint.activate([
      contentController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      contentController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      contentController.view.topAnchor.constraint(equalTo: view.topAnchor),
      contentController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }

  private func showError(_ error: MessagesViewModel.ChatViewError) {
    let alertTitle: String
    let alertMessage: String
    switch error {
    case .dataError:
      alertTitle = "Failed to load data"
      alertMessage = "Please, come back later and try again"
    case .networking:
      alertTitle = "Networking failure"
      alertMessage = "Check you internet connection and try again"
    }
    let alert = UIAlertController(
      title: alertTitle,
      message: alertMessage,
      preferredStyle: .alert)
    alert.addAction(.init(title: "OK", style: .cancel, handler: nil))
    present(alert, animated: true, completion: nil)
  }
}
