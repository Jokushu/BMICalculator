//
//  SliderView.swift
//  BMICalculator
//
//  Created by Vincent Gunawan on 22/05/22.
//

import SwiftUI

struct SliderView: View {
  @Binding var sliderValue: Double
  var textLabel : String
  var measurementLabel: String
  
  var body: some View {
    VStack {
      Text(textLabel)
        .font(.title3)
        .bold()
        .kerning(2.0)
      
      HStack{
        Slider(value: $sliderValue, in: 1.0...250.0)
          .padding()
        Text("\(String(format: "%.2f", sliderValue)) \(measurementLabel)")
          .font(.headline)
      }
      .padding()
      .background(
        RoundedRectangle(cornerRadius: 30)
            .fill(.ultraThinMaterial)
            .shadow(color: .gray, radius: 3.0, x: 2, y: 3)
      ).padding(.horizontal)
    }
  }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
      SliderView(sliderValue: .constant(100), textLabel: "Text Sample", measurementLabel: "kg")
    }
}
