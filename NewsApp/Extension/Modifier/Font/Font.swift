

import SwiftUI

struct CustomFont: ViewModifier {
    var font : FontType
    var size : CGFloat
    func body(content: Content) -> some View {
        content
            .font(.custom(font.rawValue, size: size))
    }
}


