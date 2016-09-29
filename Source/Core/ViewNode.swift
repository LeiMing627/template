//
//  OpaqueView.swift
//  TemplateKit
//
//  Created by Matias Cudich on 9/8/16.
//  Copyright © 2016 Matias Cudich. All rights reserved.
//

import Foundation

class ViewNode: PropertyNode {
  weak var owner: Node?
  weak var parent: Node?
  var context: Context?

  var properties: DefaultProperties
  var children: [Node]? {
    didSet {
      updateParent()
    }
  }
  var element: ElementData<DefaultProperties>
  var cssNode: CSSNode?
  var builtView: View?

  required init(element: Element, children: [Node]?, owner: Node?) {
    self.element = element as! ElementData<DefaultProperties>
    self.properties = self.element.properties
    self.children = children
    self.owner = owner

    updateParent()
  }

  init(view: UIView, element: Element, owner: Node? = nil) {
    self.element = element as! ElementData<DefaultProperties>
    self.builtView = view
    self.properties = self.element.properties
  }

  init(element: Element, properties: DefaultProperties, children: [Node]? = nil, owner: Node? = nil) {
    self.element = element as! ElementData<DefaultProperties>
    self.properties = properties
    self.children = children
    self.owner = owner

    updateParent()
  }

  func build<V: View>() -> V {
    return builtView as! V
  }

  func getBuiltView<V>() -> V? {
    return builtView as? V
  }
}
