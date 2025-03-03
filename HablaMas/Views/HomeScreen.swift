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
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                    VStack{
                        Text("Current Topic:")
                        Text(topic)
                            .font(Font.system(size: 30, weight: .bold, design: .rounded))
                    }
                    .padding()
                    Spacer()
                    VStack{
                        Text("LV \(level)")
                            .font(Font.system(size: 30, weight: .bold, design: .monospaced))
                            .padding(0.1)
                        NavigationLink(destination: HomeScreen(topic: topic)){
                            Text("Leaderboard")
                                .frame(height: 50)
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
                NavigationLink(destination: HomeScreen(topic: topic)){
                    HStack{
                        Text("Flashcards")
                            .font(Font.system(size: 25, weight: .bold, design: .default))
                            .padding()
                        Text(" ")
                        Text(Image(systemName: "rectangle.fill.on.rectangle.fill"))
                            .padding()
                            .font(Font.system(size: 25, weight: .bold, design: .default))
                            
                    }
                        .frame(height: 120)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color(.secondary))
                        .border(Color(.secondary), width: 4)
                        .cornerRadius(7.5)
                }
                .padding()
                Text("Quiz Yourself!")
                    .font(Font.system(size: 30, weight: .bold, design: .rounded))
                HStack{
                    NavigationLink(destination: HomeScreen(topic: topic)){
                        Text("Multiple Choice")
                            .frame(height: 80)
                            .frame(maxWidth: .infinity)
                            .background(Color(.secondary))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    NavigationLink(destination: HomeScreen(topic: topic)){
                        Text("Written")
                            .frame(height: 80)
                            .frame(maxWidth: .infinity)
                            .background(Color(.secondary))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
                .padding()
                HStack(){
                    NavigationLink(destination: HomeScreen(topic: topic)){
                        Text("Grammar exercises")
                            .bold()
                            .frame(height: 80)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color(.secondary))
                            .border(Color(.secondary), width: 4)
                            .cornerRadius(7.5)
                    }
                    Text("  ")
                    ZStack{
                        Circle()
                            .stroke(lineWidth: 22.0)
                            .opacity(0.2)
                            .foregroundColor(.gray)
                        Circle()
                            .trim(from: 0, to: CGFloat(min(accuracy, 1.0)))
                            .stroke(style: StrokeStyle(lineWidth: 23.0, lineCap: .round, lineJoin: .round))
                            .foregroundColor(.accent)
                        
                    }
                    .frame(width:100)
                    .shadow(radius: 5)
                }
                .padding()
                NavigationLink(destination: HomeScreen(topic: topic)){
                    Text("Marathon Mode    \(Image(systemName: "flag.fill"))")
                        .frame(height: 80)
                        .frame(maxWidth: .infinity)
                        .background(Color(.secondary))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .font(Font.system(size: 18, weight: .regular, design: .default))
                        .padding()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HomeScreen(topic:"Transport")
}
