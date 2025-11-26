if [ -n "$1" ]; then
cd $1
fi

dart run build_runner clean
find . -name "*.g.dart" -type f -delete
dart run build_runner build
