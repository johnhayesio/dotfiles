# NPM Packages

This is all of the NPM packages I have installed globally and use on a regular basis. A quick google
search for each package name will return results for each package's specific setup.

## Node Installation

In order to install/update all packages, node must be installed. To install node, visit the node site [Node
Download](https://nodejs.org/en/download/) and select the correct installation package for your
operating system.

## Install Node using Homebrew

(MacOSX Only) Run the following command within a terminal window.
```
/usr/bin/ruby -e "$(curl -fsSL
https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
## Installing NPM Packages

Updating and installing packages is dependent on package.json and npm-check-updates. After
installing node, copy package.json to a folder on your pc/mac. CD into the directory where you
downloaded package.json on your pc/mac. Run the following command.
```
npm i -g npm-check-updates
```

After installing this package, run the following command to update package.json with the latest
version of all packages.
```
ncu -u
```

Last, run the following command to install the latest version of all packages.
```
npm install
```

## Note
These are packages that I use and may not be useful to you. If you wish to remove any specific
packages before installation, open package.json in your text editor and remove the line containing
the package name.
```
"hn-cli": "*",
```

# Included Dependencies
hn-cli: [Hacker News](https://github.com/rafaelrinaldi/hn-cli)
alfred-bitly: [Bitly for Alfred](https://www.npmjs.com/package/alfred-bitly)
bitly-client: [Bitly for Terminal](https://www.npmjs.com/package/bitly-client)
caniuse-cmd: [Browser Compatibility](https://github.com/sgentle/caniuse-cmd)
fast-cli: [Speed Test](https://github.com/sindresorhus/fast-cli)
how2: [Stackoverflow for Terminal](https://www.npmjs.com/package/how-2)
idea :[Simple Idea Tracker](https://github.com/IonicaBizau/idea)
imageoptim-cli: [Image Minification](https://github.com/JamieMason/ImageOptim-CLI)
imgur-uploader-cli: [Imgur Uploader](https://github.com/arnellebalane/imgur-upload-cli)
is-up-cli [Is A Site Up](https://github.com/sindresorhus/is-up-cli)
live-server [Terminal Live Server](https://www.npmjs.com/package/live-server)
markdown-to-medium [.md to Medium.com](https://www.npmjs.com/package/markdown-to-medium)
npm-check-updates [Check NPM Package Updates](https://www.npmjs.com/package/npm-check-updates)
phunt: [Product Hunt](https://www.npmjs.com/package/phunt)
prettier [Beautify Code](https://prettier.io/docs/en/cli.html)
set-default-browser: [OSX Default Browser](https://www.npmjs.com/package/set-default-browser)
surge: [Quick Site Deployment](https://github.com/sintaxi/surge)
degit: [Svelte.js Starter Kit](https://www.npmjs.com/package/degit)
create-react-app: [React Starter Kit](https://www.npmjs.com/package/create-react-app)
purgecss: [Remove unused CSS selectors](https://www.npmjs.com/package/purgecss)
heroku: [Heroku CLI](https://www.npmjs.com/package/heroku)
netlify-cli: [Netlify CLI](https://www.npmjs.com/package/netlify-cli)
mongodb: [MongoDB](https://www.npmjs.com/package/mongodb)
pianobar: [Pandora CLI](https://github.com/PromyLOPh/pianobar)
mas: [Mac Appstore CLI](https://github.com/mas-cli/mas)
toggl-cli: [Toggl Time Management](https://www.npmjs.com/package/@dirdmaster/toggl-cli)

### Thanks and good luck! :)
