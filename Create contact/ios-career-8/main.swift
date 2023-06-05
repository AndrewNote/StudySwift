import Foundation

var nameArray: [String] = []
var ageArray: [String] = []
var phoneNumberArray: [String] = []

func addressAdd() {
    print("연락처 정보를 입력해주세요", terminator: " : ")
    let inputAddress = readLine()!.split(separator: "/")
    
    if inputAddress.count == 0 {        //
        print("아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요.")
    } else {
        
        let name = inputAddress[0].components(separatedBy: [" "]).joined() // 띄어쓰기 없애기
        let age = inputAddress[1].trimmingCharacters(in: .whitespaces)      // 나이 양쪽 띄어쓰기 없애기
        let phoneNumber = inputAddress[2].trimmingCharacters(in: .whitespaces)  // 번호도 양쪽 띄어쓰기 없애기
        let validationCheck = phoneNumber.components(separatedBy: ["-"]).joined()   // 폰번호 - 없앤 상태에서 넣기
        
        if Int(age) != nil && Int(age)! < 1000 {
            // 폰번호 -만 없앴을때 2가 차이나야함
            if validationCheck.count > 8 && phoneNumber.count - validationCheck.count == 2 {
                nameArray.append(name)
                ageArray.append(age)
                phoneNumberArray.append(phoneNumber)
                print("입력한 정보는 \(age)세 \(name)(\(phoneNumber))입니다." )
            } else {
                print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
            }
            
        } else {
            print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        }
    }
}

func addressList() {
    if nameArray.count != 0 {
        nameArray = nameArray.sorted()      //
        for index in 0..<nameArray.count {
            print("\(nameArray[index]) / \(ageArray[index]) / \(phoneNumberArray[index])" )
        }
    }
}

func addressSearch() {
    print("연락처에서 찾을 이름을 입력해주세요", terminator: " : ")
    let inputName = readLine()!
    if nameArray.contains(inputName) == false { // 입력받은 값 contains Bool값 return // filter 고급함수?
        print("연락처에 \(inputName) 이(가) 없습니다.")
    } else {
        for index in 0..<nameArray.count {      // 있다면 보여주기
            if nameArray[index] == inputName {
                print("\(nameArray[index]) / \(ageArray[index]) / \(phoneNumberArray[index])" )
            }
        }
    }
    
}

// for문은 횟수가 제한이 있을 때 while은 제한이 없을때
while true {
    print("1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료")
    print("메뉴를 선택해주세요", terminator: " : ")
//    print("메뉴를 선택해주세요 :") //terminator를 사용한 이유
    let menu = readLine()!  // readLine 입력값을 받음
    
    if menu == "1" {
        addressAdd()
    } else if menu == "2" {
        addressList()
    } else if menu == "3" {
        addressSearch()
    } else if menu == "x"{
//        print("") \n 이스케이프를 사용하지 않고 이렇게 사용해도 똑같이 출력되지만 사용
        print("\n[프로그램 종료]")
        break
    } else {
        print("선택이 잘못되었습니다 확인 후 다시 입력해주세요.")
    }
}
