# libgdiplus packaging for macOS

[![Build Status](https://github.com/CoreCompat/libgdiplus-packaging/actions/workflows/build.yaml/badge.svg)](https://github.com/CoreCompat/libgdiplus-packaging/actions/workflows/build.yaml)

[System.Drawing.Common](https://www.nuget.org/packages/System.Drawing.Common) is the graphics library which ships as part of .NET Core.
On macOS and Linux, it uses [libgdiplus](https://github.com/mono/libgdiplus) as its back-end.

You can acquire libgdiplus:
- For macOS, using the [mono-libgdiplus](https://formulae.brew.sh/formula/mono-libgdiplus)
Homebrew package
- For Ubuntu Linux, via the [libgdiplus](https://packages.ubuntu.com/search?keywords=libgdiplus&searchon=names&suite=all&section=all) package.

This repository contains scripts which distribute libgdiplus and its dependencies for macOS as a NuGet package. This may simplify
the deployment of .NET code which uses System.Drawing.Common for macOS environments.

To use this NuGet package, add a reference to the [runtime.osx.10.10-x64.CoreCompat.System.Drawing](https://www.nuget.org/packages/runtime.osx.10.10-x64.CoreCompat.System.Drawing):

```
dotnet add package runtime.osx.10.10-x64.CoreCompat.System.Drawing
```
