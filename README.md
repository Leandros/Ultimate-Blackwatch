Ultimate Blackwatch for iOS
======================

This repository contains the source code for the 'Ultimate Blackwatch' iOS application.
Development is done by [Arvid Gerstmann](http://github.com/leandros) and design by [Marie Schweiz](http://github.com/marieschweiz).


### Table of Contents
- Requirements
- Building
- Contributing
- Contact


### Requirements
- Mac OS X (minimum: 10.8.5, advised: 10.9.2)
- [XCode](https://itunes.apple.com/en/app/xcode/id497799835?mt=12) (minimum: 5.0.2, advised: 5.1.1)
- [Cocoapods](http://guides.cocoapods.org/using/getting-started.html#installation)

Building it on the commandline also requires [xcpretty](https://github.com/supermarin/xcpretty) and the XCode command-line tools.


### Building
Before you can build the project, you have to comply to all requirement and download the dependancies via Cocoapods.
You can do this by executing `pod install` in the root directory of this repository.
Building it on the command-line only requires calling `make`.
The project is compatible with either [AppCode](http://www.jetbrains.com/objc/) (use of AppCode is advised) or Apple's [XCode](https://developer.apple.com/xcode/).
Be sure to open the `.xcworkspace`, and not the `.xcodeproj`!


### Contributing
This project uses the [git-flow](http://nvie.com/posts/a-successful-git-branching-model/) branching models.
Understanding the usage of git-flow is necassary. 
Contribution is done through forking this repository, creating a new feature branch and opening a pull request to the original repository.

```
git flow feature start your-feature
git commit # commit some stuff
git flow feature publish your-feature
```

Squashing commits before publishing the feature is recommended.
Your pull request will be reviewed and merged into the main repository.


### Contact
The maintainer of this project is [Leandros](https://github.com/leandros). 
Contact by E-Mail is encouraged [dev@arvid-g.de](mailto:dev@arvid-g.de).


