# VIPER with Swinject DI Xcode templates


VIPER iOS app template written in swift 5

A small example of the use DI Container "Swinject". 

# What is VIPER?

The VIPER pattern is a Clean Architecture that conforms to the Single Responsibility Principle. VIPER strives to divide the app’s logic into distinct layers of responsibility. Going a couple steps further than MVC, VIPER is broken down into five responsibilities:
 - View: Displays information from the Presenter and sends user interactions back to the Presenter.
 - Interactor: Retrieves Entities and contains the business logic for a particular use case. They are view agnostic and can be consumed by one or many Presenters.
 - Presenter: Handles preparing content for the display and intercepting user interactions.
 - Entity: Simple data model objects.
 - Router: Handles navigation logic for which screens should appear and when.
When implementing VIPER, each feature or module will follow the above structure. Since the app’s logic will be separated into smaller components, the views now become lighter and the logic now becomes more testable.

# What does it need for
1) It helps to add and change the code. Methods are more atomic because of using the principle of single responsibility. That’s why programmer doesn’t need to rewrite all code when he wants to add some new feature, he should only work with few methods. It greatly accelerates development.
2) It makes the code more testable, because of more atomic methods too — they are not black box for testing with a big variety of results.

# Dependency Injection in Swift
Many developers cringe when they hear the words dependency injection. It's a difficult pattern and it's not meant for beginners. That's what you are made to believe. The truth is that dependency injection is a fundamental pattern that is very easy to adopt.

