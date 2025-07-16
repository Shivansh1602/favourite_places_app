import 'package:favourite_places_app/screens/place_list_screen.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light, // Switched to light for a brighter look
  seedColor: const Color.fromARGB(255, 52, 199, 89), // Vibrant green for energy
  primary: const Color.fromARGB(255, 52, 199, 89), // Consistent primary color
  secondary: const Color.fromARGB(255, 255, 171, 64), // Warm orange accent
  surface: const Color.fromARGB(255, 245, 245, 250), // Soft off-white for clean background
  onPrimary: Colors.white, // White text/icons on primary color
  onSecondary: Colors.black, // Dark text/icons on secondary for contrast
  onSurface: Colors.black87, // Slightly soft black for text on surface
);

final theme = ThemeData().copyWith(
  colorScheme: colorScheme,
  scaffoldBackgroundColor: colorScheme.surface,
  textTheme: GoogleFonts.poppinsTextTheme().copyWith( // Poppins for a modern, friendly font
    titleSmall: GoogleFonts.poppins(
      fontWeight: FontWeight.w600, // Semi-bold for better readability
      color: colorScheme.onSurface,
    ),
    titleMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: colorScheme.onSurface,
    ),
    titleLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w700, // Bolder for headings
      color: colorScheme.onSurface,
    ),
    bodySmall: GoogleFonts.poppins(
      fontWeight: FontWeight.normal,
      color: colorScheme.onSurface.withOpacity(0.8), // Slightly lighter for body text
    ),
    bodyMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.normal,
      color: colorScheme.onSurface,
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: colorScheme.primary, // Vibrant app bar
    foregroundColor: colorScheme.onPrimary, // White text/icons on app bar
    elevation: 2, // Subtle shadow for depth
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: colorScheme.secondary, // Orange buttons for pop
      foregroundColor: colorScheme.onSecondary, // Black text on buttons
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners for modern look
      ),
    ),
  ),
);
void main() {
  runApp(
      const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Great Places',
      theme: theme,
      home: const PlaceListScreen(),
    );
  }
}