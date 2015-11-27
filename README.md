# DHAvoidKeyboardBehaviour

A [behaviour][objc] for iOS apps to ensure scroll view content is not covered by the keyboard.

[objc]: http://www.objc.io/issue-13/behaviors.html 

Also includes a class that helps with using Dynamic Type (content size categories).

## Status

Seems to work, but not thoroughly tested or in production. The animations can look rough when dismissing the keyboard interactively.

Last tested with Xcode 7.2 and the iOS 9.2 SDK.

## Usage

Create a `DHAvoidKeyboardBehaviour` and set its `scrollView` to the scroll view that should avoid the keyboard. This can be done in Interface Builder. Keep the behaviour object alive.

## Licence

MIT license — see License.txt
