import UIKit

class AlertCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var descriptionLabel: UILabel!
    var viewModel: AlertCellViewModel? {
        didSet {
            updateContent()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func updateContent() {
        guard let _viewModel = viewModel else {
            return
        }
        descriptionLabel.text = _viewModel.title
        dateLabel.text = _viewModel.date
    }
}
