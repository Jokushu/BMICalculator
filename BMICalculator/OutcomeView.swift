//
//  OutcomeView.swift
//  BMICalculator
//
//  Created by Vincent Gunawan on 22/05/22.
//

import SwiftUI

struct OutcomeView: View {
  @Binding var isPresented: Bool
  @State var bmiValue: Double = 22
  @State var bmiType: String = "Healty weight"
  @State var idealWeight: Double = 50.0
  
  var body: some View {
    ZStack {
      let backgroundColor = backgroundSetter(bmiValue)
      Color(backgroundColor).edgesIgnoringSafeArea(.all)
      VStack{
        Text("Your Result")
          .font(.title3)
          .bold()
          .kerning(2.0)
          .padding(.top)
        
        Spacer()
        
        Text("Your BMI")
          .font(.footnote)
          .bold()
          .kerning(2.0)
        Text(String(bmiValue))
          .font(.largeTitle)
          .bold()
          .kerning(2.0)
          .padding()
        Text(bmiType)
          .font(.subheadline)
          .bold()
          .kerning(2.0)
        
        Spacer()
        
        Text("Ideal Weight")
          .font(.footnote)
          .bold()
          .kerning(2.0)
        Text("\(String(idealWeight)) kgs")
          .font(.largeTitle)
          .bold()
          .kerning(2.0)
          .padding()
        
        Spacer()
        
        Button(action: {
          isPresented = false
        }, label: {
          Text("Close")
            .kerning(1.5)
            .foregroundColor(.white)
            .font(.headline)
        })
        .buttonStyle(.borderedProminent)
        .frame(maxWidth: .infinity)
        .background(
          RoundedRectangle(cornerRadius: 30)
            .fill(.blue)
        )
        .controlSize(.large)
        .padding()
      }
      .ignoresSafeArea()
    }
  }
  
  func backgroundSetter(_ bmi: Double) -> UIColor {
    var color = UIColor.black
    if bmi < 18.5 {
      color = UIColor(red: 221.0 / 256.0, green: 174.0 / 256.0, blue: 126.0 / 256.0, alpha: 1.0)
    } else if bmi < 25 {
      color = UIColor(red: 127.0 / 256.0, green: 182.0 / 256.0, blue: 133.0 / 256.0, alpha: 1.0)
    } else if bmi < 30 {
      color = UIColor(red: 66.0 / 256.0, green: 106.0 / 256.0, blue: 90.0 / 256.0, alpha: 1.0)
    } else {
      color = UIColor(red: 239.0 / 256.0, green: 111.0 / 256.0, blue: 108.0 / 256.0, alpha: 1.0)
    }
    return color
  }
}

struct OutcomeView_Previews: PreviewProvider {
    static var previews: some View {
      OutcomeView(isPresented: .constant(true))
    }
}
