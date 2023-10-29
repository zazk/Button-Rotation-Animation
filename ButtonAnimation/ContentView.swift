//
//  ContentView.swift
//  ButtonAnimation
//
//  Created by Juan de Dios on 27/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isRotatingFirst = 0.0
    @State private var isRotatingSecond = 0.0
    @State private var isRotatingThree = 0.0
    @State private var size: CGFloat = 0.8
    @State private var opacity = 0.2
    var repeatingAnimation: Animation {
        Animation
            .easeInOut(duration: 2) //.easeIn, .easyOut, .linear, etc...
            .repeatForever()
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, button!").padding()
            ZStack{
                Color.black
                RoundedRectangle(cornerRadius: 20.0)
                    .frame(width: 100,height: 90)
                    .foregroundColor(.green)
                    .opacity(opacity)
                    .shadow(color:.green, radius: 15)
                    .rotationEffect(.degrees(isRotatingFirst))
                    .onAppear {
                        withAnimation(
                            .linear(duration: 1)
                            .repeatForever(autoreverses: false)) {
                            isRotatingFirst = 90.0
                        }
                    }
                
                RoundedRectangle(cornerRadius: 15.0)
                    .frame(width: 100,height: 90)
                    .foregroundColor(.green)
                    .opacity(opacity)
                    .shadow(color:.green, radius: 15)
                    .rotationEffect(.degrees(isRotatingSecond))
                    .onAppear {
                        withAnimation(.linear(duration: 5)
                            .repeatForever(autoreverses: false)) {
                            isRotatingSecond = 270.0
                        }
                    }
                    .scaleEffect(size)
                    .onAppear {
                        withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) {
                            size = 1.1
                        }
                    }
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 100,height: 90)
                    .foregroundColor(.green)
                    .opacity(opacity)
                    .rotationEffect(.degrees(isRotatingThree))
                    .shadow(color:.green, radius: 10)
                    .onAppear {
                        withAnimation(.linear(duration: 10)
                            .repeatForever(autoreverses: false)) {
                                isRotatingThree = 360.0
                        }
                    }
                Circle()
                    .fill(RadialGradient(colors: [.clear,.green], center: .center, startRadius: 0.0, endRadius: 70))
                    .frame(width: 100, height: 100)
                    .opacity(100)
                    .shadow(color:.green, radius: 15)
                    
            }
        }
        .padding()
        .background(Color.black)
        
    }
}

#Preview {
    ContentView()
}
