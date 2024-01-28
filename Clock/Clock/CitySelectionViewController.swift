import UIKit

struct Item {
    let title: String
    let timeZone: TimeZone
}

// ㄱ,ㄴ,ㄷ, A,B,C 초성별 Section
struct Section {
    let title: String
    let items: [Item]
}

class CitySelectionViewController: UIViewController {
    
    private let list = [Section]()
    private let citySelectionCell = "cityCell"
    
    private let tableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        configureUI()
        configureTableView()
    }
    
    private func setupList() {
        var dict = [String: [TimeZone]]()
        
        for id in TimeZone.knownTimeZoneIdentifiers {
            guard let city = id.components(separatedBy: "/").last else { return }
            
            var timeZoneList = [TimeZone(identifier: id)]
            let key = city.initialConsonant ?? "Unknown"

        }
    }
    
    private func setTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: citySelectionCell)
        tableView.dataSource = self
    }
    
    private func configureUI() {
        navigationItem.prompt = "도시 추가"
        view.backgroundColor = .systemBackground
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension CitySelectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: citySelectionCell, for: indexPath) as? CitySelectionCell else {
            return UITableViewCell()
        }
        return cell
    }
}
