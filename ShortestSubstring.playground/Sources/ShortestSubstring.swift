
//  ShortestSubstring.swift
//  ShortestSubstring

//  Created by Ali Mert Özhayta on 30.12.2019.
//  Copyright © 2019 Ali Mert Özhayta. All rights reserved.


import Foundation

/* MARK: -  SHORTEST SUBSTRING FUNCTION  */
public func shortestSubstring(s: String) -> Int {

    if !s.isLowerCaseAndLetterWithoutWhiteSpace() {
       print("string does not conform to [a-z] regex")
      return -1
    }
    print("str:",s)

    let strArr = getStringArrayFromString(s)
    print("\nstrArr:",strArr)

    var distinctStrArr : [String] = []
    for str in strArr {
        if !distinctStrArr.contains(str) {
            distinctStrArr.append(str)
        }
    }
    print("distinctStrArr:",distinctStrArr)

    let subStrings = generateSubStrings(from: strArr, with: distinctStrArr)
    print("\n\n\(subStrings)")

    let shortestSubstring = getShortestSubstring(subStrings, distinctStrArr)
    print("\n => \"\(shortestSubstring)\"", "is the shortest substring that contains all the distinct characters in s.")
    return shortestSubstring.count
}
/* MARK: - END OF SHORTEST SUBSTRING FUNCTION  */


// MARK: -  FUNCTIONS STARTS

private func getStringArrayFromString(_ str: String) -> [String]{
  var cakmaCharArray : [String] = []
  for i in 0 ..< str.count {
    let index = str.index(str.startIndex, offsetBy: i)
    cakmaCharArray.append(String(str[index]))
  }
  return cakmaCharArray
}


private func generateSubStrings(from strArr: [String], with distinctStrArr: [String]) -> [String] {
    var subStrings : [String] = [String()]
    var i: Int = 0
    var subIndex:Int=0
    while(i<strArr.count){
        if subStrings[subIndex].contains(distinctStrArr) {
            subIndex += 1
            subStrings.append("")
        }
        subStrings[subIndex] += strArr[i]
        i += 1
    }
    return subStrings
}

private func getShortestSubstring(_ subStrings: [String], _ distinctStrArr: [String]) -> String {
    var index = 0
    for i in 0..<subStrings.count {
        if subStrings[i].count < subStrings[index].count && subStrings[i].contains(distinctStrArr) {
            index = i
        }
    }
    return subStrings[index]
}


// MARK: - EXTENSIONS STARTS

extension String {
    func isLowerCaseAndLetterWithoutWhiteSpace() -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: ".*[^a-z].*", options: [])
            if let _ = regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, self.count)) {
                return false
            }
        } catch {
            debugPrint(error.localizedDescription)
            return false
        }
        return true
    }

    func contains(_ strArr: [String]) -> Bool {
        if strArr.count < 1 {return false}
        for character in strArr {
            if !self.contains(character) {
                return false
            }
        }
        return true
    }
}


































//
//public class AppLogist {
//
//    private static func getStringArrayFromString(_ str: String) -> [String]{
//      var cakmaCharArray : [String] = []
//      for i in 0 ..< str.count {
//        let index = str.index(str.startIndex, offsetBy: i)
//        cakmaCharArray.append(String(str[index]))
//      }
//      return cakmaCharArray
//    }
//
//
//    private static func generateSubStrings(from strArr: [String], with distinctStrArr: [String]) -> [String] {
//        var subStrings : [String] = [String()]
//        var i: Int = 0
//        var subIndex:Int=0
//        while(i<strArr.count){
//            if subStrings[subIndex].contains(distinctStrArr) {
//                subIndex += 1
//                subStrings.append("")
//            }
//            subStrings[subIndex] += strArr[i]
//            i += 1
//        }
//        return subStrings
//    }
//
//    private static func getShortestSubstring(_ subStrings: [String], _ distinctStrArr: [String]) -> String {
//        var index = 0
//        for i in 0..<subStrings.count {
//            if subStrings[i].count < subStrings[index].count && subStrings[i].contains(distinctStrArr) {
//                index = i
//            }
//        }
//        return subStrings[index]
//    }
//    // MARK: -  END OF FUNCTIONS
//
//
//    /* MARK: -  SHORTEST SUBSTRING FUNCTION  */
//    public static func shortestSubstring(s: String) -> Int {
//
//        if !s.isLowerCaseAndLetterWithoutWhiteSpace() {
//           print("string does not conform to [a-z] regex")
//          return -1
//        }
//        print("str:",s)
//
//        let strArr = getStringArrayFromString(s)
//        print("\nstrArr:",strArr)
//
//        var distinctStrArr : [String] = []
//        for str in strArr {
//            if !distinctStrArr.contains(str) {
//                distinctStrArr.append(str)
//            }
//        }
//        print("distinctStrArr:",distinctStrArr)
//
//        let subStrings = generateSubStrings(from: strArr, with: distinctStrArr)
//        print("\n\n\(subStrings)")
//
//        let shortestSubstring = getShortestSubstring(subStrings, distinctStrArr)
//        print("\n => \"\(shortestSubstring)\"", "is the shortest substring that contains all the distinct characters in s.")
//        return shortestSubstring.count
//    }
//    /* MARK: - END OF SHORTEST SUBSTRING FUNCTION  */
//
//
//}
//
//
