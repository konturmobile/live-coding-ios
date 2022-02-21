import UIKit

class MessagesViewController: UITableViewController {
  private var props = Props.initial

  func render(_ props: Props) {
    self.props = props

    self.title = props.title
    tableView.reloadData()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(MessageCell.self, forCellReuseIdentifier: "MessageCell")
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    props.items.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
    if let messageCell = cell as? MessageCell {
      let item = props.items[indexPath.row]
      messageCell.render(item)
      return messageCell
    }
    return cell
  }
}

