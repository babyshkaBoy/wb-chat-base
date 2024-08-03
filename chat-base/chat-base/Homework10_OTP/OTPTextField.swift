
import SwiftUI
import Combine

struct OTPTextField: View {
    @FocusState private var keyboardFocusField: FocusField?
    @Binding var verificationCode: String
    @State var isAllNumberFilled: Bool = false
    
    var pinLength = 4
    var keyboardType: UIKeyboardType = .numberPad
    var onComplete: () -> ()
    
    var body: some View {
        ZStack {
            TextField("", text: $verificationCode)
                .frame(width: 0, height: 0) 
                .font(.system(size: 0))
                .foregroundStyle(.clear)
                .multilineTextAlignment(.center)
                .keyboardType(keyboardType)
                .focused($keyboardFocusField, equals: .field)
                .padding()
                .task {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.keyboardFocusField = .field
                    }
                }
                .onReceive(Just(verificationCode)) { _ in
                    if verificationCode.count > pinLength {
                        verificationCode = String(verificationCode.prefix(pinLength))
                    }
                    if verificationCode.count == pinLength && !isAllNumberFilled {
                        onComplete()
                    } else if verificationCode.count < pinLength {
                        isAllNumberFilled = false
                    }
                }
        }
    }
}

