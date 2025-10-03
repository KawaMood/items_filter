# **Items Filter**

**Set up easy and automatic sorting systems.**

No longer need for laggy and bulky redstone contraptions.
The Items Filter provides a better alternative to automatically sort your storage room!

> [!WARNING]  
> **This presentation concerns the latest available version of the data pack for Minecraft 1.21.4.**  
> To find the most recent version, check the [main](https://github.com/KawaMood/waystones) branch.  
> For other versions, check other [branches](https://github.com/KawaMood/waystones/branches/all).

# 🪄Introduction

## What is Items Filter?

Items Filters allow you to you to filter several types of items from a container placed **above** it to another container placed **below** it. You can choose what items the filter let pass by presetting them in an adjacent **reference** container.
Items Filters can also directly drop their sorted items if you there is a fluid block below them (air, water or lava).

If you used to use V.2, you may have noticed that the data pack changed its name. This is due to the fact it doesn't strictly rely on hoppers anymore: you can directly pass an item from a chest or a shulker box to another one if you want to.

## How to craft and use an Item Filter?

Items Filters can be crafted using:

- 6x **Cobbled Deeplsate**
- 1x **Hopper**
- 1x **Observer**
- 1x **Dropper**
  The recipe is the following:

![recipe](https://cdn.modrinth.com/data/cached_images/5d5585b60858ff43245b5dce1241686ee3e3f379.png)

When you place an items filter, the side facing your player will show a **tiny grey button**. This is the one you can right-click to toggle mode, that we will explain later.

The opposite face shows a **tiny observer icon**. This is where you need to place a **compatible containers** (_all containers having a direct_ `Items` _entry like chests, hoppers, barrels, shulker boxes, dropper, dispenser, etc._). This one need to contain all **reference items**, meaning the one you want to let pass through the relative filter. Other items that don't match those ones will remain in the container above, or continue their path to your system if it is an hopper connected to another.

In order to make it work, Items Filters then needs to have :

- A compatible container placed above them.
- A compatible container placed on their tiny observer icon, and containing items to filter.
- A compatible container placed below them to receive the filtered items, or a fluid block (air/lava/water) to directly drop them.

![scheme](https://cdn.modrinth.com/data/cached_images/17feaafb4a39efaceb195e168a57a944438eda13.png)

I recommend you to see the tutorial video for better explanations and examples.

# 🔖 Modes

Item Filters have two modes: the **Lax** mode that is the one by default, and the **Strict** mode. Modes are toggleable by right-clicking the little grey button on one of its face.

## Lax mode

The Lax mode is represented by the grey color of the button.
When an Items Filter is set on Lax mode, it will only take items' `id` into account to filter them, and ignore all their potential **NBT**. Meaning for example, in Lax mode, if you set an enchanted Diamond Sword in the reference container, all Diamond Swords, no matter their enchantments, their damage or any other tag will pass the filter, because they still share the same `id` (`minecraft:diamond_sword`).

## Strict mode

The Strict mode is represented by the yellow color of the button.
When an Items Filter is set on Strict mode, it will consider the `id` but also **all (non-ignored) tags (before MC 1.20.5) or components (after MC 1.20.5)** of items. In this case, to take back the example above, only Diamond Swords which share the exact same data (enchantments, damage, etc.) will pass the filter. It is useful if you want to items like Enchanted Books, custom Player Heads, or custom items from other data packs.

The Strict mode also has the ability of ignoring some tags or components if needed. See the **Settings** section below for explanations.

# ⚙️Settings

<details>
<summary>Ignored components for Strict Mode (for V.3.1.0 or more)</summary>

The Strict mode has the ability of ignoring some components during the filter's checks.
By default, no ignored components are set.
You can **add**, **remove** or get the **list** of currently ignored components using the following commands respectively:

```
/function pk_it_fi:settings/mode/strict/ignored_components/add {id:"<id>"}
/function pk_it_fi:settings/mode/strict/ignored_components/remove {id:""<id>"}
/function pk_it_fi:settings/mode/strict/ignored_components/list
```

Example - Ignoring the `"minecraft:repair_cost"` component:

```
/function pk_it_fi:settings/mode/strict/ignored_components/add {id:"minecraft:repair_cost"}
```

There is also a premade sample containing most common components we usually want to ignore: `"minecraft:custom_name"`, `"minecraft:lore"`, `"minecraft:enchantments"`, `"minecraft:damage"` and `"minecraft:repair_cost"`. You can activate it using the following command:

```
/function pk_it_fi:settings/mode/strict/ignored_components/add_default_sample
```

</details>
<details>
<summary>Ignored tags for Strict Mode (for V.3.0.1 or less)</summary>

The Strict mode has the ability of ignoring some tags during the filter's checks.
By default, no ignored tags are set.
You can **add**, **remove** or get the **list** of currently ignored tags using the following commands respectively:

```
/function pk_it_fi:settings/mode/strict/ignored_tags/add {property:"<property>"}
/function pk_it_fi:settings/mode/strict/ignored_tags/remove {property:""<property>"}
/function pk_it_fi:settings/mode/strict/ignored_tags/list
```

Example - Ignoring the `repairCost` tag:

```
/function pk_it_fi:settings/mode/strict/ignored_tags/add {property:"repairCost"}
```

There is also a premade sample containing most common tags we usually want to ignore: `display`, `Enchantments`, `Damage` and `repairCost`. You can activate it using the following command:

```
/function pk_it_fi:settings/mode/strict/ignored_tags/add_default_sample
```

</details>
<details>
<summary>Change the transfer cooldown of items filters</summary>
  
By default, items filters have a transfer cooldown of 4 ticks, making it transfer items twice faster than the default hoppers. It is recommended to keep it at this rate to make it adequatly transfer items from hoppers. However, if you want to adapt this value, you can **set** another value or **get** the current one using the following commands respectively:
```
/function pk_it_fi:settings/transfer_cooldown/get
/function pk_it_fi:settings/transfer_cooldown/set {value:<value>}
```
Example - Setting the transfer cooldown of items filters to 1 tick:
```
/function pk_it_fi:settings/transfer_cooldown/set {value:1}
```
Note that the transfer cooldown can't be set lower than 1 tick.
</details>
<details>
<summary>Allow double chests use as reference</summary>

You can make item filters search reference items from a double-chests.
By default, this feature is disabled, as it is not necessary needed and consume almost twice more performances per check.
You can **enable**, **disable** or \*_get_ the current state of this setting using the following commands respectively:

```
/function pk_it_fi:settings/reference/allow_double_chest/true
/function pk_it_fi:settings/reference/allow_double_chest/false
/function pk_it_fi:settings/reference/allow_double_chest/get
```

</details>

# 🧰 Other Commands

## Give yourself an items filter

If you are an operator of your server or if cheats are enabled in your single-player world, you can give yourself an items filter using these following command:

(after V.3.1.0):

```
/function pk_it_fi:cmd/give/items_filter
```

(before V.3.1.0):

```
/function pk_it_fi:items/items_filter/give
```

## Troubleshooting

### Recreate all items filters from the database

If ever items filters have been broken accidentally (using a `kill @e` command for example) you can run the following command to recreate all items filters from the database

```
/function pk_it_fi:cmd/debug/recreate_all_items_filters
```

The process will automatically remove all remaining entities and blocks of broken items filters before placing fresh ones. All data (id, owner, filterring mode...) will be preserved.
It may take some time for it to complete, so be sure to get the message telling the process ended successfully before interacting with or placing an items filter.

# 🔧 Update from V.2

You can transform all existring Hopper Sorters (from V.2) to Items Filters. In order to do so, **don't** uninstall V.2 upstream with the uninstalling process, as you should keep its database.
Just remove the V.2 data pack from the datapacks folder of your world, update your world to the newer version of Minecraft if desired and install Items Filters V.3 at the same time. Then use the following command to start the automatic updating process:

(after V.3.1.1):

```
/function pk_it_fi:cmd/database/update_from_v2
```

(before V.3.1.1):

```
/function pk_it_fi:base/update/from_v2/start
```

And wait for the updating process to end.

Note that this process won't unfortunately keep the **filterring mode** (**lax** or **strict**) of hopper sorters, as it wasn't previously stored in the database. However, they will keep all other data (their id, owner and location).

# 🧹 Uninstall

Items filters comes with an automatic uninstallation process. Running it will:

- Remove all items filters that have been placed in your world, in every dimensions
- Remove all scores and storage specific to the Items Filter data pack
- If there is no more KawaMood data packs installed, also remove all common scores and storages

The uninstalling process may take some seconds to complete. Be sure to wait for the message telling you that you can safely remove the data pack from your world's folder before doing it.

The command to start the uninstalling process is the following one:

```
/function pk_it_fi:base/uninstall/start
```

# ❓ F.A.Q

<details>
<summary>Do I need to install a resources pack?</summary>

No, this data pack doesn't require a resources pack. It uses display entities to render custom textures.

</details>

<details>
<summary>The texture of the block shows regular player heads, how can I fix that?</summary>

You need to be connected to the internet the first time you use a new type of waystone. The textures of the player heads that are used to create their looks are indeed loaded and cached on the client-side, from (old or current) players skins that are stored on a Mojang server.

If you accidentally used a content that required to be online the first time you use it, and now see regular players heads instead of the expected texture, you can still go in the ".minecraft/assets/skins/" folder, then sort the sub-folders by date, and delete some recent folders. Once that is done, if your game was already started, you will need to restart it to update the cached content.

⚠️ **Exceptional issue on 1.20.2**: Players heads can sometimes show default player skins (Steve & co.) rather than its actual texture although the whole cache folder are cleared. This is actually an [known issue](https://bugs.mojang.com/browse/MC-264966) from the game itself that struggle to load a texture depending on the signature's value. This issue has been fixed on 1.20.3.

</details>

# 🪠 Report an issue

If you encountered an issue with this data pack, preferably join the [Discord server](https://discord.com/invite/w8s9XWgN6v), and open a post in the dedicated **#data-pack-issues** channel to describe your problem. Please, don't forget to provide all necessary informations including:

- The Minecraft version you're using.
- The version of the concerned data pack you're using.
- If you're using any modified version like Forge, Paper or Spigot.
- If you do, the plugins or mods you're using that may alter the functioning of data packs.
- The list of other data packs you're using, if you have others.
- A clear description of your issue, and a way to reproduce it.
- If necessary, a video or a screenshot of the issue in game.

Before doing that, please read the F.A.Q. section just above. The issue you're facing may be a common one, and a way to fix it may already have been provided in it.

# 📌 Other links

Thank you for using Items Filter! It makes me happy to know people are enjoying it.
If you want to support its development and the development of other data packs, you can support me on my other social networks:

- [Youtube](https://www.youtube.com/@KawaMood/)
- [Planet Minecraft](https://www.planetminecraft.com/member/kawamood/)
- Or if you're in a generous mood, I accept donation on [paypal](https://paypal.me/KawaMood) or [buy me a kawa](https://www.buymeacoffee.com/kawamood) (slang term for "coffee")!
