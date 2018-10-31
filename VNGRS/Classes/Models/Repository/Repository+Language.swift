//
//  Repository+Language.swift
//  VNGRS
//
//  Created by omer kantar on 31.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

protocol ProgramLanguageDataSource {
    var color: UIColor { get }
}

extension RepositoryModel {
    public enum Language: String {
        case swift = "swift" // 🚀
        case objC = "objective-c"// 🧟‍♂️
        case c = "c"
        case cPlusPlus = "c++"
        case python = "python"
        case dotNet = ".net"
        case ruby = "ruby"
        case kotlin = "kotlin"
        case java = "java"
        case javascript = "javascript"
    }
}


extension RepositoryModel.Language: ProgramLanguageDataSource {
    var color: UIColor {
        switch self {
        case .swift, .kotlin:
            return .orange
        case .objC:
            return .blue
        case .c:
            return .gray
        case .cPlusPlus:
            return .darkGray
        case .python:
            return .green
        case .dotNet:
            return .purple
        case .ruby:
            return .red
        case .javascript:
            return .yellow
        case .java:
            return .groupTableViewBackground
        }
    }
}
