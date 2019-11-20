

//
//  SampleHandler.swift
//  ZohoAssistBroadCast
//

import ReplayKit
import AssistSDK

@available(iOSApplicationExtension 10.0, *)
class SampleHandler: RPBroadcastSampleHandler {
    
    var asssionSession:AssistSession?
    
    override func broadcastStarted(withSetupInfo setupInfo: [String : NSObject]?) {
        
        // User has requested to start the broadcast. Setup info from the UI extension will be supplied.

        // After you registered the session key create AssistSession object will initiated.
        
        guard let assistObject =  AssistSession(delegate: self, appGroup: "group.com.example.appgroup", image: .best) else {
            
            // WARNING: Possible reason for this block execution
            
            // Reason 1: You can initiate one AssistSession object for a session. If you create another AssistSession object it will return you nil.
            
            // Reason 2: The session data might not be registered properly.
            
            fatalError("Duplicate session or Invalid session data")

        }
        
//        Session created successfully
        
         self.asssionSession = assistObject
        
//        Broadcast starts after you set network true.
//        So please don't forget to update the network status
        
        self.asssionSession?.isNetworkAvailable = true
        
    }
    
    
    override func broadcastPaused() {
        // User has requested to pause the broadcast. Samples will stop being delivered.

        asssionSession?.stopSession()
    }
    
    override func broadcastResumed() {
        // User has requested to resume the broadcast. Samples delivery will resume.

        asssionSession?.resumeSession()
    }
    
    override func broadcastFinished() {
        // User has requested to finish the broadcast.

        asssionSession?.endSession()
    }
    
    override func processSampleBuffer(_ sampleBuffer: CMSampleBuffer, with sampleBufferType: RPSampleBufferType) {
        
        switch sampleBufferType {
            
        case RPSampleBufferType.video:
            self.asssionSession?.addImage(buffer:sampleBuffer)
            // Handle video sample buffer
            
        case RPSampleBufferType.audioApp:
            // Handle audio sample bufffer for app audio
            break
            
        case RPSampleBufferType.audioMic:
            // Handle audio sample buffer for mic audio
            break
            
        }
    }
    
}

extension SampleHandler: AssistSessionCallBack {
    
    func joinedSession(viewer id: String, name viewer: String) {
        print("joinedSession",id, "name", viewer)
    }
    
    func didReceived(chat: String, from viewerid: String) {
        print("Chat :\(chat.removingPercentEncoding ?? "")\nViewerid:\(viewerid)")
        asssionSession?.send(chat: "I received the chat. Thanks a lot... :),")
    }
    
    func didSession(disconnected state: SocketDisconnectStatus) {
        print("didSessionDisconnected")
    }
    
    func didSessionConnected() {
        print("didSessionConnected")
    }
    
    func didChangeImage(quality: ScreenQuality) {
        print("didChangeImage", quality)
    }
    
    func leftSession(viewer id: String) {
        print("leftSession", id)
    }
    

}
