//
//  String.swift
//  CsGo Test
//
//  Created by Виталий on 10/24/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import Foundation

extension String
{
    var isBlank: Bool
    {
        trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty
    }

    var isNotEmpty: Bool
    {
        !isEmpty
    }
    
    func trim() -> String
    {
        trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    var asHtml: String
    {
        let head = "<style type='text/css'>body{font-family:-apple-system!important;line-height:1.8}</style>"
        return "<html><head>\(head)</head><body>\(self)</body></html>"
    }

    var asHtmlAttributedText: NSAttributedString?
    {
        guard let data = self.asHtml.data(using: .utf8) else { return nil }

        return try? NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
    }
    
    var encodedUrl: URL? {
        guard let encodedString = self.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else { return nil }
        return URL(string: encodedString)
    }
}

extension Optional where Wrapped == String
{
    var isNilOrEmpty: Bool { self?.isEmpty ?? true }
    var isNilOrBlank: Bool { self?.isBlank ?? true }
}
