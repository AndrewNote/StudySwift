import UIKit

class AlarmAddCell: UITableViewCell {
    
    private let dayPeriod = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "오전"
        return label
    }()
    
    private let clockLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "5:10"
        return label
    }()
    
    private let alarmLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "알람"
        return label
    }()
    
    private let loopLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "매일"
        return label
    }()
    
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
        
        NSLayoutConstraint.activate([
            dayPeriod.leadingAnchor.constraint(equalTo: leadingAnchor),
            dayPeriod.bottomAnchor.constraint(equalTo: alarmLabel.topAnchor, constant: -20),
            clockLabel.leadingAnchor.constraint(equalTo: dayPeriod.trailingAnchor, constant: 10),
            clockLabel.bottomAnchor.constraint(equalTo: alarmLabel.topAnchor, constant: -20),
            
            alarmLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            alarmLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            loopLabel.leadingAnchor.constraint(equalTo: alarmLabel.trailingAnchor, constant: 10),
            loopLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
