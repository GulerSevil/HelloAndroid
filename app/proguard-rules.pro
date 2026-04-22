# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.kts.
#
# For more details, see:
#   http://developer.android.com/guide/developing/tools/proguard.html

# Preserve line number information for stack traces
-keepattributes SourceFile,LineNumberTable
-renamesourcefileattribute SourceFile

# Keep the app's entry points
-keep class com.demo.hello.MainActivity { *; }
