# Nx completion plugin for Zsh

> This plugin bring Nx autocompletion to Zsh.

![demo](https://user-images.githubusercontent.com/8522558/111908149-67e8d780-8a58-11eb-9343-691f6d664163.gif)

## Features

- Commands and arguments autocompletion
- Projects, targets, and generators autocompletion
- Support different workspace versions

## Install

### Prerequisit

Install [`jq`](https://stedolan.github.io/jq/) dependency:

```shell
apt install jq
```

On MacOS you can install with: 

```shell
brew install jq
```

> **Note**: [`jq`](https://stedolan.github.io/jq/) is a lightweight command-line JSON processor used to manipulate the workspace graph.

### As an [Oh My ZSH!](https://github.com/robbyrussell/oh-my-zsh) custom plugin

Clone the repository into the custom plugins directory:

```shell
git clone git@github.com:charles-zablit/nx-completion.git ~/.oh-my-zsh/custom/plugins/nx-completion
```

Then load it as a plugin in your `.zshrc`:

```shell
plugins+=(nx-completion)
```

### Manually

Clone this repository somewhere (`~/.nx-completion` for example):

```shell
git clone git@github.com:charles-zablit/nx-completion.git ~/.nx-completion
```

Then source it in your `.zshrc`:

```shell
source ~/.nx-completion/nx-completion.plugin.zsh
```

## Caveats

If you are invoking `nx` through your package manager (i.e `pnpm nx` instead of `nx`), please add the following to your `.zshrc` file:

```bash
function nx() {
  pnpm nx "$@"
}
```

More information [here](https://github.com/jscutlery/nx-completion/issues/16#issuecomment-1402311411).

## License

This project is MIT licensed.
