//
//  Lab Objectives.swift
//  GitHubOAuth
//
//  Created by Ismael Barry on 8/2/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

//https://github.com/learn-co-students/swift-gitHubOAuth-part1-lab-ios-0616

// Lab Objectives:

// 1. Register your application with GitHub to receive a Client ID and a Client Secret.
// 2. Set up an Authorization callback URL on GitHub.
// 3. Set up a URL Scheme in Xcode for your application.
// 4. Direct user at login to GitHub for authorization.
// 5. Handle callback from GitHub containing a temporary code.
// 6. Use code to authenticate user and receive access token.
// 7. Save the access token in your application.
// 8. Use the access token to make requests for user account information.

// Instructions:

// 1. SET UP YOUR CALLBACK URL
// - Head on over to GitHub.
// - If you don't have a Client ID and a Client Secret set up from previous labs, go to Settings > OAuth Applications > Developer Applications > Register and start registering your new application.
// - Whether you are registering a new application or have your application selected, find the header at the bottom of the form titled Authoriation callback URL.
// - Enter some text following this format: gitHubOAuthLab-12345://callback. The first section, gitHubOAuthLab-12345, can be whatever you want. It's intended to be unique to your application.
// - Head on over to your project in Xcode and select your project in the the Project Navigator.
// - In the editor, select your project target, then select Info and look at the bottom of the list for URL Types.
// - Expand the URL Types section and click on the plus sign.
// - Enter your URL Scheme using the unique name you created above (e.g., gitHubOAuthLab-12345) and press enter. This will update your Info.plist file with your new URL scheme.

// 2. ADD YOUR SECRETS FILE
// - Create your Secrets file and add your Client ID and Client Secret
// struct Secrets {
    // static let clientID = ""
    // static let clientSecret = ""
// }

// 3. SET UP YOUR OAUTH URLS
// There are a few URL strings you will need for OAuth related requests. The GitHubAPIClient has a handy enum called URLRouter that keeps them organized in one place. An example usage is let urlString = GitHubAPIClient.URLRouter.oauth.
// Replace the existing code inside the body of the URLRouter enum with the following code snippet. Check out GitHub to learn about how .oath was constructed and what .token is for. You will update the static starred(repoName:) later to include your user's access token.

// 4. USE SFSAFARIVIEWCONTROLLER TO REQUEST AUTHORIZATION
// Locate the loginButtonTapped(_:) IBAction method in the LoginViewController class.
// Inside the method, use GitHubAPIClient.URLRouter.oath to create an NSURL and initialize a SFSafariViewController using the url.
// Note: The safari view controller streamlines the process of directing a user to GitHub by providing easy access to a stripped down version of the Safari web browser.
// Hint: Import the Safari Services framework to use SFSafariViewController. Also, you will need a reference to the safari view controller from a couple of methods within the LoginViewController class.
// Present the controller.
// Run the application to see if your safari view controller is presented when the login button is tapped (Don't bother entering your GitHub credentials yet).
// Stop the application.

// 5. HANDLE THE CALLBACK FROM GITHUB
// In the previous step the user is directed to GitHub using a safari view controller to provide authorization. Once the user successfully completes authorization, the callback you provided in your GitHub account is used to trigger the URL Scheme you provided in your project settings. Additionally, the safari view controller calls a UIApplicatioDelegate method called application(_:open:options:) that passes a URL containing a temporary code received from the GitHub callback.
// Add the application(_:open:options:) method to your AppDelegate file.
// Get the value for the key "UIApplicationOpenURLOptionsSourceApplicationKey" from the options dictionary.
// If the value equals "com.apple.SafariViewService", return true.
// Up until now you probably haven't used NSNotificationCenter but you're about to take a crash course. In the simplest terms, you can post a notification saying, "HEY! SOMETHING HAPPENED!". An observer of the notification will be notified somewhere else in the application (and would probably say to themselves, "Why are you yelling at me? 😥").
// Here are the two notification statements you will use in your application:
// Post notification
// NSNotificationCenter.defaultCenter().postNotificationName(_:object:)

// Add observer
// NSNotificationCenter.defaultCenter().addObserver(_:selector:name:object:)

// Now that you are a notification's expert, let's continue.
// In the previous step you verified the value, "com.apple.SafariViewService" and returned true. Add a post notification immediately before the return. Use your Notifications struct from your Constants file to provide the name .closeSafariVC. Pass the value from the incoming url argument to the object parameter of the notification.
// Note: As mentioned above, the incoming url argument value contains a temporary code that we need to proceed with the GitHub authentication process.
// Head back to the LoginViewController class and add a method called safariLogin that takes one argument called notification of type NSNotification and returns nothing.
// Add a notification observer inside viewDidLoad() of the LoginViewController class.
// The observer is the LoginViewController.
// The selector is the method you just created above.
// The name is the name you used for the post notification in the app delegate.
// The object is nil.
// Inside safariLogin(_:) get the absolute URL value from the notification argument and print it in the debugger.
// Hint: Explore the properties on notification.
// Dismiss the safari view controller.
// Run the application, provide your credentials to GitHub in the safari view controller, and authorize the application.
// The URL containing the temporary code should print to the debugger and the safari view controller should be dismissed.