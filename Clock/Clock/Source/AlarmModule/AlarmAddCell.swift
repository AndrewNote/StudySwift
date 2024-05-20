import UIKit

class AlarmAddCell: UITableViewCell {
    
    private let dayPeriod = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray2
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "오전"
        return label
    }()
    
    private let clockLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray2
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.text = "5:10"
        return label
    }()
    
    private let alarmLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "알람,"
        return label
    }()
    
    private let loopLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "매일"
        return label
    }()
    
    private let alarmToggleSwitch = {
        let toggleSwitch = UISwitch()
        toggleSwitch.translatesAutoresizingMaskIntoConstraints = false
        toggleSwitch.addTarget(self, action: #selector(toggleSwitch(_:)), for: .valueChanged)
        return toggleSwitch
    }()
    
    @objc private func toggleSwitch(_ sender: UISwitch) {
        if sender.isOn == true {
            dayPeriod.textColor = .white
            clockLabel.textColor = .white
            alarmLabel.textColor = .white
            loopLabel.textColor = .white
        } else {
            dayPeriod.textColor = .systemGray2
            clockLabel.textColor = .systemGray2
            alarmLabel.textColor = .systemGray2
            loopLabel.textColor = .systemGray2
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(dayPeriod)
        addSubview(clockLabel)
        addSubview(alarmLabel)
        addSubview(loopLabel)
        contentView.addSubview(alarmToggleSwitch)
        
        NSLayoutConstraint.activate([
            dayPeriod.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            dayPeriod.bottomAnchor.constraint(equalTo: alarmLabel.topAnchor, constant: -10),
            clockLabel.leadingAnchor.constraint(equalTo: dayPeriod.trailingAnchor),
            clockLabel.bottomAnchor.constraint(equalTo: alarmLabel.topAnchor),
            
            alarmLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            alarmLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            loopLabel.leadingAnchor.constraint(equalTo: alarmLabel.trailingAnchor, constant: 5),
            loopLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            alarmToggleSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            alarmToggleSwitch.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
