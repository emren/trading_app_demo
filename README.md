# Trading App Demo


##  1. Description

Trading app demo is a minimum viable product **(MVP)** of a larger project aiming to show end user that it is possible to get data from endpoint apis and show it in a user friendly way.
The data that will be presented will come as timeseries and will be presented in charts.
Endpoint will provide a data object containing different timeseries as well as details of the object such as code and symbol of the financial product that it represents.

## 2. Technology

### Chosen Technology

The trading app demo is written in **Dart** language with **Flutter** Framework. The version of Flutter that has been used in development is **Flutter 1.22.6 • channel stable** . The version of Dart that has been used in development is **Dart 2.10.5**


### Reason for Technology Decision


Flutter will enable **crossplatform** usage of the application on both Android and IOS. Flutter is Google's latest technology targeting to replace Android in the coming years. Hot reload feature is speeding up development process vs native implementations. Additionally, **Dart code is compiled into native** code thus making Flutter applications as fast as Native ones.


### Project Structure
The layering is separated into two. The first one is **Core** where all the logic goes into here. All State management, service calls, utilities and models will be here. The other one is **UI**, where all UI related codes will go. This will hold pages and widgets.
The structure is presented below

```
/lib
	/core
		/models
		/providers
		/services
		/utils
	/ui
		/pages
		/widgets
/test
	/unit_tests
```
### 3rd Party Dependencies & Licenses

The following libraries are foundational requirements for the implementation.
They are implemented in the pubspec file

```
pubspec.yaml

```
- IO libraries
	-  dio [https://pub.dev/packages/dio](https://pub.dev/packages/dio) (MIT)
	-  dio flutter transformer [https://pub.dev/packages/dio_flutter_transformer](https://pub.dev/packages/dio_flutter_transformer) (unknown)

- State management libraries
	-  provider [https://pub.dev/packages/provider](https://pub.dev/packages/provider) (MIT)
	-  after init [https://pub.dev/packages/after_init](https://pub.dev/packages/after_init) (MIT)

- UI libraries
	-  fl chart [https://pub.dev/packages/fl_chart](https://pub.dev/packages/fl_chart) (BSD)

- Testing
	-  mockito [https://pub.dev/packages/mockito](https://pub.dev/packages/mockito) (Apache 2.0)

- Developer dependencies for best practices
	-  linter [https://pub.dev/packages/linter](https://pub.dev/packages/linter) (BSD)
	-  effective dart [https://pub.dev/packages/effective_dart](https://pub.dev/packages/effective_dart) (MIT)
	-  analyzer [https://pub.dev/packages/analyzer](https://pub.dev/packages/analyzer) (BSD)


## 3. Applied Software Patterns

To allow extensibility, modularization and separation of concerns the following patterns have been applied:

- **Providers<br />**
Trading app demo has state management via the Provider package. Provider is the recommended state management solution by the Flutter team.
[https://flutter.dev/docs/development/data-and-backend/state-mgmt/options](https://flutter.dev/docs/development/data-and-backend/state-mgmt/options) .
Before provider, google's flutter team was recommending BLoC, but as of today, recommendation is Provider.
The state is held at Provider classes which extends Flutters own ChangeNotifier class. The Providers are on top of the widget tree and wrapped around the MaterialApp which is the initial widget of the Flutter framework. This structure allows state to be accessible from anywhere of the widget tree and rebuild widgets on notifyListeners() calls. This wrapping is via a MultiProvider and can be found at



```
main.dart
```




- **MVC Layering<br />**
By separating UI and Logic folders and files, we establish a reusable logic section which in further implementations we can use it as is and revise the UI accordingly. MVC stands for Model, View and Control. Our Model and Control files are under **/core**. Our View files are under **/ui**.

## 4. Testing
Regarding testing Google's [test](https://pub.dev/packages/test) package is used. Additionally, a mock library is needed to test the api calls, [mockito](https://pub.dev/packages/mockito) is used for this reason. There are unit tests to test the logic, and to test the services class to evaluate the end user experience. Testing classes are under

```
/test
```

## 5. Steps taken when working on the project
- GET requests made to receive a 200 status from endpoint and service class is created
- The json file containing the data has been received is analyzed and modeled
- Provider class to hold the state and the model has created
- UI design of FinFree analyzed
- UI design similar to FinFree is implemented
- Unit tests have been written to test the logic and service
- Read.me rewritten to provide the technical documentation
