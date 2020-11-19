//  Created by Tymoteusz Stokarski on 19/11/2020.
//

import UIKit

extension  UITextField {
   @objc func doneButtonTapped(button:UIBarButtonItem) -> Void {
      self.resignFirstResponder()
   }
}
