import UIKit

class FeedCell: UICollectionViewCell {
    // MARK: Properties
    //UIImageView로 캐스팅?,
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        return iv   // UIImageView 반환
    }() // () 생성자 추가
    
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemPurple
    }
    
    // 필수 초기화
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
