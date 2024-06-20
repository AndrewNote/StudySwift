import Foundation

extension UserDefaults {
    
    // id로 구분한 알람의 isOn이 true인지 false인지를 저장
    func setAlarmState(_ isOn: Bool, for id: String) {
        self.set(isOn, forKey: id)
    }
    
    // id로 구분한 알람의 bool값을 가져옴
    func getAlarmState(for id: String) -> Bool {
        return self.bool(forKey: id)
    }
    
}
