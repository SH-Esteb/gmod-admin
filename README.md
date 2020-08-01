# Gmod-Admin

Simply an administration panel for Garry's Mod.
I did this at 4 a.m. and finished at 5:12 a.m. so don't judge too much, I still made some security

## Installation

You just have to put in your addons folder of your server

```bash
steamapps\common\GarrysModDS\garrysmod\addons
```

## Usage

You just have to do the configuration

```python
local config = {}

config.ServerName = "XLean - Développement"

config.Command = "/admin"

config.Warn = "/warn"

config.Staff = {
    ["superadmin"] = true,
    ["admin"] = true,
    ["modérateur"] = true,
}

xadmin_config = config
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)

## Image

![GitHub Logo](https://mtxserv.com/forums/attachments/1596252241775-png.49172/)
