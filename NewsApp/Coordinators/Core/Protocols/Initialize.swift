import Defaults
import Foundation

struct Initialize: Codable, _DefaultsSerializable {
    let appUrl: String
    let currentLocale: String
    let localeList: [String: String]
    let labelList: [String: String]
    let faqList: [Faq]
    let pageList: [Page]
    let states: [String: String]
    let medProfile: MedProfile
    let contactsRelationship: [String: String]
    let maxFileSize: MaxFileSize
    
    init() {
        appUrl = ""
        currentLocale = ""
        localeList = [:]
        labelList = [:]
        faqList = []
        pageList = []
        states = [:]
        medProfile = MedProfile(bloodTypes: [:],
                                metrics: MedProfile.Metrics(weightUnit: [:], heightUnit: [:]),
                                insuranceProviderTypes: [:])
        contactsRelationship = [:]
        maxFileSize = MaxFileSize(size: 0, unit: "")
    }
    
    struct Faq: Codable {
        let question: String
        let answer: String
        let isOpen: Bool
    }
    
    struct Page: Codable {
        let title: String
        let slug: String
        let content: String
    }
      
    struct MaxFileSize: Codable {
        let size: Int
        let unit: String
    }
    
    struct MedProfile: Codable {
        let bloodTypes: [String: String]
        let metrics: Metrics
        let insuranceProviderTypes: [String: String]
        
        struct Metrics: Codable {
            let weightUnit: [String: String]
            let heightUnit: [String: String]
        }
    }
}
