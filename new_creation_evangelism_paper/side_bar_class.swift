//
//  side_bar_class.swift
//  new_creation_evangelism_paper
//
//  Created by 이원재 on 9/29/20.
//

import Foundation

struct Sidebar: Identifiable {
    var id = UUID()
    var name: String
    var sub_menu_items: [side_row]?
}
