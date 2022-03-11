//
//  SideBar.swift
//  ResponsiveUI
//
//  Created by xlf on 2022/3/11.
//

import SwiftUI

struct SideBar: View {
    @Binding var currentMenu: String
    var prop: Properties
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                Image("user")
                    .frame(width: 60, height: 60)
                    .clipped()
                    
                SidebarButton(icon: "tray.and.arrow.down.fill", title: "Index")
                    .padding(.top, 40)
                SidebarButton(icon: "paperplane", title: "Sent")
                SidebarButton(icon: "doc.fill", title: "Draft")
                SidebarButton(icon: "trash", title: "Deleted")
            }
            .padding()
            .padding(.top)
        }
        .padding(.leading, 10)
        .frame(width: (prop.isLandscape ? prop.size.width : prop.size.height) / 4 > 300 ? 300 : (prop.isLandscape ? prop.size.width : prop.size.height) / 4)
        .background {
            Color("LightWhite")
                .ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    func SidebarButton(icon: String, title: String) -> some View {
        Button {
            currentMenu = title
        } label: {
            VStack {
                HStack(spacing: 10) {
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.black)
                        .opacity(currentMenu == title ? 1 : 0)
                    
                    Image(systemName: icon)
                        .font(.callout)
                        .foregroundColor(currentMenu == title ? Color("DarkBlue"): .gray)
                    Text(title)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(currentMenu == title ? .black : .gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
            }
        }
    }
}


struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
