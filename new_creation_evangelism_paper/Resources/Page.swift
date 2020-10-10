//
//  Page.swift
//  new_creation_evangelism_paper
//
//  Created by 이원재 on 9/24/20.
//

import Foundation

struct Page : Decodable, Hashable, Identifiable {
    var id : Int
    var filename : String
    var title : String
    var section : Int
}
