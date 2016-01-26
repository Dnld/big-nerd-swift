//: Playground - noun: a place where people can play

import Cocoa

enum Token {
    case Number(Int)
    case Plus
    case Minus
}

class Lexer {
    let input: String.CharacterView
    var position: String.CharacterView.Index
    enum Error: ErrorType {
        case InvalidCharacter(Character)
    }
    
    init (input: String) {
        self.input = input.characters
        self.position = self.input.startIndex
    }
    
    func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
        return input[position]
    }
    
    func advance() {
        assert(position < input.endIndex, "Cannot advance past the end!")
        ++position
    }
    
    func getNumber() -> Int {
        var value = 0
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0"..."9":
                let digitValue = Int(String(nextCharacter))!
                value = 10 * value + digitValue
                advance()
            default:
                return value
            }
        }
        return value
    }
    
    func lex() throws -> [Token] {
        var tokens = [Token]()
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0"..."9":
                let value = getNumber()
                tokens.append(.Number(value))
            case "+":
                tokens.append(.Plus)
                advance()
            case "-":
                tokens.append(.Minus)
                advance()
            case " ":
                advance()
            default:
                throw Error.InvalidCharacter(nextCharacter)
        
            }
        }
            
        return tokens
    }
}

class Parser {
    let tokens: [Token]
    var position = 0
    enum Error: ErrorType {
        case UnexpectedEndOfInput
        case InvalidToken(Token)
    }
    
    init(tokens: [Token]) {
        self.tokens = tokens
    }
    
    func getNextToken() -> Token? {
        guard position < tokens.count else {
            return nil
        }
        return tokens[position++]
    }
    
    func getNumber() throws -> Int {
        guard let token = getNextToken() else {
            throw Error.UnexpectedEndOfInput
        }
        switch token {
        case .Number(let value):
            return value
        case .Plus, .Minus:
            throw Error.InvalidToken(token)
        }
    }
    
    func parse() throws -> Int {
        // can use try here becasuse parse throws -- that is error handling
        var value = try getNumber()
        
        while let token = getNextToken() {
            switch token {
            case .Plus:
                let nextNumber = try getNumber()
                value += nextNumber
            case .Minus:
                let nextNumber = try getNumber()
                value -= nextNumber
            case .Number:
                throw Error.InvalidToken(token)
            }
        }
        return value
    }
}

func evaluate(input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
    do {
        let tokens = try lexer.lex()
        print("Lexer output: \(tokens)")
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser output: \(result)")
    } catch Lexer.Error.InvalidCharacter(let character) {
        print("Input contained an invalid character: \(character)")
    } catch Parser.Error.UnexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.Error.InvalidToken(let token) {
        print("Invalid token during parsing: \(token)")
    } catch {
        print("An error occured: \(error)")
    }
}

evaluate("10 + 3 + 5")
evaluate("10 + 3 + 5 + dsfdas")
evaluate("10 + ")
evaluate("10 + 1 1")
evaluate("2 - 1")
evaluate("3 + 5 - 2")
evaluate("3 - -")
evaluate("4 + 5 -")
