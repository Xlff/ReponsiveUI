//
//  Home.swift
//  ResponsiveUI
//
//  Created by xlf on 2022/3/11.
//

import SwiftUI

struct Home: View {
    
    @State var currentMenu: String = "Index"
    @State var showMenu: Bool = false
    var body: some View {
        ResponsiveView { prop in
            HStack(spacing: 0) {
                if prop.isLandscape {
                    SideBar(currentMenu: $currentMenu, prop: prop)
                }
                mainView(prop: prop)

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay {
                ZStack(alignment: .leading) {
                    if !prop.isLandscape {
                        Color.black
                            .opacity(showMenu ? 0.25: 0)
                            .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation {
                                    showMenu.toggle()
                                }
                            }
                        SideBar(currentMenu: $currentMenu, prop: prop)
                            .offset(x: showMenu ? 0 : -300)
                    }
                }
            }
        }
        .ignoresSafeArea(.container, edges: .leading)
    }
    
    //MARK: main View
    @ViewBuilder
    func mainView(prop: Properties) -> some View {
        VStack(spacing: 0) {
            
            HStack(spacing: 12) {
                if !prop.isLandscape {
                    Button {
                        withAnimation {
                            showMenu.toggle()
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                }
                TextField("search", text: .constant(""))
                Image(systemName: "magnifyingglass")
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
            .background {
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .fill(.white)
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
        .background {
            Color("BG")
                .ignoresSafeArea()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
