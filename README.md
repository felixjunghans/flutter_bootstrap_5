# Flutter Bootstrap 5

This package is used to support the creation of responsive web applications with Flutter. 
It is based on the well-known CSS framework Bootstrap 5 and offers many features that can also be found in Bootstrap.

If you want to have a quick overview of the most important functions and test them directly, you can do so here

[FLUTTER BOOTSTRAP 5 EXAMPLE WEBSITE](https://flutter-bootstrap-5.web.app/#/)


###### Small Example
![Small Example](https://media.giphy.com/media/TGsjMX7RQu4IYCcJhD/giphy.gif)

## Getting Started

### Configure Flutter Bootstrap5

To use Flutter Bootstrap5 anywhere in your app, you don't have to do anything but wrap your MaterialApp with the [FlutterBootstrap5] widget.

```dart
        FlutterBootstrap5(
            builder: (ctx) => MaterialApp(...),
        );
```

### App Theming

You have various possibilities to customize Flutter Bootstrap5 for your needs.
You can also leave it at the default values to get the default behavior of a Bootstrap5 app.

Currently the following customization options are supported:

#### BreakPoints

To set your own BreakPoints, you can simply pass the BreakPoints class to the [FlutterBootstrap5] widget.
By default the current BreakPoints of Bootstrap5 CSS are used

```dart
        class _BootstrapBreakPoints {
          static const BreakPoint xs = BreakPoint(minWidth: 0, maxWidth: 576);
          static const BreakPoint sm = BreakPoint(minWidth: 576, maxWidth: 768);
          static const BreakPoint md = BreakPoint(minWidth: 768, maxWidth: 992);
          static const BreakPoint lg = BreakPoint(minWidth: 992, maxWidth: 1200);
          static const BreakPoint xl = BreakPoint(minWidth: 1200, maxWidth: 1400);
          static const BreakPoint xxl =
          BreakPoint(minWidth: 1400, maxWidth: double.infinity);
        }
```

#### Container BreakPoints

Beside the normal BreakPoints you can also define your own BreakPoints for the [FB5Container]. 
These determine which width a [FB5Container] should have at a certain BreakPoint.

By default the current Container BreakPoints of Bootstrap5 CSS are used

```dart
      class _BootstrapContainerBreakPoints {
        static const double xs = double.infinity;
        static const double sm = 540;
        static const double md = 720;
        static const double lg = 960;
        static const double xl = 1140;
        static const double xxl = 1320;
      }
```

#### Default Fontsize

With the parameter defaultFontSize you can specify the default font size to be used for the calculation of "rem" values. 
Bootstrap CSS uses rem to calculate margins, paddings and also font size. 
Similarly, these values are also calculated in Flutter Bootstrap5 depending on the defaultFontSize.

The default value is 16.0

#### Typography

Flutter Bootstrap5 uses a font size calculation mechanism based on Bootstrap CSS. 
So font sizes change dynamically depending on the screen size.

To customize this behavior you can pass the [FB5Typography] class to FlutterBootstrap5.



### Use the theme in your MaterialApp

After configuring [FlutterBootstrap5] to your liking,
you can now pass the theme to your MaterialApp to take full advantage of Flutter Bootstrap 5.

```dart
        MaterialApp(
            title: 'Flutter Bootstrap5 Demo',
            theme: BootstrapTheme.of(ctx).toTheme( [PASS YOUR THEME TO OVERRIDE BOOTSTRAP THEME IF YOU WANT TO] ),
            home: const Home(),
        ),
```

# So now let's talk about the features

## Currently supported Bootstrap classes

| Description               | Base class           | Variations                                | Responsive Supported |
|---------------------|----------------------|-------------------------------------------|----------------------|
| `Width of a column` | `col`                | `col-{1-12}`,                             |&check;|
| `Columns per row`   | `row-cols`           | `row-cols-{1-*}`,                         |&check;|
| `Padding`           | `p`                  | `p-{1-5}`, `p-{1-5}`                               ||
| `step`              | `num`                | `x`                                       ||
| `displayFormat`     | `NumberFormat`       |                                           ||
| `textStyle`         | `TextStyle`          | `TextStyle(fontSize: 24)`                 ||
| `iconSize`          | `double`             | `24.0`                                    ||
| `addIcon`           | `Icon`               | `Icon(Icons.add)`                         ||
| `subtractIcon`      | `Icon`               | `Icon(Icons.remove)`                      ||
| `iconActiveColor`   | `Color`              | `Theme.of(context).textTheme.button.color` ||
| `iconDisabledColor` | `Color`              | `Theme.of(context).disabledColor`         ||
| `iconPadding`       | `EdgeInsetsGeometry` | `EdgeInsets.all(4.0)`                     ||
| `onChanged`         | `ValueChanged<num>`  |                                           ||

## Widgets

### FB5Container

```dart
    import 'package:google_speech/google_speech.dart';
    
    final speechToText = SpeechToText.viaServiceAccount(serviceAccount);
```

### ROADMAP 2022 / 2023

- [x] Update streamingRecognize example

