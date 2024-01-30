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
    
    private var list = [Section]()
    private let citySelectionCell = "cityCell"
    
    private let tableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setupList()
        configureUI()
        configureTableView()
    }
    
    private func setupList() {
        var dict = [String: [TimeZone]]()
        
        for id in TimeZone.knownTimeZoneIdentifiers {
            guard let city = id.components(separatedBy: "/").last else { return }
            guard let timeZone = TimeZone(identifier: id) else { return }
            var timeZoneList = [timeZone]
            let key = city.initialConsonant ?? "Unknown"
            
            // 키값이 있다면
            if let list = dict[key] {
                // 기존 배열에 저장되어 있던 timezone 배열을 새로운 배열에 저장
                timeZoneList.append(contentsOf: list)
            }
            // 키에 저장된 배열이 같은 초성으로 가진 TimeZone배열로 업데이트 됨
            dict[key] = timeZoneList
        }
        // 도시 이름 오름차순으로 정렬
        for (key, value) in dict {
            let items = value.sorted {
                guard let lhs = $0.city, let rhs = $1.city else { return false }
                return lhs < rhs
            }.map { // Item 인스턴스로 변경
                Item(title: $0.city ?? $0.identifier, timeZone: $0)
            }
            
            let section = Section(title: key, items: items)
            list.append(section)
        }
        // section에 있는 title 기준으로 오름차수로 정렬
        list.sort { $0.title < $1.title }
    }
    
    private func setTableView() {
        tableView.register(CitySelectionCell.self, forCellReuseIdentifier: citySelectionCell)
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].items.count
//        return list[0].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: citySelectionCell, for: indexPath) as? CitySelectionCell else {
            return UITableViewCell()
        }
        let target = list[indexPath.section].items[indexPath.row]
        cell.textLabel?.text = target.title
        return cell
    }
}
