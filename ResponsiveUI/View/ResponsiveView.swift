//
//  ResponsiveView.swift
//  ResponsiveUI
//
//  Created by xlf on 2022/3/11.
//

import SwiftUI

// 根据布局和设备来绘制view
struct ResponsiveView<Content: View>: View {
    
    var content: (Properties) -> Content
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            let isLandscape = size.width > size.height
            let isiPad = UIDevice.current.userInterfaceIdiom == .pad
            content(Properties(isLandscape: isLandscape, isiPad: isiPad, size: size))
        }
    }
}

struct Properties {
    var isLandscape: Bool
    var isiPad: Bool
    var size: CGSize
}
