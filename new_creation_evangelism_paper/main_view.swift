//
//  main_view.swift
//  new_creation_evangelism_paper
//
//  Created by 이원재 on 9/25/20.
//

import SwiftUI

struct main_view: View {
    
    @EnvironmentObject var env_object: Env_object
    
    var body: some View {
    
        Group {
            GeometryReader { geometry in
                ContentView()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
                ZStack(alignment: .leading) {
                    
                    ContentView()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .onTapGesture {
                            withAnimation {
                                if env_object.show_side_bar {
                                    env_object.show_side_bar = false
                                }
                            }
                        }
                    if env_object.is_first_launch {
//                        side_bar()
                        first_side_bar()
                    }

                    else if env_object.show_side_bar {
                            side_bar()
                                .frame(width: geometry.size.width/2.02, height: geometry.size.height)
//                                .transition(.move(edge: .leading))
                                .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
                    }
                    
                    Group { //arrows
                        if (!env_object.show_side_bar && !env_object.is_verse_view) {
                            arrows()
                    }
                }
                
                }
            }
        }
        .onAppear {
            withAnimation {
                env_object.show_side_bar.toggle()
            }
        }
        
    }
}

struct main_view_Previews: PreviewProvider {
    static var previews: some View {
        main_view().environmentObject(Env_object())
    }
}
