//
//  ContentView.swift
//  SwiftUIAnimation
//
//  Created by Vidhyapathi on 21/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    func randomCoordinates(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    var randomSize: CGFloat {
        return CGFloat.random(in: 10...300)
    }
    
    var randomScale: CGFloat {
        return CGFloat.random(in: 0.1...2.0)
    }
    
    var randomSpeed: Double {
        return Double.random(in: 0.025...1.0)
    }
    
    var randomDely: Double {
        return Double.random(in: 0...0.2)
    }
    
    var randomColor: Color {
        return Color.init(hue: .random(in: 0...1), saturation: .random(in: 0...1), brightness: .random(in: 0...1))
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0 ... randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundStyle(randomColor)
                        .opacity(0.5)
                        .frame(width: randomSize, height: randomSize, alignment: .center)
                        .scaleEffect(isAnimating ? randomScale : 1)
                        .position(x: randomCoordinates(max: geometry.size.width),
                                  y: randomCoordinates(max: geometry.size.height))
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .delay(randomDely)
                                .speed(randomSpeed)
                        )
                        .onAppear {
                            isAnimating = true
                        }
                }
            }
            .drawingGroup()
        }
    }
}

#Preview {
    ContentView()
}
