

import SwiftUI
import SDWebImageSwiftUI
struct NewsImage: View {
    let urlString: String?
    
    private var safeURL: URL? {
        guard let s = urlString, let url = URL(string: s),
              url.scheme?.lowercased() == "https" else { return nil }
        return url
    }
    
    var body: some View {
        let url = URL(string: urlString ?? "")
        WebImage(url: url)
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .clipped()
    }
}
