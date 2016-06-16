// https://github.com/Quick/Quick

import Quick
import Nimble
import Regex
import RegexNamedCaptureGroups

class TableOfContentsSpec: QuickSpec {
  override func spec() {
    describe("RegexResult") {
      
      it("supports named capture groups") {
        let regexPattern = "(?<name>[A-z]*) is (?<age>[0-9]*) years old."
        let testString = "John is 30 years old."
        let result = testString.grep(regexPattern)
        
        expect(result.namedCapture("name")).to(equal("John"))
        expect(result.namedCapture("age")).to(equal("30"))
      }
      it("supports nested named capture groups") {
        let regexPattern = "(?<x>abc(?<y>def))"
        
        let result = "abcdef".grep(regexPattern)
        
        expect(result.namedCapture("x")).to(equal("abcdef"))
        expect(result.namedCapture("y")).to(equal("def"))
      }
    }
  }
}
