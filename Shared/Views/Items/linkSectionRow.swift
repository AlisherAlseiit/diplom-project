//
//  linkSectionRow.swift
//  diplom-project (iOS)
//
//  Created by Aurora on 05.03.2022.
//

import SwiftUI

struct linkSectionRow: View {
    var section: ListSection = firstListSections[0]
    var body: some View {
        VStack {
            HStack {
                Image(systemName: section.icon)
                    .foregroundColor(Color("screen3"))
                    .frame(width: 35)
                Text(section.title)
                
                Spacer()
                
                Image(systemName: "link")
                    .foregroundColor(.gray)
                
//                Spacer()
            }
        }
    }
}

struct linkSectionRow_Previews: PreviewProvider {
    static var previews: some View {
        linkSectionRow()
    }
}
