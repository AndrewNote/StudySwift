import UIKit

class WorldClockCell: UITableViewCell {
    
    private let timeOffSetLabel = {
        let label = UILabel()
        label.text = "오늘, +0시간"
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let timeZoneLabel = {
        let label = UILabel()
        label.text = "서울"
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    private let timePeriodLable = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 34)
        label.text = "오후"
        return label
    }()
    
    private let timeLabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 60, weight: .light)
        label.text = "8:30"
        return label
    }()
    
    private lazy var leadingStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.timeOffSetLabel, self.timeZoneLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var trailingStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.timePeriodLable, self.timeLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .lastBaseline
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(leadingStackView)
        addSubview(trailingStackView)
        
        NSLayoutConstraint.activate([
            leadingStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            leadingStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            leadingStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            
            trailingStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            trailingStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
//            trailingStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
        ])
    }
}
