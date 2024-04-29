import UIKit

class WorldClockController: UIViewController {
    // Timer는 일정주기로 코드를 실행 CPU를 그만큼 많이 사용하고 배터리 소모가 큼, 그래서 가급적 적게 사용해야 함
    var timer: Timer?
    
    private let worldClockCell = "cell"
    private var worldClockList = [TimeZone(identifier: "Asia/Seoul"), TimeZone(identifier: "Europe/Paris"), TimeZone(identifier: "America/New_York"), TimeZone(identifier: "Asia/Tehran"), TimeZone(identifier: "Asia/Vladivostok")]
    
    private let worldClockTableView = {
        let tableView = UITableView()
        tableView.rowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        configureNavigationBar()
        configureTableView()
    }
    
    private func setTableView() {
        worldClockTableView.dataSource = self
        worldClockTableView.register(WorldClockCell.self, forCellReuseIdentifier: worldClockCell)
    }
    
    private func configureTableView() {
        view.addSubview(worldClockTableView)
        NSLayoutConstraint.activate([
            worldClockTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            worldClockTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            worldClockTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            worldClockTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "세계 시계"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(didTapEditButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(didTapPlusButton))
        
        // 네비게이션 아이템에 editButton 추가
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @objc private func didTapEditButton() {
        
    }
    
    @objc private func didTapPlusButton() {
        present(UINavigationController(rootViewController: CitySelectionViewController()), animated: true)
    }
    
}

extension WorldClockController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worldClockList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: worldClockCell, for: indexPath) as? WorldClockCell else {
            return UITableViewCell()
        }
        
        let target = worldClockList[indexPath.row]
        
        cell.timeOffSetLabel.text = target?.timeOffset
        cell.timeZoneLabel.text = target?.city
        cell.timeLabel.text = target?.currentTime
        cell.timePeriodLable.text = target?.timePeriod
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            worldClockList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // 네비게이션 상태가 바뀔때마다 호출되는 메서드
    // 파라미터로 editing이 true가 전달되면 편집상태 false는 일반상태
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        // 테이블뷰에도 똑같은 메서드가 있음, 파라미터를 그대로 전달
        worldClockTableView.setEditing(editing, animated: animated)
    }
    
    // 편집 모드시 우측에 햄버거 메뉴 활성화 셀의 순서를 바꿀 수 있음
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let target = worldClockList.remove(at: sourceIndexPath.row)
        worldClockList.insert(target, at: destinationIndexPath.row)
    }
}
