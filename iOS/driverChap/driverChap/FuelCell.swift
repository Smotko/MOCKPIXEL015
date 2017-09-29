import UIKit

class FuelCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    var viewModel: FuelCellViewModel? {
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
        progressView.layer.cornerRadius = 4
        progressView.progress = _viewModel.percentage
        progressView.trackTintColor = UIColor.lightGray
        switch _viewModel.percentageState {
        case .low:
            progressView.progressTintColor = UIColor.red
        case .medium:
            progressView.progressTintColor = UIColor.yellow
        case .high:
            progressView.progressTintColor = UIColor.green
        }
        titleLabel.text = _viewModel.title
    }
}
