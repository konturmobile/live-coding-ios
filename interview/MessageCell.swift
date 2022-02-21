import UIKit

class MessageCell: UITableViewCell {
  let text = UILabel()
  let imageUrlText = UILabel()
  let replyMessage = UILabel()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupLayout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func render(_ props: Props.Item) {
    // TODO: заменить на настоящую реализацию
    text.text = "message text"
    imageUrlText.text = "image url"
    replyMessage.text = "replyText"
  }

  private func setupLayout() {
    let stack = UIStackView(arrangedSubviews: [
      replyMessage,
      text,
      imageUrlText,
    ])
    stack.axis = .vertical
    stack.spacing = 8
    stack.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(stack)

    NSLayoutConstraint.activate([
      stack.leadingAnchor.constraint(
        equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
      contentView.trailingAnchor.constraint(
        equalToSystemSpacingAfter: stack.trailingAnchor, multiplier: 2),
      stack.topAnchor.constraint(
        equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
      contentView.bottomAnchor.constraint(
        equalToSystemSpacingBelow: stack.bottomAnchor, multiplier: 1)
    ])
  }
}
