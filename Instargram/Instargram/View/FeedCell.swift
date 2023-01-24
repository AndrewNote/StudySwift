import UIKit

class FeedCell: UICollectionViewCell {
    // MARK: Properties
    //UIImageView로 캐스팅?,
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "venom-7")
        return iv   // UIImageView 반환
    }() // () 생성자 추가
    
    // lazy var 안해줘도 작동 되는데?
    private let usernameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("joker", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 12)
        button.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        // addTarget 정의 또는 선언에 대상을 추가하지 않은경우 lazy var를 만들래
        // lazy var를 만들면 노란색 에러 사라짐
        // Class가 초기화되기전에 대상을 didTapUsername을 추가하려고 하기 때문?
        return button
    }()
    
    @objc private func didTapUsername() {
        print("DEBUG: did tap username")
    }
    
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(profileImageView)
        addSubview(usernameButton)
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        profileImageView.layer.cornerRadius = 40 / 2
        
        usernameButton.translatesAutoresizingMaskIntoConstraints = false
        usernameButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        usernameButton.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 10).isActive = true
    }
    
    // 필수 초기화
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
