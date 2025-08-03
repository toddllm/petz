# Petz [petz] - Luanti Voyager Fork

This fork is maintained as part of the [Luanti Voyager](https://github.com/toddllm/luanti-voyager) project.

**Fork Location**: `/home/tdeshane/luanti/petz-fork`

This fork was originally created by whosit and is now maintained to ensure compatibility with Luanti Voyager servers.

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

### Important Notes

1. **Right-clicking** only works when holding the correct taming item
2. Animals will follow players holding their favorite food
3. Some animals like lions require multiple attempts or a whip to tame
4. Check `/var/games/minetest-server/.minetest/mods/petz/petz.conf` for all animal preferences

### Server Installation

The mod is installed at: `/var/games/minetest-server/.minetest/mods/`
- `petz/` - Main pet mod
- `kitz/` - Required API
- `bale/` - Additional content
