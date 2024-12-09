# SKELETON - Module template

[English](README.md) | [Français](README_FR.md)

### Description

*Description of module*

### How to implement module?

###### Get project

Clone project within modules folder under then name `${MODULE_NAME}`.

###### Update server source code

From now on, I'll consider we're currently in root of your warcraft server project.\
Apply git patch by typing following command :\
`git apply --ignore-space-change --ignore-whitespace modules/${MODULE_NAME}/.patch`

Or modify directly `src/` with you favorite editor\
and apply modification seen in `modules/${MODULE_NAME}/.patch`.

1. Use the script `create_module.sh` located in [`modules/`](https://github.com/azerothcore/azerothcore-wotlk/tree/master/modules) to start quickly with all the files you need and your git repo configured correctly (heavily recommended).
1. You can then use these scripts to start your project: https://github.com/azerothcore/azerothcore-boilerplates
1. Do not hesitate to compare with some of our newer/bigger/famous modules.
1. Edit the `README.md` and other files (`include.sh` etc...) to fit your module. Note: the README is automatically created from `README_example.md` when you use the script `create_module.sh`.
1. Publish your module to our [catalogue](https://www.azerothcore.org/catalogue.html).

###### Modify Data Base

Apply request seen in sql files under `modules/${MODULE_NAME}/sql/` folder\
for each respective table (world => acore\_world / auth => acore\_auth / char => acore\_char)

Here one command I use often to implement directly multiple sql files:\ 
`for sql in $(find modules/${MODULE_NAME}/sql/*world*/ -type f -name '*.sql'); do mysql -uUSERDB -hHOSTDB -Dacore_world -p < ${sql}; done`

###### Add DBC files

Get DBC subfolders found in `modules/${MODULE_NAME}/data/`\
Put them in your data folder (as seen in worldserver.conf).

Add them also in the client directory under data folder.

###### Recompile and that all.

### Licensing

MIT license.

### Credits

* [Jackhein](https://github.com/Jackhein) (author of this module)
* [Miorey](https://github.com/Miorey/)

Our server [MurlocVillage](https://wotlk.murlocvillage.com/fr/)\
&nbsp;Thanks to [AzerothCore](http://azerothcore.org/)
