//
//  Date+Util.swift
//  Clock
//
//  Created by ChanHyuc on 4/19/24.
//
// 매초마다 분을 확인하는건 매초마다 테이블뷰를 reload하는것 보다 훨씬 가벼운 작업

import Foundation

extension Date {
    // 마지막으로 업데이트한 시간을 저장
    // extension 저장속성 추가못함 타입속성은 저장속성으로 추가할 수 있음
    private static var lastUpdateMinute: Int? = nil
    
    
    // 분값이 바뀌면 true 반환
    var minuteChanged: Bool {
        guard let last = Self.lastUpdateMinute else {
            Self.lastUpdateMinute = Calendar.current.component(.minute, from: .now)
            return true
        }
        
        // lastUpdateMinute에 뭔가 저장되어 있다면 현재시간을 가져와서 분을 비교해봐야함
        let currentMin = Calendar.current.component(.minute, from: .now)
        
        // 두개 값이 다르다면 현재 분을 저장
        if last != currentMin {
            Self.lastUpdateMinute = currentMin
            return true
        }
        
        // 나머지 경우는 false 반환
        return false
    }
}
