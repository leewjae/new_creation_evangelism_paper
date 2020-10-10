//
//  ContentView.swift
//  new_creation_evangelism_paper
//
//  Created by 이원재 on 9/24/20.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var env_object: Env_object

    var body: some View {
        
        Group { // Background Image + Contents
            if env_object.index == 0
            {
                Image("background1")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            }
            
            //picture page
            else if (!env_object.is_verse_view && env_object.index < index_paul_prayer) // green background only on photo
            {
                Image("background2")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            }
            
            // verse & confession page, white
            else
            {
                Image("background3")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            }
            
        }
        
        
        Group { // contents
            if env_object.changed {
                if env_object.motion == "left" {
                        Image(page_data[env_object.index].filename)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .transition(.move(edge: .leading))
                            .animation(.easeInOut(duration: animation_duration))
                }
                else if env_object.motion == "right" {
                        Image(page_data[env_object.index].filename)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .transition(.move(edge: .trailing))
                            .animation(.easeInOut(duration: animation_duration))
                }
                else if env_object.motion == "down" {
                    Image(page_data[env_object.index].filename)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .transition(.move(edge: .top))
                        .animation(.easeInOut(duration: animation_duration))
                }
                else if env_object.motion == "up" {
                    Image(page_data[env_object.index].filename)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut(duration: animation_duration))
                } else {
                    Image(page_data[env_object.index].filename)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            
            else if !env_object.changed {
                if env_object.motion == "left" {
                        Image(page_data[env_object.index].filename)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .transition(.move(edge: .leading))
                            .animation(.easeInOut(duration: animation_duration))
                }
                else if env_object.motion == "right" {
                        Image(page_data[env_object.index].filename)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .transition(.move(edge: .trailing))
                            .animation(.easeInOut(duration: animation_duration))
                }
                else if env_object.motion == "down" {
                    Image(page_data[env_object.index].filename)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .transition(.move(edge: .top))
                        .animation(.easeInOut(duration: animation_duration))
                }
                else if env_object.motion == "up" {
                    Image(page_data[env_object.index].filename)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut(duration: animation_duration))
                } else {
                    Image(page_data[env_object.index].filename)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
        }

        
        // show_side_bar button and verse button should only shown
        // if and only if object.show_side_bar is false (no sidebar)
        if (!env_object.show_side_bar) {
            VStack {
                HStack {
                    Group { // Go to verse or Go back to the verse
                        if env_object.is_verse_view { // now in verse
                            Button(action: {
                                    env_object.index = env_object.index - 1
                                    env_object.is_verse_view = false
                                    env_object.motion = "up"
                            }) {
                                Image("uparrow2")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .opacity(button_opacity)
                            }
                        } else if (env_object.index != 0 && env_object.index <= last_bible_number) {
                            Button(action: {
                                    env_object.index = env_object.index + 1
                                    env_object.is_verse_view = true
                                    env_object.motion = "down"
                            }) {
                                Image("bible2")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .opacity(button_opacity)
                            }
                        }
                    }
                    
                    Spacer() //SPACER//
                    
                    Group { // show_side_bar button
                        if !env_object.is_verse_view {
                            Button(action: {
                                withAnimation {
                                    env_object.show_side_bar.toggle()
                                }
                            }) {
                                Image("side_bar")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .opacity(button_opacity)
                            }
                        }
                    }
                    
                }
                .padding()
                Spacer()
            }
            .statusBar(hidden: true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Env_object())
    }
}
