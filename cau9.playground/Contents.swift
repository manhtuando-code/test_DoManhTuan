import UIKit

let str = "t}ua(n d]o)"


func check(string: String) {
    let character = Array(str)
    print(character)
    var ktra = true
    for i in 0..<character.count {
        if character[i] == "[" {
            for j in i..<character.count {
                if character[j] == "]" {
                    ktra = true
                    print("hợp lệ")
                    return
                } else {
                    ktra = false
                    
                }
            }
        } else if character[i] == "(" {
            for j in i..<character.count {
                if character[j] == ")" {
                    ktra = true
                    print("hợp lệ")
                    return
                } else {
                    ktra = false
                    
                }
            }
        } else  {
            ktra = false
        }
    }
    if ktra == false {
        print("Chuỗi k hợp lệ")
    }
}

check(string: str)
