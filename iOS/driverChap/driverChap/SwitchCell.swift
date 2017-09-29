import UIKit

class SwitchCell: UITableViewCell {

    @IBOutlet weak var switchValue: UISwitch!
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: SwitchCellViewModel? {
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
        titleLabel.text = _viewModel.titleLabel
        switchValue.isOn = _viewModel.switchState
    }
    
}
