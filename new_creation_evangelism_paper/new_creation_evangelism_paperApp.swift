//
//  new_creation_evangelism_paperApp.swift
//  new_creation_evangelism_paper
//
//  Created by 이원재 on 9/24/20.
//

import SwiftUI

@main
struct new_creation_evangelism_paperApp: App {
    var body: some Scene {
        WindowGroup {
            loading_view().environmentObject(Env_object())
        }
    }
}


