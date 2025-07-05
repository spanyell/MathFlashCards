import SwiftUI

struct ContentView: View
{
    @State private var currentQuestion = MathQuestion.random()
    @State private var userAnswer = ""
    @State private var feedback: String? = nil
    @State private var correctCount = 0
    @State private var incorrectCount = 0

    var body: some View
    {
        VStack(spacing: 24)
        {
            HStack(spacing: 24) {
                Text("Correct: \(correctCount)")
                    .foregroundStyle(.green)
                Text("Incorrect: \(incorrectCount)")
                    .foregroundStyle(.red)
                Button("Reset Count") {
                    correctCount = 0
                    incorrectCount = 0
                }
                .buttonStyle(.bordered)
                .tint(.blue)
            }
            
            Text(currentQuestion.text)
                .font(.title)
            TextField("Your answer", text: $userAnswer)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .frame(maxWidth: 120)
                .multilineTextAlignment(.center)
            if let feedback
            {
                Text(feedback)
                    .foregroundStyle(feedback == "Correct! 🎉" ? .green : .red)
            }
            HStack(spacing: 20)
            {
                Button("Check")
                {
                    if let userVal = Int(userAnswer)
                    {
                        if userVal == currentQuestion.answer
                        {
                            if feedback != "Correct! 🎉" {
                                correctCount += 1
                            }
                            feedback = "Correct! 🎉"
                        }
                        else
                        {
                            if feedback != "Try again." && feedback != "Correct! 🎉" {
                                incorrectCount += 1
                            }
                            feedback = "Try again."
                        }
                    }
                    else
                    {
                        feedback = "Please enter a valid number."
                    }
                }
                .buttonStyle(.borderedProminent)
                .disabled(userAnswer.isEmpty)

                Button("Next") {
                    currentQuestion = MathQuestion.random()
                    userAnswer = ""
                    feedback = nil
                }
                .buttonStyle(.bordered)
                .disabled(feedback != "Correct! 🎉")
            }
        }
        .padding()
    }
}

#Preview
{
    ContentView()
}
