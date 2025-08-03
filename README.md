# Petz [petz] - Luanti Voyager Fork

This fork is maintained as part of the [Luanti Voyager](https://github.com/toddllm/luanti-voyager) project.

**Fork Location**: `/home/tdeshane/luanti/petz-fork`

This fork was originally created from [yl-whosit/petz](https://github.com/yl-whosit/petz) and is now maintained to ensure compatibility with Luanti Voyager servers.

## Petz [petz]

Cute kawaii mobs for Minetest.

## Licenses

- Code: GPL v3.0
- Textures: CC BY-SA 4.0
- Sounds: They have different licenses, see the 'sounds/LICENSE.MD' file.

## The original RAW Blender Models

There are in a separate github repository:

[Petz RAW](https://github.com/runsy/petz_raw)

## Usage Guide

### Spawn Eggs

Spawn eggs are available for most pets using the format `petz:<petname>_set`. Examples:
- `/giveme petz:foxy_set` - Spawns a tamed fox
- `/giveme petz:kitty_set` - Spawns a tamed kitten
- `/giveme petz:puppy_set` - Spawns a tamed puppy
- `/giveme petz:ducky_set` - Spawns a duck
- `/giveme petz:lamb_set` - Spawns a lamb

### Taming Animals

Different animals require different items for taming:

#### Carnivores (Fox, Lion, Wolf, etc.)
- **Required items**: Raw meat from the `group:food_meat_raw`
- **Available meats**:
  - `petz:raw_chicken`
  - `petz:raw_porkchop`
  - `petz:beef`
- **How to tame**: Right-click the animal with raw meat in hand

#### Herbivores
- **Lambs**: Use wheat (`farming:wheat`)
- **Pandas**: Use papyrus (`default:papyrus`)
- **Parrots**: Use wheat seeds (`farming:seed_wheat`)

### Capturing/Picking Up Pets

To capture and carry pets:
- **Foxes, Dogs, Cats**: Use a lasso (`petz:lasso`)
- **Small animals (Birds, etc.)**: Use a net (`petz:net`, `mobs:net`, or `fireflies:bug_net`)
- **How to capture**: Right-click the tamed pet with the appropriate capture item
- The pet will be converted to an item in your inventory that you can place elsewhere

### Important Notes

1. **Right-clicking** only works when holding the correct taming item
2. Animals will follow players holding their favorite food
3. Some animals like lions require multiple attempts or a whip to tame
4. Check `/var/games/minetest-server/.minetest/mods/petz/petz.conf` for all animal preferences
5. You cannot capture animals with saddlebags equipped
6. You need room in your inventory to capture a pet

### Server Installation

The mod is installed at: `/var/games/minetest-server/.minetest/mods/`
- `petz/` - Main pet mod
- `kitz/` - Required API
- `bale/` - Additional content
