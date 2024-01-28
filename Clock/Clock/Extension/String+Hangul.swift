import Foundation

extension String {
    // 문자열 양쪽에 빈문자열이나 줄바꿈이 있을 때 초성을 가져올 수 없음
    var initialConsonant: String? {
        // 이 guard문을 통과 했다면 첫글자는 있는것
        guard trimmingCharacters(in: .whitespaces).count > 0 else {
            return nil
        }
        
        guard let firstChar = first, let unicodeScalar = UnicodeScalar(String(firstChar)) else {
            return nil
        }
        
        // UnicodeScalar가 한글인지 확인
        
        guard (0xAC00 ... 0xD7Af).contains(unicodeScalar.value) else {
            return String(firstChar)
        }
        // 자음 개수 19개
        let consonantList = ["ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ", "ㄹ", "ㅁ", "ㅂ", "ㅃ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"]
        let consonant = (unicodeScalar.value - 0xAC00) / (21 * 28)
        return consonantList[Int(consonant)]
    }
}
