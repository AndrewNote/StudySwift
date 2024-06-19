import UIKit

class AlarmController: UIViewController {
    
    var alarmList: [AlarmState] = [
        AlarmState(id: "alarm1", isOn: false),
        AlarmState(id: "alarm2", isOn: false),
    ]
    
    private let alarmAddCell = "cell"
    
    private let tableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(AlarmControllerCell.self, forCellReuseIdentifier: alarmAddCell)
        tableView.dataSource = self
        tableView.delegate = self
        configureUI()
        configureNavigationBar()
    }
    
    private func configureUI() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "알람"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "편집", style: .plain, target: self, action: #selector(didTapEditButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(didTapPlusButton))
    }
    
    @objc private func didTapEditButton() {
        
    }
    
    @objc private func didTapPlusButton() {
        present(AlarmEdit(), animated: true)
    }
    
}

extension AlarmController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: alarmAddCell, for: indexPath) as? AlarmControllerCell else {
            return UITableViewCell()
        }
        
        let alarm = alarmList[indexPath.row]
        cell.alarmId = alarm.id
        cell.alarmToggleSwitch.isOn = UserDefaults.standard.getAlarmState(for: alarm.id)
        return cell
    }
    
}

extension AlarmController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        present(AlarmEdit(), animated: true)
    }
}
