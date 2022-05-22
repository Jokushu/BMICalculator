//
//  ContentView.swift
//  BMICalculator
//
//  Created by Vincent Gunawan on 11/05/22.
//

import SwiftUI

struct ContentView: View {
  
  @State private var gender = "Male"
  @State private var genderList = ["Male", "Female"]
  @State var heightSliderValue = 150.0
  @State var weightSliderValue = 75.0
  @State var presentedScreen = false
  @State var bmi = BMI()
  
    var body: some View {
      ZStack{
        VStack{
          Text("BMI Calculator")
            .font(.title)
            .bold()
          
          Spacer()
          
          VStack{
            
            Spacer()
            
            Picker("Gender", selection: $gender) {
              ForEach (genderList, id: \.self){
                Text($0)
              }
            }
            .pickerStyle(.segmented)
            .padding()
            
            Spacer()
            
            SliderView(sliderValue: $heightSliderValue, textLabel: "Height", measurementLabel: "cm")
            
            Spacer()
            
            SliderView(sliderValue: $weightSliderValue, textLabel: "Weight", measurementLabel: "kg")
            
            Spacer()
          }

          Spacer()
          
          Button(action: {
//            print("Tapped button OK!")
            presentedScreen = true
          }, label: {
            Text("Calculate")
              .kerning(1.5)
              .foregroundColor(.white)
              .font(.headline)
          })
          .sheet(isPresented: $presentedScreen) {
            let bmiValue = bmi.calculateBMI(
              weight: weightSliderValue,
              height: heightSliderValue)
            let type = bmi.typeBMI(with: bmiValue)
            let idealWeight = bmi.calculateIdealWeight(height: heightSliderValue, gender: gender)
            OutcomeView(isPresented: $presentedScreen, bmiValue: bmiValue, bmiType: type, idealWeight: idealWeight)
          }
          .buttonStyle(.borderedProminent)
          .frame(maxWidth: .infinity)
          .background(
            RoundedRectangle(cornerRadius: 30)
              .fill(.blue)
          )
          .controlSize(.large)
          .padding()
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
