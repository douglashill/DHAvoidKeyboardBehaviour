This project is not maintained. For a more modern take, [check out this approach using `additionalSafeAreaInsets`](https://gist.github.com/douglashill/41ea84f0ba59feecd3be51f21f73d501).

# DHAvoidKeyboardBehaviour

A [behaviour][objc] for iOS apps to ensure scroll view content is not covered by the keyboard. With iPad Split View, [the keyboard could cover an app at any time, when the app isn’t using the keyboard itself][uyl].

[objc]: http://www.objc.io/issue-13/behaviors.html 
[uyl]: http://useyourloaf.com/blog/split-views-and-unexpected-keyboards.html

This repository also includes a class that helps with using Dynamic Type (content size categories).

## Status

It works and I would ship this, although I don’t know of a production app using exactly this code.

Last tested with Xcode 7.2 and the iOS 9.2 SDK.

## Usage

Create a `DHAvoidKeyboardBehaviour` and set its `scrollView` to the scroll view that should avoid the keyboard. This can be done in Interface Builder. Keep the behaviour object alive.

## Licence

MIT license — see License.txt
