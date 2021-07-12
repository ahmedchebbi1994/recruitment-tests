//
//  UIColors+Extension.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 11/07/2021.
//

import UIKit

extension UIColor {

   /// Creates a color object that generates its color data dynamically using the specified colors. For early SDKs creates light color.
   /// - Parameters:
   ///   - light: The color for light mode.
   ///   - dark: The color for dark mode.
   public convenience init(light: UIColor, dark: UIColor) {

       if #available(iOS 13.0, *) {
           self.init { traitCollection in
               if traitCollection.userInterfaceStyle == .dark {
                   return dark
               }
               return light
           }
       } else {
           self.init(cgColor: light.cgColor)
       }
   }
   
   
   // ===============
   // MARK: Constants
   // ===============
   static let corporateBlack = UIColor(light: .black, dark: .white)
   static let corporateWhite = UIColor(light: .white, dark: .black)
   static let corporateLightGray = UIColor(light: #colorLiteral(red: 0.9762231708, green: 0.98024863, blue: 0.9925644994, alpha: 1), dark: #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1))

   static let corporateDarkBlue = UIColor(light: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), dark: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
   static let corporateGolden = UIColor(light: #colorLiteral(red: 0.9672879577, green: 0.6819911003, blue: 0.1908527017, alpha: 1), dark: #colorLiteral(red: 0.9672879577, green: 0.6819911003, blue: 0.1908527017, alpha: 1))

}


extension Sequence where Element: Hashable {
    var histogram: [Element: Int] {
        return self.reduce(into: [:]) { counts, elem in counts[elem, default: 0] += 1 }
    }
}

extension String {

  /// Apply strike font on text
  func strikeThrough() -> NSAttributedString {
    let attributeString = NSMutableAttributedString(string: self)
    attributeString.addAttribute(
      NSAttributedString.Key.strikethroughStyle,
      value: 1,
      range: NSRange(location: 0, length: attributeString.length))

      return attributeString
     }
}
