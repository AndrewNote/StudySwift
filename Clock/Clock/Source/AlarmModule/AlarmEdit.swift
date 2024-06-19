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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(navigationStackView)
        view.addSubview(datePicker)
        
        NSLayoutConstraint.activate([
            navigationStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            navigationStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            datePicker.topAnchor.constraint(equalTo: navigationStackView.bottomAnchor, constant: 10),
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    @objc private func didTapCancelButton() {
        dismiss(animated: true)
    }
    
    @objc private func didTapSaveButton() {
        
    }
    
}
