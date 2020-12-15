//
//  ContactsPracticeTests.swift
//  ContactsPracticeTests
//
//  Created by Christian Hurtado on 12/13/20.
//

import XCTest
@testable import ContactsPractice

class ContactsPracticeTests: XCTestCase {

    func testTotalContacts() {
        // arrange
        let expCount = 20
        // act
        let contactsCount = Contact.loadContacts().count
        // assert
        XCTAssertEqual(expCount, contactsCount, "Affirms they're both equal to 20.")
    }

}
