import Foundation

public enum AnswerMatcher {
    public static func matches(_ input: String, accepted: [String]) -> Bool {
        let normalized = normalize(input)
        guard !normalized.isEmpty else { return false }
        return accepted.contains { normalize($0) == normalized }
    }

    private static func normalize(_ input: String) -> String {
        let german = input.precomposedStringWithCanonicalMapping
            .lowercased(with: Locale(identifier: "de_DE"))
            .replacingOccurrences(of: "ä", with: "ae")
            .replacingOccurrences(of: "ö", with: "oe")
            .replacingOccurrences(of: "ü", with: "ue")
            .replacingOccurrences(of: "ß", with: "ss")
        return german.unicodeScalars.split { scalar in
            CharacterSet.whitespacesAndNewlines.contains(scalar) ||
                CharacterSet.punctuationCharacters.contains(scalar)
        }.map(String.init).joined(separator: " ")
    }
}
