//
//  ContentView.swift
//  HablaMas
//
//  Created by Matthew Stanciu on 02/03/2025.
//

import SwiftUI

struct HomeScreen: View {
    @State var progress = 2.0
    @State var total = 10.0
    @State var topic: String
    @State var level = "1"
    @State var accuracy = 0.8
    @State var screenMultiplier = 0.1
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    HStack {
                        VStack {
                            Text("Current Topic:")
                            Text(topic)
                                .font(Font.system(size: 30, weight: .bold, design: .rounded))
                        }
                        .padding()
                        Spacer()
                        VStack {
                            Text("LV \(level)")
                                .font(Font.system(size: 300*screenMultiplier, weight: .bold, design: .monospaced))
                            NavigationLink(destination: HomeScreen(topic: topic)) {
                                Text("Leaderboard")
                                    .frame(height: geometry.size.height * screenMultiplier *  0.7)
                                    .frame(maxWidth: .infinity)
                                    .background(.accent)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            }
                        }
                        .padding()
                    }
                    
                    ProgressView(value: progress, total: total)
                        .progressViewStyle(LinearProgressViewStyle())
                        .scaleEffect(CGSize(width: 1, height: 10))
                        .shadow(radius: 5)
                        .padding()
                    
                    NavigationLink(destination: HomeScreen(topic: topic)) {
                        HStack {
                            Text("Flashcards")
                                .font(Font.system(size: geometry.size.width * 0.07, weight: .bold, design: .default))
                                .padding()
                            Text(Image(systemName: "rectangle.fill.on.rectangle.fill"))
                                .padding()
                                .font(Font.system(size: geometry.size.width * 0.07, weight: .bold, design: .default))
                        }
                        .frame(height: geometry.size.height * screenMultiplier * 1.5)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color(.secondary))
                        .border(Color(.secondary), width: 4)
                        .cornerRadius(7.5)
                    }
                    .padding()
                    
                    Text("Quiz Yourself!")
                        .font(Font.system(size: 300*screenMultiplier, weight: .bold, design: .rounded))
                    
                    HStack {
                        NavigationLink(destination: HomeScreen(topic: topic)) {
                            Text("Multiple Choice")
                                .frame(height: geometry.size.height * screenMultiplier)
                                .frame(maxWidth: .infinity)
                                .background(Color(.secondary))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                        NavigationLink(destination: HomeScreen(topic: topic)) {
                            Text("Written")
                                .frame(height: geometry.size.height * screenMultiplier)
                                .frame(maxWidth: .infinity)
                                .background(Color(.secondary))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                    }
                    .padding()
                    
                    HStack {
                        NavigationLink(destination: HomeScreen(topic: topic)) {
                            Text("Grammar exercises")
                                .bold()
                                .frame(height: geometry.size.height * screenMultiplier)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color(.secondary))
                                .border(Color(.secondary), width: 4)
                                .cornerRadius(7.5)
                        }
                        Text("  ")
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 22.0)
                                .opacity(0.2)
                                .foregroundColor(.gray)
                            Circle()
                                .trim(from: 0, to: CGFloat(min(accuracy, 1.0)))
                                .stroke(style: StrokeStyle(lineWidth: 23.0, lineCap: .round, lineJoin: .round))
                                .foregroundColor(.accent)
                        }
                        .frame(width: geometry.size.width * 2 * screenMultiplier)
                        .shadow(radius: 5)
                        Text(" ")
                    }
                    .padding()
                    
                    NavigationLink(destination: MarathonScreen()) {
                        Text("Marathon Mode    \(Image(systemName: "flag.fill"))")
                            .frame(height: geometry.size.height * screenMultiplier)
                            .frame(maxWidth: .infinity)
                            .background(Color(.secondary))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .font(Font.system(size: geometry.size.width * 0.05, weight: .regular, design: .default))
                            .padding()
                    }
                }
            }
            .onAppear(){
                if UIDevice.current.name.contains("SE"){
                    screenMultiplier = 0.092
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HomeScreen(topic: "Transport")
}
