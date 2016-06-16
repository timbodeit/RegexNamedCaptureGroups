//
//  Extensions.swift
//  Pods
//
//  Created by Tim Bodeit on 16/06/16.
//
//

import unicode
import Regex

extension RegexMatchResult {
  
  /**
   Gets the value for a named capture group.
   
   - parameter name: The name of the capture group
   
   - returns: The value for that capture group or nil if no such group exists.
   */
  public func namedCapture(name: String) -> String? {
    guard let groupnameResolver = regex.groupnameResolver else {
      print("Failed to get groupname resolver for regex")
      return nil
    }
    
    if let index = groupnameResolver.numberForCaptureGroupWithName(name) where captures.count > index {
      return captures[index]
    } else {
      return nil
    }
  }
  
}

private extension NSRegularExpression {
  private static var GroupnameResolverHandle = UnsafePointer<Void>(bitPattern: 61373742)

  var groupnameResolver: GroupnameResolver? {
    return objc_getAssociatedObject(self, NSRegularExpression.GroupnameResolverHandle) as? GroupnameResolver ?? setupGroupnameResolver()
  }
  
  func setupGroupnameResolver() -> GroupnameResolver? {
    let groupNameResolver = GroupnameResolver(regex: self)
    objc_setAssociatedObject(self, NSRegularExpression.GroupnameResolverHandle, groupNameResolver, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    return groupNameResolver
  }
}
