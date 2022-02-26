//
//  CourseSectionContent.swift
//  CoursesView
//
//  Created by Алишер Алсейт on 27.09.2021.
//

import SwiftUI

struct CourseSectionContent: View {
    
    var body: some View {
        VStack {
            VStack (alignment: .leading, spacing: 20) {
                ForEach(contentText) { item in
                    Text(item.text).font(item.font)
                        .fontWeight(item.weight)
                    
                }
            }
            .padding(16)
            
        }
    }
}



struct CourseSectionContent_Previews: PreviewProvider {
    static var previews: some View {
        CourseSectionContent()
    }
}
