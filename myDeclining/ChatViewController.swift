//
//  ChatViewController.swift
//  myDeclining
//
//  Created by Christopher Bell on 7/17/16.
//  Copyright © 2016 Christopher Bell. All rights reserved.
//

import Firebase
import JSQMessagesViewController

class ChatViewController: JSQMessagesViewController {
	var messages = [JSQMessage]()
	var outgoingBubbleImageView: JSQMessagesBubbleImage!
	var incomingBubbleImageView: JSQMessagesBubbleImage!
	let rootRef = FIRDatabase.database().reference()
	var messageRef: FIRDatabaseReference!
	
	override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {
		let itemRef = messageRef.childByAutoId()
		let messageItem = [
			"text": text,
			"senderId": senderId
		]
		itemRef.setValue(messageItem)
		
		JSQSystemSoundPlayer.jsq_playMessageSentSound()
		finishSendingMessage()
	}
	
	private func observeMessages() {
		let messagesQuery = messageRef.queryLimitedToLast(25)
		messagesQuery.observeEventType(.ChildAdded) { (snapshot: FIRDataSnapshot!) in
			let id = snapshot.value!["senderId"] as! String
			let text = snapshot.value!["text"] as! String
			
			self.addMessage(id, text: text)
			
			self.finishSendingMessage()
 		}
	}
	
	func addMessage(id: String, text: String){
		let message = JSQMessage(senderId: id, displayName: "", text: text)
		messages.append(message)
	}
	
	private func setupBubbles(){
		let factory = JSQMessagesBubbleImageFactory()
		outgoingBubbleImageView = factory.outgoingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleBlueColor())
		incomingBubbleImageView = factory.incomingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleLightGrayColor())
	}
	
	override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData!{
		return messages[indexPath.item]
	}
	
	override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
		return messages.count
	}
	
	override func collectionView(collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource! {
		let message = messages[indexPath.item]
		if message.senderId == senderId{
			return outgoingBubbleImageView
		}else{
			return incomingBubbleImageView
		}
	}
	
	override func collectionView(collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageAvatarImageDataSource! {
		return nil
	}
	
	override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = super.collectionView(collectionView, cellForItemAtIndexPath: indexPath) as! JSQMessagesCollectionViewCell
		let message = messages[indexPath.item]
		
		if message.senderId == senderId{
			cell.textView!.textColor = UIColor.whiteColor()
		}else{
			cell.textView!.textColor = UIColor.blackColor()
		}
		
		return cell
	}
	
//	override func viewDidAppear(animated: Bool) {
//		super.viewDidAppear(animated)
//		addMessage("foo", text: "Hey Person!")
//		addMessage(senderId, text: "YO!")
//		addMessage(senderId, text: "I like turtles!")
//		finishReceivingMessage()
//	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		observeMessages()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupBubbles()
		collectionView!.collectionViewLayout.incomingAvatarViewSize = CGSizeZero
		collectionView!.collectionViewLayout.outgoingAvatarViewSize	= CGSizeZero
		let currentUser = FIRAuth.auth()?.currentUser
		messageRef = rootRef.child("messages\(currentUser!.uid)")
	}
	
}
