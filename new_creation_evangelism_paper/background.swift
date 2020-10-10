//
//  background.swift
//  new_creation_evangelism_paper
//
//  Created by 이원재 on 9/27/20.
//

import SwiftUI

struct background: View {
    var body: some View {
        
        Image("background2")
        .resizable()
        .edgesIgnoringSafeArea(.all)
    }
}

struct background_Previews: PreviewProvider {
    static var previews: some View {
        background()
    }
}
