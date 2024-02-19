//
//  ContentView.swift
//  WordScramble
//
//  Created by Iñaki Yabar Bilbao on 18/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    // Alert
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Text(word)
                            Image(systemName: "\(word.count).circle")
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .toolbar {
                ToolbarItem {
                    Button("Restart") {
                        startGame()
                    }
                }
            }
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) { } message: {
                Text(errorMessage)
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !answer.isEmpty else {
            return
        }
        
        guard isLongEnough(answer) else {
            wordError(title: "Word is too short!", message: "Please try again")
            return
        }
        
        guard isPossible(answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isOriginal(answer) else {
            wordError(title: "Word used already", message: "Please try again!")
            return
        }
        
        guard isReal(answer) else {
            wordError(title: "That word does not exist", message: "Please try again!")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        newWord = ""
    }
    
    func startGame() {
        if let file = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWordsString = try? String(contentsOf: file) {
                let words = startWordsString.components(separatedBy: "\n")
                rootWord = words.randomElement() ?? "boca"
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isLongEnough(_ word: String) -> Bool {
        return word.count >= 3
    }
    
    func isOriginal(_ word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    func isPossible(_ word: String) -> Bool {
        var tempWord = rootWord
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(_ word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspeledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspeledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

#Preview {
    ContentView()
}
