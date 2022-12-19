//
//  ContentView.swift
//  SliderApp
//
//  Created by Илья Дубенский on 19.12.2022.
//

import SwiftUI

struct ContentView: View {

    @State private var sliderValue = 50.0
    @State private var targetValue = Double.random(in: 0...100)
    @State private var isShowAlert = false


    var body: some View {
        VStack(spacing: 20){
            Text("Подвинь слайдер, как можно ближе к: \(lround(targetValue))")
                .font(.system(size: 16))
            HStack {
                Text("0")
                SliderView(value: $sliderValue, target: $targetValue)
                Text("100")
            }
            .padding()
            Button("Проверь меня") {
                self.isShowAlert.toggle()
            }
            .alert(isPresented: $isShowAlert) {
                Alert(
                    title: Text("Хей!"),
                    message: Text("Твои очки: \(computeScore())!")
                )
            }
            .padding()
            Button("Начать заново") {
                self.sliderValue = 50.0
                self.targetValue = Double.random(in: 0...100)
            }
        }
        .padding()
    }
}

extension ContentView {
    private func computeScore() -> Int {
        let difference = abs(lround(targetValue) - lround(sliderValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
