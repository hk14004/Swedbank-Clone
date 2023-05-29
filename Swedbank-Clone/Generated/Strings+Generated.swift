// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum LanguageSelection {
    /// English
    internal static let en = L10n.tr("Localizable", "LanguageSelection.en", fallback: "English")
    /// Latviešu
    internal static let lv = L10n.tr("Localizable", "LanguageSelection.lv", fallback: "Latviešu")
    /// Choose language
    internal static let title = L10n.tr("Localizable", "LanguageSelection.title", fallback: "Choose language")
  }
  internal enum LockedTab {
    internal enum Overview {
      /// A convenient way to monitor your money and see where it is spent
      internal static let subtitle = L10n.tr("Localizable", "LockedTab.Overview.subtitle", fallback: "A convenient way to monitor your money and see where it is spent")
      /// Balance overview
      internal static let title = L10n.tr("Localizable", "LockedTab.Overview.title", fallback: "Balance overview")
    }
    internal enum Payments {
      /// Make payments easily wherever you are
      internal static let subtitle = L10n.tr("Localizable", "LockedTab.Payments.subtitle", fallback: "Make payments easily wherever you are")
      /// Transfer money or pay bills
      internal static let title = L10n.tr("Localizable", "LockedTab.Payments.title", fallback: "Transfer money or pay bills")
    }
  }
  internal enum Login {
    internal enum Button {
      /// Login
      internal static let title = L10n.tr("Localizable", "Login.Button.title", fallback: "Login")
    }
  }
  internal enum Tabbar {
    internal enum Tabs {
      internal enum Cards {
        /// Cards
        internal static let title = L10n.tr("Localizable", "Tabbar.Tabs.Cards.title", fallback: "Cards")
      }
      internal enum Contacts {
        /// Contacts
        internal static let title = L10n.tr("Localizable", "Tabbar.Tabs.Contacts.title", fallback: "Contacts")
      }
      internal enum Overview {
        /// Overview
        internal static let title = L10n.tr("Localizable", "Tabbar.Tabs.Overview.title", fallback: "Overview")
      }
      internal enum Payments {
        /// Payments
        internal static let title = L10n.tr("Localizable", "Tabbar.Tabs.Payments.title", fallback: "Payments")
      }
      internal enum Services {
        /// Services
        internal static let title = L10n.tr("Localizable", "Tabbar.Tabs.Services.title", fallback: "Services")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    return key
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
