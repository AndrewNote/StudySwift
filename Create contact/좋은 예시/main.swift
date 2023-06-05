import Foundation


// MARK: - 실행 공간(main)

var flag = false // while문을 탈출하기 위한 플래그
var users: [User] = []

while true {
    print("1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료")
    print("메뉴를 선택해주세요 : ", terminator: "")
    
    let type = readLine()!
    // 입력값에 따른 분기처리
    switch type {
    case "1": // 추가
        addContact()
    case "2": // 보기
        viewContact()
    case "3": // 검색
        searchContact()
    case "x": // 종료
        flag = true
    default: // 1, 2, 3, x가 아닐 때 출력
        print("선택이 잘못되었습니다 확인 후 다시 입력해주세요.", terminator: "\n\n")
    }
    
    // 종료플래그가 활성화되었다면
    if flag {
        print("\n[프로그램 종료]")
        break
    }
}



// MARK: - 함수 공간

// 연락처를 추가하는 함수
func addContact() {
    let validator = Validator()
    print("연락처 정보를 입력해주세요 : ", terminator: "")
    let info = readLine()!
    let parsedInfo = parseInfo(info)
    // 입력한 정보가 전부 유효하다면
    if validator.isCorrectInfo(parsedInfo) {
        // 이름에서 공백을 제거하고, 나이와 연락처정보를 넣어 User객체 생성
        let user = User(name: parsedInfo[0].replacingOccurrences(of: " ", with: ""),
                        age: Int(parsedInfo[1])!,
                        contactNumber: parsedInfo[2])
        // 유저배열에 유저를 추가
        users.append(user)
        print("입력한 정보는 \(user.age)세 \(user.name)(\(user.contactNumber))입니다.", terminator: "\n\n")
    }
}

// 연락처 목록을 보는 함수
func viewContact() {
    // 이름순으로 정렬한 후 연락처 목록의 유저들을 printUser함수에 넣어서 출력
    users.sorted(by: { $0.name > $1.name }).forEach { printUser($0) }
    print()
}

// 연락처에서 이름을 검색하는 함수
func searchContact() {
    print("연락처에서 찾을 이름을 입력해주세요 : ", terminator: "")
    let name = readLine()!
    let filteredUsers = users.filter{ $0.name == name }
    
    // 연락처에 같은 이름이 존재하는 게 없다면
    guard !filteredUsers.isEmpty else {
        print("연락처에 \(name) 이(가) 없습니다.", terminator: "\n\n")
        return
    }
    // 이름 순으로 정렬하는데 이름이 같다면 나이순으로 정렬. -> "검색 결과의 출력 순서는 입력받았던 순서와 무관합니다"의 조건때문에 넣었습니다.
    filteredUsers.sorted(by: { $0.name == $1.name ?
                                $0.age < $1.age :
                                $0.name > $1.name })
                 .forEach{ printUser($0) }
    print()
}


// info를 받아 "/"을 기준으로 분리시키고 앞 뒤 공백을 없앤 문자열 배열을 리턴한다.
func parseInfo(_ info: String) -> [String] {
    return info.split(separator: "/")
                .map{ String($0).trimmingCharacters(in: .whitespacesAndNewlines) }
                
}

// user를 받아 적절한 형태로 출력하는 함수
func printUser(_ user: User) {
    print("- \(user.name) / \(user.age) / \(user.contactNumber)")
}

