# webbuild
Docker image for building node

linux version: ubuntu 20.04
node version: 10.19.0
npm version: 6.14.4
yarn version: 1.22.5

example usages:
```
.PHONY: scss
scss:
	@(echo "/* This file is autogenerated via 'make scss'. DO NOT EDIT */" > assets/css/web.css)
	@(docker run --rm -v ${PWD}:/src -it xackery/webbuild:10.19.0 bash -c 'sass scss/style.scss >> assets/css/web.css')
.PHONY: npm-install
npm-install:
	@(docker run --rm -v ${PWD}:/src -it xackery/webbuild:10.19.0 bash -c 'npm install')
```

