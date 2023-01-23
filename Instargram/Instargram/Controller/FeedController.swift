//
//  FeedController.swift
//  Instargram
//
//  Created by Andrew on 2023/01/19.
//

import UIKit

private let reuseIdentifier = "Cell"

// UICollectionViewController를 사용할시 backgroundColor는 자동 흰색이 된다.
// UICollectionViewController에 이미 delegate, datasource 프로토콜이 준수 되어 있다.
class FeedController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    private func configureUI(){
        // 동일한 식별자를 등록함 때문에 우리는 등록한 셀은 반환하는 셀과 일치함
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
}

extension FeedController {
    // UICollectionView 표준을 등록하는 대신 내가 만든 FeedCell을 사용한다.
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    // 컬렉션 뷰에게 셀을 반환하도록 지시하고 있지만 컬렉션에 셀을 등록도 해야 한다
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {  // UICollectionViewCell을 반환하는 함수!
        // ios에서는 cell이 화면 밖으로 나갈때 큐에서 빼는 메모리 관리 시스템이 있다
        // 디스플레이에서는 필요한 만큼의 메모리만 사용한다. 메모리 캐시를 통해 돌아가 재사용 식별자를 사용하여 셀을 찾는다.
        // 이미 사용한 cell은 생성하는 대신 캐시에서 가져온다.
        // withReuseIdentifier: 재사용할 식별자
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FeedCell
        // FeedCell로 캐스팅됨 (as!)
        return cell
    }
}

// UICollectionViewDelegateFlowLayout 프로토콜 : 각 cell의 크기를 지정한다.
extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}
