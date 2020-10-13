//
//  ContentView.swift
//  WarCardGame
//
//  Created by Sneha Mehra on 10/9/20.
//  Copyright © 2020 Sneha Mehra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var randNum1 = 2
    @State private var randNum2 = 2
    
    @State private var score1 = 0
    @State private var score2 = 0

    var body: some View {
        
        ZStack {
            Image("background").resizable()
            .edgesIgnoringSafeArea(.all)
            VStack
                {
                    Spacer()
                    Image("logo")
                    
                    Spacer()
               
                    HStack
                        {
                            Image("card" + String(randNum1))
                                .padding(.leading, 50)
                            Spacer()
                            Image("card" + String(randNum2))
                                .padding(.trailing, 50)
                        }
                    
                    Spacer()
                    
                    Button(action: {
                        
                        //Randomize the state properties
                        self.randNum1 = Int.random(in: 2...14)
                        self.randNum2 = Int.random(in: 2...14)
                        
                        //update scores
                        if self.randNum1 > self.randNum2 {
                            self.score1 += 1
                        }
                        
                        else if self.randNum1 < self.randNum2 {
                        self.score2 += 1
                        }
                        
                    }, label: {
                        Image("dealbutton").renderingMode(.original)
                    })
                    Spacer()
                    
                    HStack {
                        VStack {
                            Text("Player")
                                .bold()
                                .padding(.bottom, 20)
                            Text(String(score1))
                            }.padding(.leading, 20)
                            .foregroundColor(.white)
                            .font(.title)
                        
                        Spacer()
                        
                        VStack {
                            Text("CPU")
                                .bold()
                                .padding(.bottom, 20)
                            Text(String(score2))
                        }.padding(.trailing, 20)
                        .foregroundColor(.white)
                        .font(.title)
                    }
                    
                    Spacer()
            }
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

