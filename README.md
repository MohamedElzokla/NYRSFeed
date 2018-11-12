# NYRSFeed
Show a list of articles from NY Times Most Popular Articles API (api.nytimes.com)

# Structure
- This project utilizes MVC design pattern.
- Each UIViewController is a subclass of BaseVC class so that we can add customization to viewcontrollers and extends usabiltiy 
- Each model is conforming to Mappable protocol to ease key mapping between API and properties in model
- There is a module called WebService that is responsible for making API calls.
- Side menu is constructed via MMDrawerController

# Installation
-  Open Terminal app 
-  cd to the project directory
-  run command 'pod install'
-  Open project from created workspace called 'NYRSFeed.xcworkspace'
