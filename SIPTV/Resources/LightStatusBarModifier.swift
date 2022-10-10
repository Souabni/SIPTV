//
//  LightStatusBarModifier.swift
//  SIPTV
//
//  Created by Souabni Issam on 30/08/2022.
//

import UIKit
import SwiftUI

struct LightStatusBarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onAppear {
                UIApplication.shared.statusBarStyle = .lightContent
            }
           
    }
}

extension View {
    func enableLightStatusBar() -> some View {
        self.modifier(LightStatusBarModifier())
    }
}
