//
//  loading_view.swift
//  new_creation_evangelism_paper
//
//  Created by 이원재 on 9/25/20.
//

import SwiftUI

struct loading_view: View {
    
    @State var show = false
    @EnvironmentObject var env_object: Env_object
    
    var body: some View {
        Group {
            if (!self.show) {
                ZStack {
                    Image("background1")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                    Image("n00")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            } else {
                withAnimation {
                    main_view()
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.show.toggle()
                }
            }
        }
        .statusBar(hidden: true)
    }
}

struct loading_view_Previews: PreviewProvider {
    static var previews: some View {
        loading_view()
    }
}
