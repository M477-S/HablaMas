//
//  MarathonScreen.swift
//  HablaMas
//
//  Created by Matthew Stanciu on 10/03/2025.
//

import SwiftUI

struct MarathonScreen: View {
    @State var screenMultiplier = 0.1
    @State var lives: Int = 3
    @State var questionsCorrect = 2.0
    @State var currentQuestion = "Question"
    @State var currentAnswer = "Answer"
    @State var randomPos = [0,0]
    @State var questionFreq = 2
    @State var best = 20.0
    var body: some View {
        NavigationView(){
            GeometryReader() { geometry in
                VStack{
                    HStack{
                        ForEach(0..<lives, id: \.self) { _ in
                            Image(systemName: "heart.fill")
                                .foregroundColor(Color(.secondary))
                                .font(.largeTitle)
                        }
                        ForEach(lives..<5, id: \.self) { _ in
                            Image(systemName: "heart")
                                .foregroundColor(.red)
                                .font(.largeTitle)
                        }
                        Text("  ")
                        VStack{
                            Text("\(Int(questionsCorrect))")
                                .font(Font.system(size: 40, weight: .bold, design: .rounded))
                            Text(UIDevice.current.name.contains("SE") ? "Correct" : "Questions correct")
                                .font(Font.system(size: 18, weight: .light, design: .rounded))
                                .multilineTextAlignment(.center)
                        }
                    }
                    Text(currentQuestion)
                        .font(Font.system(size: 300*screenMultiplier, weight: .bold, design: .rounded))
                    HStack{
                        ForEach(0..<questionFreq, id:\.self) { x in
                            VStack{
                                ForEach(0..<questionFreq, id:\.self) { y in
                                    Text(randomPos == [x, y] ? currentAnswer : "Example")
                                        .frame(height: geometry.size.height * screenMultiplier *  2)
                                        .frame(maxWidth: .infinity)
                                        .background(.accent)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                }
                            }
                        }
                    }
                    .padding()
                    HStack{
                        Spacer()
                        VStack{
                            Text("Personal Best:")
                            Text("\(Int(best))")
                                .font(Font.system(size: 22, weight: .heavy, design: .rounded))
                        }
                        VStack{
                            Text(" ")
                            Image(systemName: "flag")
                                .foregroundColor(Color(.secondary))
                                .scaleEffect(CGSize(width: 2.2, height: 2.6))
                                .frame(height:0.5)
                                .padding()
                        }
                    }
                    HStack{
                        ProgressView(value: questionsCorrect, total: best)
                            .progressViewStyle(LinearProgressViewStyle())
                            .scaleEffect(CGSize(width: 1, height: 10))
                            .shadow(radius: 5)
                            .padding()
                        Text("   ")
                    }
                    NavigationLink(destination: HomeScreen(topic: "")) {
                        Text("Back to Home Screen")
                            .bold()
                            .frame(height: geometry.size.height * screenMultiplier)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color(.secondary))
                            .border(Color(.secondary), width: 4)
                            .cornerRadius(7.5)
                            .padding()
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .onAppear(){
                if UIDevice.current.name.contains("SE"){
                    screenMultiplier = 0.09
                }
                randomPos = [Int.random(in: 0..<questionFreq), Int.random(in: 0..<questionFreq)]
            }
        }
    }
}

#Preview {
    MarathonScreen()
}
