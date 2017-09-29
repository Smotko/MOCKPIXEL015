import UIKit

class AlertsViewController: UIViewController {
    
    @IBOutlet weak var alertsTableView: UITableView!
    var viewModel: AlertsViewModel
    init(viewModel: AlertsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: type(of: self)), bundle: Bundle.main)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    func setupLayout() {
        alertsTableView.tableFooterView = UIView()
    }
}
