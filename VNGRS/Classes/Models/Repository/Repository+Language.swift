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
        case cPlusPlus = "c++"
        case python = "python"
        case dotNet = ".net"
        case ruby = "ruby"
        case kotlin = "kotlin"
        case java = "java"
        case javascript = "javascript"
        case scala = "scala"
        case go = "go"
        case typescript = "typescript"
        case actionscript = "actionscript"
        case erlang = "erlang"
        case elixr = "elixr"
        case lua = "lua"
        case lisp = "lisp"
        case clojure = "clojure"
        case crystal = "crystal"
        case php = "php"
        case sql = "sql"
    }
    
    
    static var all: [Language] {
        return [.swift, .objC, .actionscript, .clojure, .cPlusPlus, .crystal, .dotNet, .elixr, .erlang, .lua, .scala, .lisp, .php, .sql, .python, .ruby, .kotlin, .java,.go]
    }
    
    static func language(_ text: String?) -> Language? {
        guard let text = text else { return nil }
        return all.lazy.filter { text.lowercased().contains($0.rawValue.lowercased()) }.first
    }
}


extension RepositoryModel.Language: ProgramLanguageDataSource {
    var color: UIColor {
        switch self {
        case .swift, .kotlin:
            return .orange
        case .objC:
            return .blue
        case .sql:
            return .gray
        case .cPlusPlus:
            return .darkGray
        case .python, .actionscript:
            return .green
        case .dotNet, .crystal, .erlang, .elixr:
            return .purple
        case .ruby, .clojure, .lua, .scala, .php:
            return .red
        case .javascript:
            return UIColor(red:255/255.0, green:255/255.0, blue:0/255.0, alpha: 1)
        case .java:
            return UIColor(red:255/255.0, green:0/255.0, blue:255/255.0, alpha: 1)
        case .go:
            return UIColor(red:243/255.0, green:151/255.0, blue:54/255.0, alpha: 1)
        case .typescript, .lisp:
            return UIColor(red:155/255.0, green:255/255.0, blue:98/255.0, alpha: 1)
        }
    }
}
