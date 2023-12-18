
import Foundation
import UIKit

var date = Date().timeIntervalSince1970
// Time Since 1970 in second


var oneSecondAfterNow = date + 1
var cnt = 0

print( date )
print( oneSecondAfterNow )

while date < oneSecondAfterNow {
    date = Date().timeIntervalSince1970
    cnt += 1
}
print( cnt )
