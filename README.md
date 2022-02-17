# Cryptocurrency_Converter_App

<!-- ![alt text](screenshot.png "Screenshot") -->

## Getting Started

These instructions will give you heads up on how to get started, architecture flow, implementations using in this project.

### Architecture.

I decide to adopt ```Clean Architecture``` for our development because it allow decoupling different units of your code in an organized manner. That way the code gets easier to understand, modify and test. Read more about this [here](https://dev.to/george_andronchik/clean-architecture-of-flutter-application-part-2-practice-3562)


## The project consist of some basic implementations and patterns which includes:

* MVVM architectural approaches for the Presentation layer
* Network operations with [Dio](https://pub.dev/packages/dio)

* [json_serializable](https://pub.dev/packages/json_serializable) for JSON serialization and deserialization .
* [get_it](https://pub.dev/packages/get_it) For simple Service Locator 
* [hooks_riverpod](https://pub.dev/packages/hooks_riverpod) A state-management library that:
  * catches programming errors at compile time rather than at runtime
  * removes nesting for listening/combining objects
  * ensures that the code is testable


## Documentation & Comments
We use docs blocks to write description documentation and comment for classess and methods. This should clearly describe it functionality and logic executions.


### Installing & Setup

* Clone this project from Github to your machine
* Import project to Android Studio preferring from Android Studio Bumblebee | 2021.1.1 Patch 1 and above
* To install the app on your device, you can get the apk from this directory: build/app/outputs/flutter-apk/app-release.apk


## To-do
1. Writing Unit Tests


## How to contribute effectively
1. Branch out from the master branch to your feature branch

### Domain Layer
1. Create Model classes for the feature if needed.
2. Add the use case to the neccessary repository interface.
3. Create Usecases for the feature in the `interactors`
4. If the Usecase needs any data to carry out any operation provide a nested param class.

### Network(Data) Layer
1. Add remote and cache operations to the `Cache` and `Remote` interface.
2. Add the cache or remote interface implementation to its correct data source classes.
3. Add the implmentation of the domain interface repository in the data

### Presentation layer
- Update use case implementaion in the ViewModel classes

### UI Layer
- Add your UI Implementation as specified in the design
- Use viewmodel to interact with the other layers of the application.

## Application :camera_flash: Screenshots / GIFs


https://user-images.githubusercontent.com/43546652/154378222-049ecf9b-fc72-4638-8fbc-59130ab09b0d.mp4

