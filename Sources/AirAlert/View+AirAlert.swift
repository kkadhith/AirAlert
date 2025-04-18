//
//  View+AirAlert.swift
//  AirAlert
//
//  Created by Adhith Karthikeyan on 2/8/25.
//  Licensed under Apache License v2.0
//


import SwiftUI

public extension View {
    func airAlert(isPresented: Binding<Bool>, textString: Binding<String>?, title: String, alertMessage: String?, mainButtonLabel: String, secondButtonLabel: String, textFieldLabel: String?, mainButtonAction: @escaping () -> Void, secondButtonAction: @escaping () -> Void) -> some View {
        ZStack {
            self
            
            ZStack {
                if (isPresented.wrappedValue) {
                    
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                    AirAlert(title: title, alertMessage: alertMessage, mainButtonLabel: mainButtonLabel, secondButtonLabel: secondButtonLabel, textFieldLabel: textFieldLabel, mainButtonAction: mainButtonAction, secondButtonAction: secondButtonAction, isShowing: isPresented, textString: textString)
                        .transition(.scale(scale: 0.6).combined(with:.opacity))
                }
            }
        }
        .animation(.spring(response:0.25, dampingFraction: 1), value: isPresented.wrappedValue)
        .sensoryFeedback(SensoryFeedback.increase, trigger: isPresented.wrappedValue)
    }
    
    func airAlert(isPresented: Binding<Bool>, title: String, mainButtonLabel: String, secondButtonLabel: String, mainButtonAction: @escaping () -> Void, secondButtonAction: @escaping () -> Void) -> some View {
        airAlert(isPresented: isPresented, textString: nil, title: title, alertMessage: nil, mainButtonLabel: mainButtonLabel, secondButtonLabel: secondButtonLabel, textFieldLabel: nil, mainButtonAction: mainButtonAction, secondButtonAction: secondButtonAction)
    }
    
    func airAlert(isPresented: Binding<Bool>, title: String, alertMessage: String, mainButtonLabel: String, secondButtonLabel: String, mainButtonAction: @escaping () -> Void, secondButtonAction: @escaping () -> Void) -> some View {
        airAlert(isPresented: isPresented, textString: nil, title: title, alertMessage: alertMessage, mainButtonLabel: mainButtonLabel, secondButtonLabel: secondButtonLabel, textFieldLabel: nil, mainButtonAction: mainButtonAction, secondButtonAction: secondButtonAction)
    }
    
    func airAlert(isPresented: Binding<Bool>, textString: Binding<String>, title: String, mainButtonLabel: String, secondButtonLabel: String, textFieldLabel: String, mainButtonAction: @escaping () -> Void, secondButtonAction: @escaping () -> Void) -> some View {
        airAlert(isPresented: isPresented, textString: textString, title: title, alertMessage: nil, mainButtonLabel: mainButtonLabel, secondButtonLabel: secondButtonLabel, textFieldLabel: textFieldLabel, mainButtonAction: mainButtonAction, secondButtonAction: secondButtonAction)
    }
    
}
