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
    public var alertMessage: String?
    
    public var mainButtonLabel: String
    public var secondButtonLabel: String
    public var textFieldLabel: String?
    
    public var mainButtonAction: () -> Void
    public var secondButtonAction: () -> Void
    
    public var isShowing: Binding<Bool>
    public var textString: Binding<String>?
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @FocusState private var isFocused: Bool
    
    public init(title: String, alertMessage: String? = nil, mainButtonLabel: String, secondButtonLabel: String, textFieldLabel: String? = nil, mainButtonAction: @escaping () -> Void, secondButtonAction: @escaping () -> Void, isShowing: Binding<Bool>, textString: Binding<String>? = nil) {
        self.title = title
        self.alertMessage = alertMessage
        
        self.mainButtonLabel = mainButtonLabel
        self.secondButtonLabel = secondButtonLabel
        self.textFieldLabel = textFieldLabel
        
        self.mainButtonAction = mainButtonAction
        self.secondButtonAction = secondButtonAction
        
        self.isShowing = isShowing
        self.textString = textString
    }
    
    public var body: some View {
            VStack (spacing: 20){
                Text(title)
                    .font(Font.headline)
                    .bold()
                
                if let alertMessage = alertMessage {
                    Text(alertMessage)
                        .font(Font.body)
                        .multilineTextAlignment(.center)
                }
                
                if let textFieldLabel = textFieldLabel, let textString = textString {
                    TextField(textFieldLabel, text: textString)
                        .textFieldStyle(.roundedBorder)
                        .focused($isFocused)
                }
                
                HStack(spacing: 16) {
                    Button(action: {
                        secondButtonAction()
                        isFocused = false
                        isShowing.wrappedValue = false
                    }) {
                        Text(secondButtonLabel)
                            .fontWeight(.medium)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .frame(minWidth: 80)
                    }
                    .buttonStyle(.bordered)
                    .tint(colorScheme == ColorScheme.light ? .black : .white)
                    Button(action: {
                        mainButtonAction()
                        isFocused = false
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
                    .fill(colorScheme == ColorScheme.light ? Color.white : Color(UIColor.darkGray))
                    .shadow(radius: 8)
            )
            .padding(30)
            .frame(maxWidth: 375, maxHeight: 300)
        }
}
