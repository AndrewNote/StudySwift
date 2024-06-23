import UIKit

enum UserDefalutKeys{
    case alarmRepeat
    case alarmLabel
    case alarmSound
    case snooze
}

class AlarmEdit: UIViewController {
    
    private let titleLabel = {
        let label = UILabel()
        label.text = "알람 추가"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let cancelButton = {
        let button = UIButton()
        button.setTitleColor(.systemOrange, for: .normal)
        button.setTitle("취소", for: .normal)
        button.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        return button
    }()
    
    private let saveButton = {
        let button = UIButton()
        button.setTitleColor(.systemOrange, for: .normal)
        button.setTitle("저장", for: .normal)
        button.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        return button
    }()
        
    private lazy var navigationStackView = {
        let stackView = UIStackView(arrangedSubviews: [cancelButton, titleLabel, saveButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 100
        return stackView
    }()
    
    private let datePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "ko-KR")
        return datePicker
    }()
    
    private let tableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupTableView()
//        tableView.frame = self.view.bounds
    }
    
    private func setupTableView() {
        tableView.dataSource = self
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(navigationStackView)
        view.addSubview(datePicker)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            navigationStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            navigationStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            datePicker.topAnchor.constraint(equalTo: navigationStackView.bottomAnchor, constant: 10),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            tableView.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    @objc private func didTapCancelButton() {
        dismiss(animated: true)
    }
    
    @objc private func didTapSaveButton() {
        dismiss(animated: true)
    }
    
}

extension AlarmEdit: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "반복"
        case 1:
            cell.textLabel?.text = "레이블"
        case 2:
            cell.textLabel?.text = "사운드"
        case 3:
            cell.textLabel?.text = "다시 알림"
        default:
            cell.textLabel?.text = ""
        }
        
        return cell
    }
    
}
