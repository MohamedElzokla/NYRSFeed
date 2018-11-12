# NYRSFeed
Show a list of articles from NY Times Most Popular Articles API (api.nytimes.com)

# Structure

### Desgin Patteren
- This project utilizes MVC design pattern.
- Each UIViewController is a subclass of BaseVC class so that we can add customization to viewcontrollers and extends usabiltiy .
- Each model is conforming to Mappable protocol to ease key mapping between API and properties in model.

### API handling
- There is a module called WebService that is responsible for making API calls.
- Each API call will result a response that is subclass from ServerResponse to spread request status to all subsequent classes.

### Helpers
- Helper extensions added to minimize repeated code. For example there are inspectable properties added to UIView to add more customization from storyboard

# Installation
-  Open Terminal app 
-  cd to the project directory
-  run command 'pod install'
-  Open project from created workspace called 'NYRSFeed.xcworkspace'
