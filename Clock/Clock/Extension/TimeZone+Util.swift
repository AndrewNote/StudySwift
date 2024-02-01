import Foundation

private let formatter = DateFormatter() // 날짜를 문자열로 변환하거나 문자열을 파싱하는데 사용
// parsing: 데이터에서 필요한 정보를 추출하는 과정, 주로 문자열이나 데이터의 특정 형식을 읽고 추출함
private let offsetFormatter = DateComponentsFormatter() // 두 날짜 사이의 시간 간격을 특정 형식으로 표시

// 기존 타입에 작은 수정을 추가하려면 Extension을 사용하는 것이 간편하고 깔끔
// TimeZone, Swift에서 제공하는 시간대를 다루기 위한 구조체, Foundation 프레임워크에 포함되어 있음
extension TimeZone {
    
    var currentTime: String? {
        formatter.timeZone = self // self는 TimeZone을 가리킴
        formatter.dateFormat = "h:mm"
        return formatter.string(from: .now)
    }
    
    var timePeriod: String? {
        formatter.timeZone = self
        formatter.dateFormat = "a"  // AM, PM 표기
        return formatter.string(from: .now)
    }
    
    var city: String? {
        let city = identifier.components(separatedBy: "/").last
        return city?.replacingOccurrences(of: "_", with: " ")
    }
    
    //secondsFromGMT(): TimeZone 클래스에 있음, 현재 시간대에서 GMT로부터의 차이를 초 단위로 반환
    var timeOffset: String? {
        let timeZoneOffset = secondsFromGMT() - TimeZone.current.secondsFromGMT()
        let offsetComponents = DateComponents(second: timeZoneOffset) // DateComponents 인스턴스 생성
        let signPrefix = timeZoneOffset >= 0 ? "+" : ""
        
        // 3600의 배수 즉, 1시간 배수 값인지 확인하고 맞으면 시간만 표시 아니면 시간,분 표시
        offsetFormatter.allowedUnits = timeZoneOffset.isMultiple(of: 3600) ? [.hour] : [.hour, .minute]
        // 3600의 배수 즉, 1시간 배수 값인지 확인하고 맞으면 자세히 표현하는 full 아니면 간략하게 표현하는 positional
        offsetFormatter.unitsStyle = timeZoneOffset.isMultiple(of: 3600) ? .full : .positional
        
        let offsetStr = offsetFormatter.string(from: offsetComponents) ?? "\(timeZoneOffset / 3600)"
        // 현재 시간 기준으로 timeZoneOffset 만큼의 시간 차이를 가지는 Date 객체 생성
        let time = Date(timeIntervalSinceNow: TimeInterval(timeZoneOffset))
        
        if Calendar.current.isDateInToday(time) {
            return "오늘, \(signPrefix)\(offsetStr)"
        } else if Calendar.current.isDateInYesterday(time) {
            return "어제, \(signPrefix)\(offsetStr)"
        } else if Calendar.current.isDateInTomorrow(time) {
            return "내일, \(signPrefix)\(offsetStr)"
        } else {
            return nil
        }
    }
    
}
