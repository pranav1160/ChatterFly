//
//  TextValidationHelper.swift
//  ChatterFly
//
//  Created by Pranav on 09/12/25.
//
import Foundation

struct TextValidationHelper{
     static func checkMessage(text:String) throws {
        let minLength = 3
        let badWords: [String] = [
            // Tier 1 - Extremely Offensive
            "nigger","nigga","niggah","niggers","faggot","fag","fags","cunt","cunts","retard","retarded",
            "kike","spic","spick","wetback","chink","chinks","gook","paki",
            
            // Tier 2 - Strong Profanity & Slurs
            "motherfucker","motherfuckin","motherfucking","fuck","fucked","fucker","fuckers","fucking","fucks",
            "shit","shite","sh1t","sh1te","bullshit","horseshit","shithead","shitbag","asshole","arsehole",
            "bitch","bitches","sonofabitch","cocksucker","cock","cocks","dick","dicks","dickhead",
            "prick","twat","pussy","slut","whore","ho","hoes","dyke",
            "tranny","trannies","shemale","rape","raped","raping","pedo","pedophile","pedophilia","incest",
            
            // Tier 3 - Moderate / Common Swear Words
            "ass","asses","asshat","bastard","damn","damned","goddamn","goddammit","hell","crap","piss","pissed",
            "tits","titties","boobs","wank","wanker","knob","bellend","bollocks","bugger","sod",
            "shag","jackoff","jacking off","jerkoff","wtf","omfg",
            
            // Tier 4 - Sexual & Crude Terms
            "cum","jizz","semen","nut","bukkake","blowjob","handjob","rimjob","anal","anus","butthole",
            "clit","clitoris","vagina","vag","penis","boner","erection","hardon","gangbang","orgy",
            "milf","dilf","porn","porno","hentai","creampie","fisting","beastiality","zoophilia",
            
            // Tier 5 - Leetspeak Variants
            "f@ck","f u c k","fu ck","f*ck","c0ck","c0cks","sh1t","@ss","a55","nigg3r","f4g",
            "phuck","b1tch","b!tch",
            
            // Non-English Slurs & Profanity
            "puto","puta","cabrón","maricón","concha","concha de tu madre","pendejo","joto",
            "bhenchod","madarchod","chutiya","randi","loda","lund","chodu",
            "pusse","fitte","neger","scheisse","fotze","kanake","encule","salope","pd",
            
            // Toxic Phrases
            "kill yourself","kys","hang yourself","go die","cancer","die of cancer","autistic",
            "sperg","neckbeard","incel"
        ]
        let lower = text.lowercased()
        
        if text.count<minLength{
            throw TextValidationError.notEnoughCharacters(minLen: minLength)
        }else if badWords.contains(where: { lower.contains($0) }){
            throw TextValidationError.badWords
        }
    }
    
    enum TextValidationError:LocalizedError{
        case badWords
        case notEnoughCharacters(minLen:Int)
        
        var errorDescription: String?{
            switch self {
            case .badWords:
                return "Message contains bad words. Please rephrase your message"
            case .notEnoughCharacters(let minLen):
                return "Message should contain atleast \(minLen) characters"
            }
        }
    }
    
}
