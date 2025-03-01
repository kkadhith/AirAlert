//
//  AirAlert.swift
//  AirAlert
//
//  Created by Adhith Karthikeyan on 2/8/25.
//  Licensed under Apache License v2.0
//

import SwiftUI

public struct AirAlert: View {
    public var title: String
    public var alertMessage: String
    
    public var mainButtonLabel: String
    public var secondButtonLabel: String
    
    public var mainButtonAction: () -> Void
    public var secondButtonAction: () -> Void
    
    public var isShowing: Binding<Bool>
    
    
    public init(title: String, alertMessage: String, mainButtonLabel: String, secondButtonLabel: String, mainButtonAction: @escaping () -> Void, secondButtonAction: @escaping () -> Void, isShowing: Binding<Bool>) {
        self.title = title
        self.alertMessage = alertMessage
        
        self.mainButtonLabel = mainButtonLabel
        self.secondButtonLabel = secondButtonLabel
        
        self.mainButtonAction = mainButtonAction
        self.secondButtonAction = secondButtonAction
        
        self.isShowing = isShowing
    }
    
    public var body: some View {
            VStack (spacing: 20){
                Text(title)
                    .font(Font.headline)
                    .bold()
                
                Text(alertMessage)
                    .font(Font.body)
                    .multilineTextAlignment(.center)
                
                HStack(spacing: 16) {
                    Button(action: {
                        secondButtonAction()
                        isShowing.wrappedValue = false
                    }) {
                        Text(secondButtonLabel)
                            .fontWeight(.medium)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .frame(minWidth: 80)
                    }
                    .buttonStyle(.bordered)
                    .tint(.black)
                    Button(action: {
                        mainButtonAction()
                        isShowing.wrappedValue = false
                    }) {
                        Text(mainButtonLabel)
                            .fontWeight(.medium)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .frame(minWidth: 80)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.black)
                }
            }
            .padding(24)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .shadow(radius: 8)
            )
            .padding(30)
            .frame(maxWidth: 375, maxHeight: 300)
        }
}
