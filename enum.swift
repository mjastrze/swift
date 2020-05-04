enum Rank: Int, CaseIterable {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue


enum Suit : CaseIterable  {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }

    func color() -> String {
      switch self{
        case .spades, .clubs:
          return "BLACK"
        case .hearts, .diamonds:
          return "RED"
      }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
print(heartsDescription)

let spades = Suit.spades
let spadesColor = spades.color()
print(spadesColor)

let heartsColor = hearts.color()
print(heartsColor)

//////////////////////////////////

enum ServerResponse {
    case result(String, String)
    case failure(String)
    case working(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
let working = ServerResponse.working("very hard")

switch working {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
case let .working(how):
    print("The server is working \(how)")
}

////////////////////////////////////

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }

    func getAllCards() -> [String] {
      var cards = [String]()
      for rank in Rank.allCases {
        for suit in Suit.allCases{
          cards.append(" \(rank.simpleDescription()) : \(suit.simpleDescription())")
        }
      }
      return cards
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
print(threeOfSpadesDescription)

let allCards = threeOfSpades.getAllCards()
print(allCards)