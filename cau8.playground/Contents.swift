import UIKit

var arr: [[Int]] = [[1,2,3,4],[4,2,5,6],[9,7,2,3]]

var tong_chan = 0
var tong_le = 0
for i in 0..<arr.count {
    for j in 0..<arr[i].count {
        if (arr[i][j]%2) == 0 {
            tong_chan += arr[i][j]*arr[i][j]
        } else {
            tong_le += arr[i][j]*arr[i][j]
        }
        
    }
}
print(tong_chan)
print(tong_le)
