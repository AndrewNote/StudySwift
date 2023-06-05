//
//  Validator.swift
//  yagoomTest
//
//  Created by 천승현 on 2022/11/18.
//

import Foundation

// 유효성을 판별하는 클래스
class Validator {
    
    func isCorrectInfo(_ info: [String]) -> Bool {
        // 파싱된 값이 이름, 나이, 전화번호부 전부 올바르게 들어오지 않았다면 false 리턴
        guard info.count == 3 else {
            print("아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요.", terminator: "\n\n")
            return false
        }
        
        let age = info[1]
        let contactNumber = info[2]
        
        // 나이가 유효하지 않다면 false return, 아니라면 진행
        guard self.isAge(age) else {
            print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.", terminator: "\n\n")
            return false
        }
        
        
        // 전화번호가 유효하지 않다면 false return, 아니라면 진행
        guard self.isContactNumber(contactNumber) else {
            print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요.", terminator: "\n\n")
            return false
        }
        
        // 전부 유효하다면 입력자체가 유효하기 때문에 true리턴
        return true
    }
    
    // 숫자가 세자리수 이하이면서 숫자로 변환이 가능하다면 true를, 아니라면 false를 리턴
    func isAge(_ age: String) -> Bool {
        return (age.count <= 3 && Int(age) != nil)
    }
    
    // -가 두 개(nums가 3개가 된다)면서 숫자가 9자리 이상일 때 true를, 아니라면 false를 리턴
    func isContactNumber(_ number: String) -> Bool {
        // 하이폰으로 분리된 숫자들
        let nums = number.split(separator: "-").map{ String($0) }
        
        // 숫자로 변환가능하지 않다면 false를 리턴
        // ex) 02a-2631-3134, 0 2 - 2 1 53 - 3289
        for x in nums {
            guard let _ = Int(x) else { return false }
        }
        
        // 하이폰을 제외한 숫자의 개수
        let numCount = nums.reduce(0, { $0 + $1.count })
        return nums.count == 3 && numCount >= 9
    }
    
}
