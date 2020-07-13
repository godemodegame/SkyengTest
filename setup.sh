#!/bin/bash

echo Script was run...
# -- 1 -- Installing HomeBrew
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo HomeBrew:
echo HomeBrew checking running...

which -s brew
if [[ $? != 0 ]] ; then
  echo brew installing
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo brew installed
else
  echo brew updating
  brew update
  echo brew updated
fi

# -- 2 -- Installing swiftLint
brew install swiftLint
if [[ $? != 0 ]] ; then
  brew upgrade swiftlint
  echo SwiftLiint updated
fi

echo Script was ended
echo "Questions? Ask tg.me/godemodegame"

open ./SkyengTest.xcodeproj
