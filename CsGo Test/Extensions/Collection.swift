//
//  Collection.swift
//  CsGo Test
//
//  Created by Виталий on 10/24/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import Foundation

extension Collection
{
    var isNotEmpty: Bool { !isEmpty }
}

extension Optional where Wrapped: Collection
{
    var isNilOrEmpty: Bool { self?.isEmpty ?? true }
}
