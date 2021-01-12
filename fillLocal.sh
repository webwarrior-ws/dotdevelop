#!/usr/bin/env bash
localDir=.localcache
rm -R $localDir
mkdir $localDir
cd $localDir

feedDir=local-feed
feedKey=local
packageDir=packages
config=NuGetExternalFeed.config
CWD="$(pwd)"
feedDirFull=$CWD/$feedDir
rm -R $feedDir
mkdir $feedDir
rm -R $packageDir
mkdir $packageDir

cp ../$config $config
#nuget sources Remove -Name $feedKey -ConfigFile $config
nuget sources Add -Name $feedKey -Source "$feedDirFull" -ConfigFile $config

wget https://github.com/dotdevelop/libgit2sharp/releases/download/dotdevelop.0.27.0-preview-g5335a181ca/LibGit2Sharp.0.27.0-preview-g5335a181ca.nupkg
nuget add LibGit2Sharp.0.27.0-preview-g5335a181ca.nupkg -Source "$feedDirFull" -NonInteractive
nuget install libgit2sharp -ConfigFile $config -NonInteractive -Prerelease -OutputDirectory $packageDir

cd ..