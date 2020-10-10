//
//  Sidebar.swift
//  new_creation_evangelism_paper
//
//  Created by 이원재 on 9/24/20.
//

import SwiftUI

struct first_side_bar: View {
    // side_bar_items array is relatetd to section attribute in the page struct
    // section = 1 represents that it is 1과
    // section = 0 represents it is neither.
    @EnvironmentObject var env_object: Env_object
    @State private var is_expanded: [Bool] = [false, false, false, false]
    let message = "펼치기"

//    init() {
//        UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//    }

    var body: some View {

        Group {

            List {
                Button(action: {
                    env_object.index = 50 // index number of the page
                    env_object.show_side_bar.toggle()
                    env_object.changed.toggle()
                    env_object.is_first_launch = false
                } ) {
                    HStack {
                        Image("icon")
                            .resizable()
                            .cornerRadius(10.0)
                            .frame(width: 45, height: 45)
                        Text("새로운 피조물 전도지")
                            .bold()
                            .font(.system(size: 20))
                    }
                }
                
                DisclosureGroup(isExpanded: $is_expanded[0]) {
                    ForEach(one, id: \.id) { page in
                        side_row(page: page)
                    }
                } label: {
                    Text("1과 복음이란 무엇인가" + index_spacing)
                        .font(.headline)
                        .contentShape(Rectangle())
                        .onTapGesture {
                        withAnimation {
                            self.is_expanded[0].toggle()
                            }
                        }
                }
                
                DisclosureGroup(isExpanded: $is_expanded[1]) {
                    ForEach(two, id: \.id) { page in
                        side_row(page: page)
                    }
                } label: {
                    Text("2과 그리스도인은 누구인가?" + index_spacing)
                        .font(.headline)
                        .contentShape(Rectangle())
                        .onTapGesture {
                        withAnimation {
                            self.is_expanded[1].toggle()
                            }
                        }
                }
                
                DisclosureGroup(isExpanded: $is_expanded[2]) {
                    ForEach(three, id: \.id) { page in
                        side_row(page: page)
                    }
                } label: {
                    Text("3과 그리스도인은 어떻게 사는가?" + index_spacing)
                        .font(.headline)
                        .contentShape(Rectangle())
                        .onTapGesture {
                        withAnimation {
                            self.is_expanded[2].toggle()
                            }
                        }
                }
                               
                DisclosureGroup(isExpanded: $is_expanded[3]) {
                    ForEach(five, id: \.id) { page in
                        side_row(page: page)
                    }
                } label: {
                    Text("부록: 사도 바울의 기도" + index_spacing)
                        .font(.headline)
                        .contentShape(Rectangle())
                        .onTapGesture {
                        withAnimation {
                            self.is_expanded[3].toggle()
                            }
                        }
                }

                HStack {
                    Image("faithbook")
                        .resizable()
                        .cornerRadius(10.0)
                        .frame(width: 35, height: 35)

                    Link(destination: URL(string: "http://faithbook.kr/")!) {
                        Text("믿음의 말씀사 바로가기")
                            .bold()
                            .font(.headline)
                    }
                }

                HStack {
                    Image("new_creation")
                        .resizable()
                        .cornerRadius(10.0)
                        .frame(width: 35, height: 35)
                    Link(destination: URL(string: "https://apps.apple.com/kr/app/%EC%83%88%EB%A1%9C%EC%9A%B4-%ED%94%BC%EC%A1%B0%EB%AC%BC-%EA%B3%A0%EB%B0%B1%EA%B8%B0%EB%8F%84%EC%A7%91/id515825238")!) {
                        Text("새로운 피조물의 고백기도집")
                            .bold()
                            .font(.headline)
                    }
                }

                HStack {
                    Image("suggestion")
                        .resizable()
                        .frame(width: 35, height: 35)
                    Link(destination: URL(string: "https://open.kakao.com/o/siHQNXyc" )!) {
                        Text("개발자에게 제안하기")
                            .bold()
                            .font(.headline)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
    }
}

struct first_side_bar_Previews: PreviewProvider {
    static var previews: some View {
        first_side_bar()
            .previewDevice("iPhone 8")
    }
}
