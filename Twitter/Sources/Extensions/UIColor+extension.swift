import UIKit

extension UIColor {
    static var twitter: TwitterColorSpace = TwitterColorSpace()

    struct TwitterColorSpace {
        var primary: UIColor {
            UIColor(named: "Primary")!
        }

        var secondary: UIColor {
            UIColor(named: "Secondary")!
        }

        var darkGray: UIColor {
            UIColor(named: "DarkGray")!
        }

        var lightGray: UIColor {
            UIColor(named: "LightGray")!
        }
    }
}
