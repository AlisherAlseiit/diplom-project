//
//  LibraryContent.swift
//  iOS
//
//  Created by Meng To on 6/29/20.
//

import SwiftUI

struct LibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(
            CourseSectionContent(),
            category: .control
        )
    }
    
    @LibraryContentBuilder
    func modifiers(base: Image) -> [LibraryItem] {
        LibraryItem(
            base.cardStyle(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
        )
    }
}

extension View {
    func cardStyle(color: Color) -> some View {
        #if os(iOS)
        let cornerRadius: CGFloat = 30
        #else
        let cornerRadius: CGFloat = 10
        #endif
        return self
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .shadow(color: color.opacity(0.3), radius: 20, x: 0, y: 10)
    }
    
    func gradientStyle(color1: Color, color2: Color) -> some View {
        return self
            .background(GradientView(color1: color1, color2: color2))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: color1.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}

struct GradientView: View {
    var color1: Color = Color(#colorLiteral(red: 0, green: 0.47843137383461, blue: 1, alpha: 1))
    var color2: Color = Color(#colorLiteral(red: 0.3125, green: 0.6414217948913574, blue: 1, alpha: 1))
    var body: some View {
        LinearGradient(
            gradient: Gradient(stops: [
                                .init(color: color1, location: 0),
                                .init(color: color2, location: 1)]),
            startPoint: UnitPoint(x: 1, y: 0),
            endPoint: UnitPoint(x: 0, y: 1))
    }
}

struct BlurView: View {
    var body: some View {
        #if os(iOS)
        return VisualEffectBlur(blurStyle: .systemMaterial)
        #else
        return VisualEffectBlur()
        #endif
    }
}

extension RandomAccessCollection {
    func indexed() -> Array<(offset: Int, element: Element)> {
        Array(enumerated())
    }
}
