from enum import Enum
from pathlib import Path
from typing import TextIO, Optional
from typer import run, Option
from sys import stdin, stdout
import yaml
import json
import toml

class FormatError(Exception):
    pass

class Format(str, Enum):
    yaml = "yaml"
    json = "json"
    toml = "toml"

    def loader(self):
        if self == Format.yaml:
            return lambda x: yaml.load(x,Loader=yaml.CLoader)
        elif self == Format.json:
            return json.load
        elif self == Format.toml:
            return toml.load
        else:
            raise FormatError("Unknown format", self)

    def dumper(self):
        if self == Format.yaml:
            return yaml.dump
        elif self == Format.json:
            return json.dump
        elif self == Format.toml:
            return toml.dump
        else:
            raise FormatError("Unknown format", self)


def convert(i: TextIO, o: TextIO, loader, dumper):
    obj = loader(i)
    dumper(obj, o)

def main(
    in_format: Format = Option(..., "--from", help="Input format"),
    out_format: Format = Option(..., "--to", help="Output format"),
    i: Optional[Path] = Option(None, "--in", help="Input file. Defaults to STDIN"),
    o: Optional[Path] = Option(None, "--out", help="Output file. Defaults to STDOUT")
):
    io_in  = open(i, "rt") if i else stdin
    io_out = open(o, "wt") if o else stdout

    convert(
        io_in, 
        io_out, 
        in_format.loader(), 
        out_format.dumper()
    )

    if i:
        io_in.close()
    
    if o: 
        io_out.close()

if __name__ == '__main__':
    run(main)