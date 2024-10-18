import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff8d4959),
      surfaceTint: Color(0xff8d4959),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffd9df),
      onPrimaryContainer: Color(0xff3a0718),
      secondary: Color(0xff75565c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffd9df),
      onSecondaryContainer: Color(0xff2b151a),
      tertiary: Color(0xff006a67),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff9cf1ec),
      onTertiaryContainer: Color(0xff00201f),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffff8f7),
      onBackground: Color(0xff22191b),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff22191b),
      surfaceVariant: Color(0xfff3dde0),
      onSurfaceVariant: Color(0xff524345),
      outline: Color(0xff847375),
      outlineVariant: Color(0xffd6c2c4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2f),
      inverseOnSurface: Color(0xfffeedee),
      inversePrimary: Color(0xffffb1c1),
      primaryFixed: Color(0xffffd9df),
      onPrimaryFixed: Color(0xff3a0718),
      primaryFixedDim: Color(0xffffb1c1),
      onPrimaryFixedVariant: Color(0xff713342),
      secondaryFixed: Color(0xffffd9df),
      onSecondaryFixed: Color(0xff2b151a),
      secondaryFixedDim: Color(0xffe4bdc3),
      onSecondaryFixedVariant: Color(0xff5b3f45),
      tertiaryFixed: Color(0xff9cf1ec),
      onTertiaryFixed: Color(0xff00201f),
      tertiaryFixedDim: Color(0xff80d5d0),
      onTertiaryFixedVariant: Color(0xff00504d),
      surfaceDim: Color(0xffe7d6d8),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0f1),
      surfaceContainer: Color(0xfffbeaeb),
      surfaceContainerHigh: Color(0xfff5e4e6),
      surfaceContainerHighest: Color(0xffefdee0),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff6c2f3e),
      surfaceTint: Color(0xff8d4959),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa75f6f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff573b41),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff8d6c72),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff004b49),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff24817d),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff8f7),
      onBackground: Color(0xff22191b),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff22191b),
      surfaceVariant: Color(0xfff3dde0),
      onSurfaceVariant: Color(0xff4d3f41),
      outline: Color(0xff6b5b5d),
      outlineVariant: Color(0xff887679),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2f),
      inverseOnSurface: Color(0xfffeedee),
      inversePrimary: Color(0xffffb1c1),
      primaryFixed: Color(0xffa75f6f),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff8a4757),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff8d6c72),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff72545a),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff24817d),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff006764),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe7d6d8),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0f1),
      surfaceContainer: Color(0xfffbeaeb),
      surfaceContainerHigh: Color(0xfff5e4e6),
      surfaceContainerHighest: Color(0xffefdee0),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff430e1e),
      surfaceTint: Color(0xff8d4959),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff6c2f3e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff331b20),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff573b41),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff002726),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff004b49),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff8f7),
      onBackground: Color(0xff22191b),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xfff3dde0),
      onSurfaceVariant: Color(0xff2d2123),
      outline: Color(0xff4d3f41),
      outlineVariant: Color(0xff4d3f41),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2f),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffffe6e9),
      primaryFixed: Color(0xff6c2f3e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff511929),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff573b41),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3f262b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff004b49),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003331),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe7d6d8),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0f1),
      surfaceContainer: Color(0xfffbeaeb),
      surfaceContainerHigh: Color(0xfff5e4e6),
      surfaceContainerHighest: Color(0xffefdee0),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb1c1),
      surfaceTint: Color(0xffffb1c1),
      onPrimary: Color(0xff551d2c),
      primaryContainer: Color(0xff713342),
      onPrimaryContainer: Color(0xffffd9df),
      secondary: Color(0xffe4bdc3),
      onSecondary: Color(0xff43292e),
      secondaryContainer: Color(0xff5b3f45),
      onSecondaryContainer: Color(0xffffd9df),
      tertiary: Color(0xff80d5d0),
      onTertiary: Color(0xff003735),
      tertiaryContainer: Color(0xff00504d),
      onTertiaryContainer: Color(0xff9cf1ec),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff191113),
      onBackground: Color(0xffefdee0),
      surface: Color(0xff191113),
      onSurface: Color(0xffefdee0),
      surfaceVariant: Color(0xff524345),
      onSurfaceVariant: Color(0xffd6c2c4),
      outline: Color(0xff9f8c8f),
      outlineVariant: Color(0xff524345),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffefdee0),
      inverseOnSurface: Color(0xff382e2f),
      inversePrimary: Color(0xff8d4959),
      primaryFixed: Color(0xffffd9df),
      onPrimaryFixed: Color(0xff3a0718),
      primaryFixedDim: Color(0xffffb1c1),
      onPrimaryFixedVariant: Color(0xff713342),
      secondaryFixed: Color(0xffffd9df),
      onSecondaryFixed: Color(0xff2b151a),
      secondaryFixedDim: Color(0xffe4bdc3),
      onSecondaryFixedVariant: Color(0xff5b3f45),
      tertiaryFixed: Color(0xff9cf1ec),
      onTertiaryFixed: Color(0xff00201f),
      tertiaryFixedDim: Color(0xff80d5d0),
      onTertiaryFixedVariant: Color(0xff00504d),
      surfaceDim: Color(0xff191113),
      surfaceBright: Color(0xff413738),
      surfaceContainerLowest: Color(0xff140c0e),
      surfaceContainerLow: Color(0xff22191b),
      surfaceContainer: Color(0xff261d1f),
      surfaceContainerHigh: Color(0xff312829),
      surfaceContainerHighest: Color(0xff3c3234),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb8c5),
      surfaceTint: Color(0xffffb1c1),
      onPrimary: Color(0xff330313),
      primaryContainer: Color(0xffc87a8b),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffe8c1c7),
      onSecondary: Color(0xff251015),
      secondaryContainer: Color(0xffab888e),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff85d9d4),
      onTertiary: Color(0xff001a19),
      tertiaryContainer: Color(0xff489e9a),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff191113),
      onBackground: Color(0xffefdee0),
      surface: Color(0xff191113),
      onSurface: Color(0xfffff9f9),
      surfaceVariant: Color(0xff524345),
      onSurfaceVariant: Color(0xffdac6c8),
      outline: Color(0xffb19ea1),
      outlineVariant: Color(0xff907f81),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffefdee0),
      inverseOnSurface: Color(0xff312829),
      inversePrimary: Color(0xff723443),
      primaryFixed: Color(0xffffd9df),
      onPrimaryFixed: Color(0xff2c000e),
      primaryFixedDim: Color(0xffffb1c1),
      onPrimaryFixedVariant: Color(0xff5d2232),
      secondaryFixed: Color(0xffffd9df),
      onSecondaryFixed: Color(0xff1f0b10),
      secondaryFixedDim: Color(0xffe4bdc3),
      onSecondaryFixedVariant: Color(0xff492f34),
      tertiaryFixed: Color(0xff9cf1ec),
      onTertiaryFixed: Color(0xff001413),
      tertiaryFixedDim: Color(0xff80d5d0),
      onTertiaryFixedVariant: Color(0xff003d3b),
      surfaceDim: Color(0xff191113),
      surfaceBright: Color(0xff413738),
      surfaceContainerLowest: Color(0xff140c0e),
      surfaceContainerLow: Color(0xff22191b),
      surfaceContainer: Color(0xff261d1f),
      surfaceContainerHigh: Color(0xff312829),
      surfaceContainerHighest: Color(0xff3c3234),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9f9),
      surfaceTint: Color(0xffffb1c1),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffb8c5),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9f9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe8c1c7),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffeafffd),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff85d9d4),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff191113),
      onBackground: Color(0xffefdee0),
      surface: Color(0xff191113),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff524345),
      onSurfaceVariant: Color(0xfffff9f9),
      outline: Color(0xffdac6c8),
      outlineVariant: Color(0xffdac6c8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffefdee0),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff4d1626),
      primaryFixed: Color(0xffffdfe4),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb8c5),
      onPrimaryFixedVariant: Color(0xff330313),
      secondaryFixed: Color(0xffffdfe4),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe8c1c7),
      onSecondaryFixedVariant: Color(0xff251015),
      tertiaryFixed: Color(0xffa1f6f1),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff85d9d4),
      onTertiaryFixedVariant: Color(0xff001a19),
      surfaceDim: Color(0xff191113),
      surfaceBright: Color(0xff413738),
      surfaceContainerLowest: Color(0xff140c0e),
      surfaceContainerLow: Color(0xff22191b),
      surfaceContainer: Color(0xff261d1f),
      surfaceContainerHigh: Color(0xff312829),
      surfaceContainerHighest: Color(0xff3c3234),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
