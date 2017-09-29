import UIKit

class VehiculeViewController: UIViewController {

    @IBOutlet weak var carTableView: UITableView!
    var viewModel: VehiculeViewModel
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    init(viewModel: VehiculeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: type(of: self)), bundle: Bundle.main)
    }
    func setupLayout() {
        carTableView.register(UINib(nibName: "DisclosureCell", bundle: nil), forCellReuseIdentifier: "disclosureCell")
        carTableView.register(UINib(nibName: "SwitchCell", bundle: nil), forCellReuseIdentifier: "switchCell")
        carTableView.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "infoCell")
        carTableView.register(UINib(nibName: "FuelCell", bundle: nil), forCellReuseIdentifier: "fuelCell")
        carTableView.delegate = self
        carTableView.dataSource = self
        carTableView.estimatedRowHeight = 100
        carTableView.rowHeight = UITableViewAutomaticDimension
        carTableView.tableFooterView = UIView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension VehiculeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = viewModel.cellIdentifier(index: indexPath.row)
        switch identifier {
        case "switchCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? SwitchCell
            cell?.delegate = self
            return cell!
        case "disclosureCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? DisclosureCell
            return cell!
        case "infoCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? InfoCell
            return cell!
        case "fuelCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? FuelCell
            return cell!
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? DisclosureCell
            return cell!
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let _cell = cell as? SwitchCell {
            _cell.viewModel = viewModel.getSwitchCellViewModel(index: indexPath.row)
        }
        if let _cell = cell as? DisclosureCell {
            _cell.viewModel = viewModel.getDisclosureCellViewModel(index: indexPath.row)
        }
        if let _cell = cell as? InfoCell {
            _cell.viewModel = viewModel.getInfoCellViewModel(index: indexPath.row)
        }
        if let _cell = cell as? FuelCell {
            _cell.viewModel = viewModel.getFuelCellViewModel()
        }
    }
}
extension VehiculeViewController: VehiculeCellsDelegate {
    func changedSwitch(toState: Bool) {
        if toState {
            let alert = UIAlertController(title: "Alert", message: "Are you sure?", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { _ in
                self.carTableView.reloadData()
            }))
            self.present(alert, animated: true, completion: nil)
        }

    }
}
