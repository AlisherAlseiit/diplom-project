//
//  SectionTitle.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 04.03.2022.
//

import SwiftUI

struct SectionTitle: View {
    var title = "Categories"
    var body: some View {
        HStack {
            Text(title).bold()
                .padding(.top, 10)
                Spacer()
        }
    }
}

struct SectionTitle_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitle()
    }
}
