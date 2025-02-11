

//
//  SampleHandler.swift
//  ZohoAssistBroadCast
//

import ReplayKit
import AssistSDK

@available(iOSApplicationExtension 10.0, *)
class SampleHandler: AssistSampleHandler {
    
    /// You must override the appgroup and set the id. Rest of the thing will be taken care.
    /// You need not to override any mandate broadcast funtionalities as they are already handled in the AssistSampleHandler classes
    
    override var appGroup: String! {
        get {
            return "group.your.id"
        }
        set {}
    }
    
    
    /// You can override the methods that are provided as per document
    /// However, its better calling the super to ensure the funtionalities doen't broke
    
    override func didChanage(participant: Participant) {
        
        
        super.didChanage(participant: participant)
        
        /// Handle and show in the list or tigger notifications
        /// And your handling goes below
        
        DispatchQueue.global(qos: .background).async {
            
            /// To call inbulid methods using `assist_screenshare_obj` as show below
            
            self.assist_screenshare_obj?.send(chat: "Hello \(participant.email), Im having an issue")
            
        }
        
    }
    
    override func didReceived(chat: Chat) {

        super.didReceived(chat: chat)
        
        /// Handle and show in the list or tigger notifications
        /// And your handling goes below
        
    }
    
    
}

