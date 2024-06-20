import UIKit

class AlarmController: UIViewController {
    
    // ViewController은 UI와 데이터 모델을 연결하는 역할이므로 alarmList와 같은 데이터는 ViewController에 있는것이 적합
    private var alarmList: [AlarmState] = [
        AlarmState(id: "alarm1", isOn: false),
        AlarmState(id: "alarm2", isOn: false),
    ]
    
    private let alarmAddCell = "cell"
    
    private let tableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // View Controller의 뷰가 메모리에 로드된 후 호출되며, 주로 뷰와 관련된 초기 설정을 주로 처리함
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        configureUI()
        configureNavigationBar()
    }
    
    // 가독성 향상, delegate, dataSource 메서드를 mock 객체를 사용하여 테스트를 수월하게 하기 위해 분리
    // ViewDidLoad에 직접 사용해도 무방
    private func setupTableView() {
        tableView.register(AlarmControllerCell.self, forCellReuseIdentifier: alarmAddCell)
        tableView.dataSource = self
        tableView.delegate = self
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
        
        // 각 알람의 고유한 ID를 사용해서 UserDefaults에 상태를 저장
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
