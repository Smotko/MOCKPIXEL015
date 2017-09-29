import UIKit

class InfoCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var isMovingImageView: UIImageView!
    var viewModel: InfoCellViewModel? {
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
        
        isMovingImageView.image = UIImage(named: "active_circle")
        isMovingImageView.image = isMovingImageView.image!.withRenderingMode(.alwaysTemplate)
        
        isMovingImageView.tintColor = _viewModel.isCarMoving ? UIColor.green : UIColor.red
    }
    
}
