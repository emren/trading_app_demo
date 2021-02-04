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


- Developer dependencies for best practices
	-  linter [https://pub.dev/packages/linter](https://pub.dev/packages/linter) (BSD)
	-  effective dart [https://pub.dev/packages/effective_dart](https://pub.dev/packages/effective_dart) (MIT)
	-  analyzer [https://pub.dev/packages/analyzer](https://pub.dev/packages/analyzer) (BSD)


