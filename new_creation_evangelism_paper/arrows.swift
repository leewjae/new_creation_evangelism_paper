//
//  arrows.swift
//  new_creation_evangelism_paper
//
//  Created by 이원재 on 9/25/20.
//

import SwiftUI

struct arrows: View {
    
    @EnvironmentObject var env_object: Env_object
    
    var body: some View {
        HStack {
            //go to prev
            if env_object.index > 2 && env_object.index != 50 { // neither first nor last
                Button(action: {
                    env_object.index = env_object.index - 2
                    env_object.motion = "left"
                    env_object.changed.toggle()
                }) {
                    Image("leftarrow")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width : 100, height : 100)
                    .padding()
                }
            }
            Spacer()
            
            //go to next view
            if (env_object.index < index_last_page && env_object.index != 0) {
                Button(action: {
                    env_object.index = env_object.index + 2
                    env_object.motion = "right"
                    env_object.changed.toggle()
                }) {
                    Image("rightarrow")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width : 100, height : 100)
                    .padding()
                }
            }
            }
        .edgesIgnoringSafeArea(.all)
    }
}

struct arrows_Previews: PreviewProvider {
    static var previews: some View {
        arrows().environmentObject(Env_object())
    }
}
