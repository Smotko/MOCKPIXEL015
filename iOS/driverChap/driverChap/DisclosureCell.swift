import UIKit

class DisclosureCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var viewModel: DisclosureCellViewModel? {
        didSet {
            updateContent()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func updateContent() {
        guard let _viewModel = viewModel else{
            return
        }
        titleLabel.text = _viewModel.titleLabel
        detailLabel.text = _viewModel.valueLabel
    }
    
}
