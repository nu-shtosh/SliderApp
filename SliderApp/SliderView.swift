//
//  SliderView.swift
//  SliderApp
//
//  Created by Илья Дубенский on 19.12.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {

    @Binding var value: Double
    @Binding var target: Double

    private var thumbOpacity: Double {
        1 - (abs(target - value) / 100)
    }

    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()

        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = Float(value)
        slider.thumbTintColor = UIColor(Color(.red).opacity(thumbOpacity))
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.valueDidChange),
                         for: .valueChanged)
        return slider
    }

    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = UIColor(Color(.red).opacity(thumbOpacity))
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var value: Double

        init(value: Binding<Double>) {
            self._value = value
        }

        @objc func valueDidChange(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(0), target: .constant(0))
    }
}
