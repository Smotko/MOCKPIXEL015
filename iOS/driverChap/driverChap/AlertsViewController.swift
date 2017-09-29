import UIKit
import RxSwift

class AlertsViewController: UIViewController {
    
    @IBOutlet weak var alertsTableView: UITableView!
    let disposeBag = DisposeBag()
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
        
        alertsTableView.register(UINib(nibName: "AlertCell", bundle: nil), forCellReuseIdentifier: "alertCell")
        alertsTableView.delegate = self
        alertsTableView.dataSource = self
        
        alertsTableView.estimatedRowHeight = 100
        alertsTableView.rowHeight = UITableViewAutomaticDimension
        alertsTableView.tableFooterView = UIView()
        setupBindings()
    }
    func setupBindings() {
        viewModel
            .refreshSubject
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { _ in
                self.alertsTableView.reloadData()
            })
            .addDisposableTo(disposeBag)
    }
}
extension AlertsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alertCell", for: indexPath) as? AlertCell
        return cell!
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let _cell = cell as? AlertCell {
            _cell.viewModel = viewModel.getCellViewModel(index: indexPath.row)
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.removePush(index: indexPath.row)
        }
    }

}
