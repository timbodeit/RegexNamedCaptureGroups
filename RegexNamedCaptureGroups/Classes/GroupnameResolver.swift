import unicode
import Regex

/**
 Resolves a capture group's name to its index for a given regex.
 To do this, GroupnameResolver calls into the ICU regex library,
 that NSRegularExpression is based on.
 */
class GroupnameResolver {
  
  private let uregex: COpaquePointer
  
  init?(regex: NSRegularExpression) {
    let cPattern = (regex.pattern as NSString).UTF8String
    let flag = regex.options.uregexFlag
    
    var errorCode = U_ZERO_ERROR
    
    uregex = uregex_openC(cPattern, flag, nil, &errorCode)
    
    if errorCode.isFailure {
      return nil
    }
  }
  
  func numberForCaptureGroupWithName(name: String) -> Int? {
    let cName = (name as NSString).UTF8String
    let nullTerminatedStringFlag: Int32 = -1
    
    var errorCode = U_ZERO_ERROR
    
    let groupNumber = uregex_groupNumberFromCName(uregex, cName, nullTerminatedStringFlag, &errorCode)
    
    if errorCode.isSuccess {
      return Int(groupNumber)
    } else {
      return nil
    }
  }
  
  deinit {
    uregex_close(uregex)
  }
}

private extension UErrorCode {
  var isSuccess: Bool {
    return self.rawValue <= U_ZERO_ERROR.rawValue
  }
  var isFailure: Bool {
    return self.rawValue > U_ZERO_ERROR.rawValue
  }
}

private extension NSRegularExpressionOptions {
  var uregexFlag: UInt32 {
    var flag = 0 as UInt32
    if self.contains(.CaseInsensitive) {
      flag |= UREGEX_CASE_INSENSITIVE.rawValue
    }
    if self.contains(.AllowCommentsAndWhitespace) {
      flag |= UREGEX_COMMENTS.rawValue
    }
    if self.contains(.DotMatchesLineSeparators) {
      flag |= UREGEX_DOTALL.rawValue
    }
    if self.contains(.AnchorsMatchLines) {
      flag |= UREGEX_MULTILINE.rawValue
    }
    if self.contains(.UseUnixLineSeparators) {
      flag |= UREGEX_UNIX_LINES.rawValue
    }
    if self.contains(.UseUnicodeWordBoundaries) {
      flag |= UREGEX_UWORD.rawValue
    }
    return flag
  }
}
