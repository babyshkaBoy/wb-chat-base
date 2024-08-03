import SwiftUI

struct OTPTextView: View {
    @State private var verificationCode = ""
    @FocusState private var focusField: FocusField?
    @State private var phoneNumber: String = "+7 999 999-99-99"
    
    var pinLength = 6
    var keyboardType: UIKeyboardType = .numberPad
    var onComplete: (String) -> ()
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 4) {
                Text("Введите код")
                    .frame(width: 144, height: 29)
                    .bold()
                    .foregroundStyle(Color.text)
                    .font(.system(size: 24))
                Text("Отправили код на номер\n \(phoneNumber)")
                    .frame(width: 261, height: 48)
                    .foregroundStyle(.text)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
            }.frame(width: 261, height: 85)
            ZStack {
                OTPTextField(verificationCode: $verificationCode, pinLength: pinLength, keyboardType: keyboardType) {
                    onComplete(verificationCode)
                }
                HStack(spacing: 20) {
                    ForEach(0..<pinLength, id: \.self) { i in
                        ZStack {
                            Text(getPin(at: i))
                                .tint(.clear)
                                .font(.largeTitle)
                                .frame(width: 32, height: 40)
                                .fontWeight(.bold)
                                .foregroundStyle(.black)
                            Circle()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(Color.backTextField)
                                .padding(.trailing, 15)
                                .padding(.leading, 15)
                                .opacity(verificationCode.count <= i ? 1 : 0)
                        }
                    }
                }
                
                
            }.frame(width: 248, height: 40)
                .padding(.top)
                .onAppear {
                    UITextField.appearance().clearButtonMode = .never
                    UITextField.appearance().tintColor = UIColor.clear
                }
            Button(action: {} ) {
                Text("Запросить код повторно")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.buttoncolor)
                    .cornerRadius(30)
            }
            .frame(width: 244, height: 52)
            .padding(.top)
        }
        
    }
    func getPin(at index: Int) -> String {
        guard self.verificationCode.count > index else {
            return ""
        }
        return String(verificationCode[index])
    }
}

enum FocusField: Hashable {
    case field
}

extension String {
    public subscript(_ idx: Int) -> Character {
        self[self.index(self.startIndex, offsetBy: idx)]
    }
}

#Preview {
    OTPTextView(pinLength: 4) {
        code in
        print(code)
    }
}
