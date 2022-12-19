//
//  ContentView.swift
//  SliderApp
//
//  Created by Илья Дубенский on 19.12.2022.
//

import SwiftUI

struct ContentView: View {

    @State private var sliderValue = 50.0
    @State private var targetValue = Int.random(in: 0...100)
    @State private var isShowAlert = false


    var body: some View {
        VStack(spacing: 20){
            Text("Подвинь слайдер, как можно ближе к: \(targetValue)")
                .font(.system(size: 16))
            HStack {
                Text("0")
                SliderView(value: $sliderValue)
                Text("100")
            }
            .padding()
            Button("Проверь меня") {
                self.isShowAlert.toggle()
            }
            .alert(isPresented: $isShowAlert) {
                Alert(
                    title: Text("Хей!"),
                    message: Text("Твой результат \(computeScore()) очков!")
                )
            }
            .padding()
            Button("Начать заново") {
                self.sliderValue = 50.0
                self.targetValue = Int.random(in: 0...100)
            }
        }
        .padding()
    }
}

extension ContentView {
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(sliderValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
