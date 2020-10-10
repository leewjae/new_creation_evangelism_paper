//
//  side_row.swift
//  new_creation_evangelism_paper
//
//  Created by 이원재 on 9/25/20.
//

import SwiftUI

struct side_row: View {
    
    var page : Page
    @EnvironmentObject var env_object: Env_object
    
    var body: some View {
        Button(action: {
            env_object.index = page.id
            env_object.show_side_bar.toggle()
            env_object.changed.toggle()
            env_object.is_first_launch = false
            env_object.motion = "left"
            // when clicks the side row, make it appear from the left side.
        } ) {
            HStack {
                Image(page.filename)
                    .resizable()
                    .cornerRadius(3.0)
                    .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text(page.title)
            }
        }
        
        .buttonStyle(PlainButtonStyle())
    }
}

struct side_row_Previews: PreviewProvider {
    static var previews: some View {
        side_row(page: page_data[2])
        side_row(page: page_data[8])
    }
}
