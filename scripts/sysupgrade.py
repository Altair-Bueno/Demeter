#!/usr/bin/env python3 -sS -OO
from __future__ import annotations

from asyncio import gather, run
from asyncio.subprocess import PIPE, Process, create_subprocess_exec
from itertools import chain
from os import environ
from shlex import split
from string import Template


class UpdaterError(Exception):
    process: Process
    program: list[str]

    def __init__(self, process: Process, program: list[str], *args: object) -> None:
        super().__init__(*args)
        self.process = process
        self.program = program


class Updater:
    env: dict[str, str]

    def __init__(self, env: dict[str, str] = {}) -> None:
        self.env = env

    async def update(self):
        ...

    async def exec(
        self, *cmd: list[str], raise_on_error=True, extra_env: dict[str, str] = {}
    ) -> Process:
        env = self.env | extra_env
        program, *args = [
            Template(s).substitute(env) for s in chain.from_iterable(map(split, cmd))
        ]
        process = await create_subprocess_exec(
            program, *args, stdin=None, stdout=PIPE, stderr=PIPE, shell=False
        )
        status_code = await process.wait()

        if raise_on_error and status_code != 0:
            raise UpdaterError(process, list(program, *args))

        return process


class SimpleUpdater(Updater):
    def steps(self):
        ...

    async def update(self):
        for step in self.steps():
            if isinstance(step, tuple):
                cmd, options = step
            else:
                cmd, options = step, {}
            await self.exec(cmd, **options)


class ConfigUpdater(SimpleUpdater):
    def steps(self) -> list[str]:
        yield "git -C $DEMETER pull"


class PnpmUpdater(SimpleUpdater):
    def steps(self) -> list[str]:
        yield "pnpm up -g"


class RustUpdater(SimpleUpdater):
    def steps(self) -> list[str]:
        yield "rustup self update", {"raise_on_error": False}
        yield "rustup update stable"
        yield "cargo install-update -a"


class ZshUpdater(SimpleUpdater):
    def steps(self) -> list[str]:
        yield "sheldon --color=always lock --update"


class HomebrewUpdater(SimpleUpdater):
    def steps(self) -> list[str]:
        yield "brew update"
        yield "brew upgrade"
        yield "brew list --cask | xargs brew upgrade --cask"
        yield "brew autoremove"
        yield "brew cleanup"


class EchoUpdater(SimpleUpdater):
    def steps(self) -> list[str]:
        yield "printf 10"


class PythonUpdater(SimpleUpdater):
    ...


async def main():
    env = environ
    options: dict[str, Updater] = {
        "config": ConfigUpdater(env),
        "pnpm": PnpmUpdater(env),
        "zsh": ZshUpdater(env),
    }
    updates = [
        EchoUpdater(env).update(),
        # PnpmUpdater(env).update(),
    ]

    for result in await gather(*updates, return_exceptions=True):
        if not isinstance(result, UpdaterError):
            break

        print(f"{''.join(result.program):#^30}")


if __name__ == "__main__":
    run(main())
