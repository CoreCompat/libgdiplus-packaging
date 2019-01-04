# libgdiplus packaging

[![Build Status](https://dev.azure.com/corecompat/libgdiplus/_apis/build/status/CoreCompat.libgdiplus-packaging?branchName=master)](https://dev.azure.com/corecompat/libgdiplus/_build/latest?definitionId=1?branchName=master)

[System.Drawing.Common](https://www.nuget.org/packages/System.Drawing.Common) is the graphics library which ships as part of .NET Core.
On macOS and Linux, it uses [libgdiplus](https://github.com/mono/libgdiplus) as its back-end.

There are existing ways to install libgdiplus on macOS and Linux. On macOS, you can use the [mono-libgdiplus](https://formulae.brew.sh/formula/mono-libgdiplus)
Homebrew package; on Ubuntu Linux, you can install the [libgdiplus-dev](https://packages.ubuntu.com/search?keywords=libgdiplus&searchon=names&suite=all&section=all) package.

Unfortunately, these packages are all relatively out of date. The aim of this project is to provide you with more recent builds of libgdiplus.

This repository contains scripts which help you package libgdiplus for use with your .NET Core application.

Currently, libgdiplus is packaged in two ways:

* For Ubuntu Linux, as a PPA (personal package archive).
* For macOS, as a NuGet package which you can reference.

## Using libgdiplus on Ubuntu Linux

You can install libgdiplus on Ubuntu Linux using the Quamotion PPA. Follow these steps:

```
sudo add-apt-repository ppa:quamotion/ppa
sudo apt-get update
sudo apt-get install -y libgdiplus
```

## Using libgdiplus on macOS

On macOS, add a reference to the [runtime.osx.10.10-x64.CoreCompat.System.Drawing](https://www.nuget.org/packages/runtime.osx.10.10-x64.CoreCompat.System.Drawing) package:

```
dotnet add package runtime.osx.10.10-x64.CoreCompat.System.Drawing
```
