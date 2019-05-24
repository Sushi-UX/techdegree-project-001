// Raymond Choy aka: Sushi-UX
// Treehouse Tech degree - Unit 001 - Soccer Coordinator

// Manually create a single collection of all the players each having their own dictionary
let players: [[String: String]] =
    [["name": "Joe Smith",
      "height": "42.00",
      "experience": "yes",
      "guardian": "Jim and Jan Smith"],

     ["name": "Jill Tanner",
      "height": "36.00",
      "experience": "yes",
      "guardian": "Clara Tanner"],

     ["name": "Bill Bon",
      "height": "43.00",
      "experience": "yes",
      "guardian": "Sara and Jenny Bon"],

     ["name": "Eva Gordon",
      "height": "45.00",
      "experience": "no",
      "guardian": "Wendy and Mike Gordon"],

     ["name": "Matt Gill",
      "height": "40.00",
      "experience": "no",
      "guardian": "Charles and Sylvia Gill"],

     ["name": "Kimmy Stein",
      "height": "41.00",
      "experience": "no",
      "guardian": "Bill and Hillary Stein"],

     ["name": "Sammy Adams",
      "height": "45.00",
      "experience": "no",
      "guardian": "Jeff Adams"],

     ["name": "Karl Saygan",
      "height": "42.00",
      "experience": "yes",
      "guardian": "Heather Bledsoe"],

     ["name": "Suzane Greenberg",
      "height": "44.00",
      "experience": "yes",
      "guardian": "Henrietta Dumas"],

     ["name": "Sal Dali",
      "height": "41.00",
      "experience": "no",
      "guardian": "Gala Dali"],

     ["name": "Joe Kavalier",
      "height": "39.00",
      "experience": "no",
      "guardian": "Sam and Elaine Kavalier"],

     ["name": "Ben Finkelstein",
      "height": "44.00",
      "experience": "no",
      "guardian": "Aaron and Jill Finkelstein"],

     ["name": "Diego Soto",
      "height": "41.00",
      "experience": "yes",
      "guardian": "Robin and Sarika Soto"],

     ["name": "Chloe Alaska",
      "height": "47.00",
      "experience": "no",
      "guardian": "David and Jamie Alaska"],

     ["name": "Arnold Willis",
      "height": "43.00",
      "experience": "no",
      "guardian": "Claire Willis"],

     ["name": "Phillip Helm",
      "height": "44.00",
      "experience": "yes",
      "guardian": "Thomas Helm and Eva Jones"],

     ["name": "Les Clay",
      "height": "42.00",
      "experience": "yes",
      "guardian": "Wynonna Brown"],

     ["name": "Herschel Krustofski",
      "height": "45.00",
      "experience": "yes",
      "guardian": "Hyman and Rachel Krustofski"],
]


// Create collections for players to be divided into three teams
var allTeams: [String] = ["Dragons", "Sharks", "Raptors"]
var teamSharks: [[String: String]] = []
var teamDragons: [[String: String]] = []
var teamRaptors: [[String: String]] = []
var letters: [[String: String]] = []

// Creating a function to sort players by experience
func sortPlayers() {
    var experienceYes: [[String: String]] = []
    var experienceNo: [[String: String]] = []
    
    for player in players {
        if player["experience"] == "yes" {
            experienceYes.append(player)
        } else if player["experience"] == "no" {
            experienceNo.append(player)
        }
    }

    experienceYes.sort(by: {($0["height"]!) > $1["height"]!})
    experienceNo.sort(by: {($0["height"]!) > $1["height"]!})

    assignTeams(ofPlayers: experienceYes)
    assignTeams(ofPlayers: experienceNo)
}

func writeLetters(toTeams teams: [String]) -> [[String: String]] {
    var results: [[String: String]] = []
    var letter: String = ""
    for team in teams {
        var practiceTime = ""
        var members: [[String: String]] = []
        if team == "Dragons" {
            practiceTime = "March 17th, 1:00PM"
            members = teamDragons
        } else if team == "Sharks" {
            practiceTime = "March 17th, 3:00PM"
            members = teamSharks
        } else if team == "Raptors" {
            practiceTime = "March 18th, 1:00PM"
            members = teamRaptors
        }
        for member in members {
            if member["guardian"] != nil && member["name"] != nil {
                letter = "Dear \(member["guardian"]!),\r\n\r\nCongratulation! \(member["name"]!) has been chosen to play for the \(team) this summer.\r\n\r\nThe first soccer practice for your child's team will be: \(practiceTime)\r\n\r\nWe look forward to seeing you then.\r\n\r\n"
                results.append([member["name"]!: letter])
            }
        }
    }
    return results
}

func assignTeams(ofPlayers players: [[String: String]]) {
    var index = 0
    var thirdTeamAssigned = ""
    while index < players.count {
        if thirdTeamAssigned == "" {
            teamDragons.append(players[index])
            thirdTeamAssigned = "Dragons"
            index += 1
            continue
        } else if thirdTeamAssigned == "Dragons" {
            teamSharks.append(players[index])
            thirdTeamAssigned = "Sharks"
            index += 1
            continue
        } else if thirdTeamAssigned == "Sharks" {
            teamRaptors.append(players[index])
            thirdTeamAssigned = ""
            index += 1
            continue
        }
    }
}

func calculateAverageHeight(ofTeams teams: [String])    {
for team in teams {
    var teamTotalHeight: Double = 0.0
    var teamAverageHeight: Double = 0.0
    var members: [[String: String]] = []
    if team == "Dragons"    {
        members = teamDragons
    } else if team == "Sharks" {
        members = teamSharks
    } else if team == "Raptors" {
        members = teamRaptors
    }
    for member in members {
        if let height = Double(member["height"]!)    {
            teamTotalHeight = teamTotalHeight + height
        }
    }
    teamAverageHeight = teamTotalHeight/Double(members.count)
    print("\(team) avergage height: \(teamAverageHeight)")
    }
}

func mailLetters(toGaurdians letters: [[String: String]]) {
    for letter in letters {
        for (_, value) in letter {
            print(value)
        }
    }
}
sortPlayers()
letters = writeLetters(toTeams: allTeams)
mailLetters(toGaurdians: letters)
calculateAverageHeight(ofTeams: allTeams)
