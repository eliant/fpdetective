fpdetective
===========
STILL UNDER CONSTRUCTION!

A framework for conducting large scale web privacy studies.

## Installation

```
git clone https://github.com/fpdetective/fpdetective.git
cd fpdetective
```
After that point, you've two options: 

1. Run `./setup.sh` to use FPDetective on your computer
2. Follow [instructions for setting up VM](https://github.com/fpdetective/fpdetective/blob/master/vm/README.md)
to run FPDetective in a virtual machine

Please note that setup.sh will download browsers and other binaries used by FPDetective. 
This may take while depending on your connection.

## Get Started
* Check [documentation](https://github.com/fpdetective/fpdetective/wiki)
* Visit [FPDetective website](https://www.cosic.esat.kuleuven.be/fpdetective/).
* Instructions for [using FPDetective with a VM](https://github.com/fpdetective/fpdetective/wiki/Instructions-for-setting-up-VM)
* Check out recent binary [releases](https://github.com/fpdetective/phantomjs/releases).
* Consult [PhantomJS wiki](https://github.com/ariya/phantomjs/wiki) to learn more about PhantomJS

### FPDetective on VM
You can follow these instructions to set up a VM and use FPDetective independently of the configuration of your operating system:

* [Instructions for setting up VM](https://github.com/fpdetective/fpdetective/wiki/Instructions-for-setting-up-VM)

### Patches for Chromium & PhantomJS browser
You can use following patches to build modified Chromium and PhantomJS browsers from source. Please consult the [instructions](https://github.com/fpdetective/fpdetective/blob/master/patches/README.md) for further explanation.
 
* Chromium: [patch](https://github.com/fpdetective/fpdetective/blob/master/patches/chromium.patch)
* PhantomJS: [patch](https://github.com/fpdetective/fpdetective/blob/master/patches/phantomjs.patch)
