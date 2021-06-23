#!/bin/sh

path=$(pwd)
out="$path/out/usr/local"

# Remove the output folder, if it already exists
rm -rf "$out"

# The X11 headers are installed via Xquartz, and they are installed in
# /usr/X11 instead of /opt, where ./autogen seems to expect them
cd "$path/libgdiplus"
./autogen.sh --prefix="$out" CPPFLAGS="-I/usr/X11/include/" --without-x11
make clean
make
make check
make install

# Copy the dependent dylibs from /usr/local/opt to the $out dir
echo "---- libgdiplus dependencies:"
otool -L "$out/lib/libgdiplus.dylib"
echo "---- libgdiplus dependencies"

dylibs=`otool -L "$out/lib/libgdiplus.dylib" | grep "/usr/local" | awk -F' ' '{ print $1 }'`

for dylib in $dylibs; do
  cp $dylib "$out/lib/"
done;

# libcairo has various dependencies, so include those too
dylibs=`otool -L "$out/lib/libcairo.2.dylib" | grep "/usr/local" | awk -F' ' '{ print $1 }'`

for dylib in $dylibs; do
  cp $dylib "$out/lib/"
done;

# libxcb has various dependencies, so include those too
dylibs=`otool -L "$out/lib/libxcb.1.dylib" | grep "/usr/local" | awk -F' ' '{ print $1 }'`

for dylib in $dylibs; do
  cp $dylib "$out/lib/"
done;

# libxcb has various dependencies, so include those too
dylibs=`otool -L "$out/lib/libglib-2.0.0.dylib" | grep "/usr/local" | awk -F' ' '{ print $1 }'`

for dylib in $dylibs; do
  cp $dylib "$out/lib/"
done;

# Patch the dylib dependencies for all .dylib files in the out directory
for f in "$out/lib/"*.dylib; do
   chmod +w "$f"

   # Skip the first two lines of the otool output, this is just the name of the dylib itself
   dylibs=`otool -L "$f" | tail -n +3 | grep "/usr/local" | awk -F' ' '{ print $1 }'`

   for dylib in $dylibs; do
     basename=`basename "$dylib"`

     if [ ! -f "$out/lib/$basename" ]; then
        echo "error: The dylib file '$out/lib/$basename' does not exist in the output folder; referenced from $f"
     fi

     # https://www.mikeash.com/pyblog/friday-qa-2009-11-06-linking-and-install-names.html
     install_name_tool -change "$dylib" "@loader_path/$basename" "$f"
   done;

   # otool -L "$f"
done

echo "---- available dylib files:"
ls -l "$out/lib/"*.dylib
echo "---- available dylib files"

# Build the lighthouse library
cd $path
gcc -shared -o libgdiplus-lighthouse.dylib -fPIC -ldl lighthouse.c -m64
