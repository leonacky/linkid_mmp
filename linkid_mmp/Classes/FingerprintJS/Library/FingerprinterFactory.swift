//
//  FingerprinterFactory.swift
//  FingerprintJS
//
//  Created by Petr Palata on 16.03.2022.
//

import Foundation

public protocol FingerprinterInstanceProviding {
    /// Creates an instance of `Fingerprinter` with the given `Configuration`
    /// - Parameter configuration: `Configuration` object that instructs the `Fingerprinter` to use
    /// a particular version of the API (i. e. what information is used to compute the compound device fingerprint) and which
    /// hashing function to apply.
    /// - Returns: An instance of `Fingerprinter`
    static func getInstance(_ configuration: ConfigurationFJS) -> Fingerprinter
}

/// *FingerprintJS* entry point that is supposed to be used to create an instance of the library's `Fingerprinter` class
public class FingerprinterFactory: FingerprinterInstanceProviding {
    public static func getInstance(_ configuration: ConfigurationFJS = ConfigurationFJS()) -> Fingerprinter {
        return Fingerprinter(configuration)
    }
}
