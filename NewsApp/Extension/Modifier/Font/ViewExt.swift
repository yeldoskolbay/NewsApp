
import SwiftUI

extension View {
    func font(type: FontType = .regular, size: CGFloat = 16) -> some View {
        modifier(CustomFont(font: type, size: size))
    }
}
