//
//  View.swift
//  TemplateKit
//
//  Created by Matias Cudich on 8/10/16.
//  Copyright © 2016 Matias Cudich. All rights reserved.
//

import Foundation

public protocol Renderable: class {
  func render() -> UIView
  func sizeThatFits(_ size: CGSize) -> CGSize
  func sizeToFit(_ size: CGSize)
}

public protocol View: Renderable {
  var calculatedFrame: CGRect? { set get }
  var propertyProvider: PropertyProvider? { set get }

  init()
  func render() -> UIView
}

extension View {
  public func sizeToFit(_ size: CGSize) {
    if calculatedFrame == nil {
      calculatedFrame = CGRect.zero
    }
    calculatedFrame?.size = sizeThatFits(size)
  }
}
