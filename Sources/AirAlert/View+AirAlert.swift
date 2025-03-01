//
//  View+AirAlert.swift
//  AirAlert
//
//  Created by Adhith Karthikeyan on 2/8/25.
//  Licensed under Apache License v2.0
//


import SwiftUI

public extension View {
    func airAlert(isPresented: Binding<Bool>, title: String, alertMessage: String, mainButtonLabel: String, secondButtonLabel: String, mainButtonAction: @escaping () -> Void, secondButtonAction: @escaping () -> Void) -> some View {
        ZStack {
            self
            
            ZStack {
                if (isPresented.wrappedValue) {
                    
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                    AirAlert(title: title, alertMessage: alertMessage, mainButtonLabel: mainButtonLabel, secondButtonLabel: secondButtonLabel, mainButtonAction: mainButtonAction, secondButtonAction: secondButtonAction, isShowing: isPresented)
                        .transition(.scale(scale: 0.8).combined(with:.opacity))
                }
            }
        }
        
        .animation(.spring(response:0.3, dampingFraction: 0.75), value: isPresented.wrappedValue)
    }
}
