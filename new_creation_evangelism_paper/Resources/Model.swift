//
//  Model.swift
//  new_creation
//
//  Created by 이원재 on 9/4/20.
//  Copyright © 2020 이원재. All rights reserved.
//

import Foundation

//page_data stores the data for the page structure that will be used in the app.
let page_data: [Page] = load("pageData.json")

//last arrow number

let last_arrow_number = 42
let last_bible_number = 42
let index_paul_prayer = 44
let index_last_page = 48

//page_data filtered by the section number

let one = page_data.filter { page in
    return (page.section == 1)
}

let two = page_data.filter { page in
    return (page.section == 2)
}

let three = page_data.filter { page in
    return (page.section == 3)
}

let four = page_data.filter { page in
    return (page.section == 4)
}

let five = page_data.filter { page in
    return (page.section == 5)
}


//side_bar_items

let side_bar_items = ["제 1과 복음이란 무엇인가", "제 2과 그리스도인은 누구인가?", "제 3과 그리스도인은 어떻게 사는가?",
                      "제 4과 그리스도의 대사들", "믿음의 말씀사 바로가기", "새로운 피조물 고백기도집"]

let font_size = 20
//page_index

let index_spacing = "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            "
//index_spacing is 40 tap characters.

let animation_duration = 0.633
let button_opacity = 0.4

class Env_object: ObservableObject {
    @Published var index = 0
    @Published var changed = true
    @Published var show_side_bar = false
    @Published var is_verse_view = false
    @Published var motion = "right"
    @Published var is_first_launch = true
    @Published var is_paul_prayer = false
    
    @Published var show_first_menu = false
    @Published var show_second_menu = false
    @Published var show_third_menu = false
    @Published var show_fourth_menu = false
    @Published var show_fifth_menu = false
    
    
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


