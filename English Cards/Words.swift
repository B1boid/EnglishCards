//
//  Words.swift
//  English Cards
//
//  Created by Aleksandr Vorobev on 02.07.2019.
//  Copyright © 2019 Aleksandr Vorobev. All rights reserved.
//

import RealmSwift

class Words: Object {
    @objc dynamic var engWord = ""
    @objc dynamic var tranWord = ""
    @objc dynamic var levelOfStudying = 0
}
