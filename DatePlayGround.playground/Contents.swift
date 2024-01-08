
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


extension UIColor {

    func toHex() -> String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            assertionFailure("Failed to get RGBA components from UIColor")
            return "#000000"
        }

        // Clamp components to [0.0, 1.0]
        red = max(0, min(1, red))
        green = max(0, min(1, green))
        blue = max(0, min(1, blue))
        alpha = max(0, min(1, alpha))

        if alpha == 1 {
            // RGB
            return String(
                format: "#%02lX%02lX%02lX",
                Int(round(red * 255)),
                Int(round(green * 255)),
                Int(round(blue * 255))
            )
        } else {
            // RGBA
            return String(
                format: "#%02lX%02lX%02lX%02lX",
                Int(round(red * 255)),
                Int(round(green * 255)),
                Int(round(blue * 255)),
                Int(round(alpha * 255))
            )
        }
    }

}

let color = UIColor(red: 0.024, green: 0.031, blue: 0.043, alpha: 1)
print(color.toHex())
