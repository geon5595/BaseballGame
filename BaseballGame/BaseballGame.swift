class BaseballGame {
    func start() {
        var count = [Int: Int]()
        var playcnt = 0
        while true {
            let answer = makeAnswer()
            print("환영합니다! 원하시는 번호를 입력해주세요")
            print("1.게임 시작하기 2. 게임 기록 보기 3. 종료하기")
            let input = readLine()
            if input == "1" {
                count[playcnt] = 0
                print("< 게임을 시작합니다 >")
            } else if input == "2" {
                for (key, val) in count {
                    print("\(key+1)번째 게임 : 시도 횟수 - \(val)")
                }
                continue
            } else if input == "3" {
                break
            } else {
                print("올바른 숫자를 입력해주세요!")
                continue
            }
            
            while true {
                print("숫자를 입력하세요")
                var strike = 0
                var ball = 0
                if let input = readLine() {
                    guard let _ = Int(input) else {
                        print("올바르지 않은 입력값입니다")
                        if let curval = count[playcnt] {
                            count[playcnt] = curval + 1
                        }
                        continue
                    }
                    let inputArr = input.compactMap{ Int(String($0)) }
                    if Set(inputArr).count < 3 {
                        print("올바르지 않은 입력값입니다")
                        if let curval = count[playcnt] {
                            count[playcnt] = curval + 1
                        }
                        continue
                    }
                    if inputArr[0] == 0 {
                        print("올바르지 않은 입력값입니다")
                        if let curval = count[playcnt] {
                            count[playcnt] = curval + 1
                        }
                        continue
                    }
                    if inputArr.count != 3 {
                        print("올바르지 않은 입력값입니다")
                        if let curval = count[playcnt] {
                            count[playcnt] = curval + 1
                        }
                        continue
                    }
                    for i in 0..<inputArr.count {
                        if inputArr[i] == answer[i] {
                            strike += 1
                        } else if answer.contains(inputArr[i]) {
                            ball += 1
                        }
                    }
                    if strike == 3 {
                        print("정답입니다!")
                        if let curval = count[playcnt] {
                            count[playcnt] = curval + 1
                        }
                        playcnt += 1
                        break
                    }
                    if strike > 0 && ball > 0 {
                        if let curval = count[playcnt] {
                            count[playcnt] = curval + 1
                        }
                        print("\(strike)스트라이크 \(ball)볼")
                    } else if strike > 0 {
                        if let curval = count[playcnt] {
                            count[playcnt] = curval + 1
                        }
                        print("\(strike)스트라이크")
                    } else if ball > 0 {
                        if let curval = count[playcnt] {
                            count[playcnt] = curval + 1
                        }
                        print("\(ball)볼")
                    } else {
                        if let curval = count[playcnt] {
                            count[playcnt] = curval + 1
                        }
                        print("Nothing")
                    }
                }
            }
        }
    }
        
    
    func makeAnswer() -> [Int] {
        var number = [Int]()
        while number.count < 3 {
            let randomNumber = Int.random(in: 0...9)
            if number.count == 0 && randomNumber == 0 {
                continue
            }
            if !number.contains(randomNumber) {
                number.append(randomNumber)
            }
        }
        return number
    }
}
