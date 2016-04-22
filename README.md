## What the heck is it?

The deis global-config plugin lets you store config values in [Vault](https://www.vaultproject.io/) that can be used in your Deis apps.

## Why the heck do we need that?

Deis allows you to configure individual apps using using `deis config:set KEY=VAL` to manipulate a containers environment variables. However, this can get tedious when you have two or more apps where the same config values need to be set i.e. multiple apps sharing a mongo database to store state. The global-config plugin enables you to set those values once and use them in multiple apps

## How does it work?

For a quick walkthrough showing how to create a new deis app and get it working with global-config, check [this](https://youtu.be/pgl29eAZHWs) out.

### Requirements

We assume that you have Vault running somewhere with github authentication enabled. By default, we look for a deis app in your cluster named "vault" and discover the url automatically. However, you can also set a custom vault address via a command-line argument.

### Installation

```shell
cd /usr/local/bin \
  && curl -sSL -O http://rafflecopter.github.io/deis-global-config-plugin/releases/v0.1.2/deis-global-config \
  && chmod +x deis-global-config \
  && cd -
```

To use `deis global-config`, put the deis-global-config script on your path somewhere. Each deis app will need to source global-sorcerer as part of it's Dockerfile CMD. See https://github.com/Rafflecopter/deis-global-config-plugin/blob/master/test/Dockerfile.

### Usage
`deis global-config -h`

### Contributing

When you're ready to release a new version, `./release.sh vX.Y.Z` will create a new release in the gh-pages branch, but it'll be up to you to push it to github.
