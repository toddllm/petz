# Petz Modpack Changelog

## Version 2.0.0 (September 2025) - Luanti 5.14 Compatibility

### 🚀 Major Update: Luanti 5.14 Support

#### ✅ **API Modernization**
- **Fixed bone animation API**: Updated `set_bone_position` → `set_bone_override` 
- **Modern API compatibility**: All deprecated warnings resolved
- **Luanti 5.14 support**: Fully tested and working

#### 🔧 **Technical Improvements**
- Updated `petz/brains/bh_head.lua` to use new bone override API
- Fixed head movement and rotation animations
- Proper parameter formatting for new API structure
- No more "Deprecated call" warnings

#### 📦 **ContentDB Ready**
- Added proper `mod.conf` metadata for all mods
- Specified `min_minetest_version = 5.4`
- Added `supported_games = minetest_game`
- Proper author, license, and version information
- ContentDB publication ready

#### 🐛 **Bug Fixes**
- Resolved dependency loading issues with Luanti 5.14
- Fixed bone positioning for mob head animations
- Eliminated API deprecation warnings

#### 📋 **Modpack Contents**

**Kitz v2.0.0**: High-level mob engine API
- Core mob behavior system
- Animation engine
- AI behavior trees

**Petz v2.0.0**: Cute mobs implementation  
- Multiple animal types (cats, dogs, farm animals, etc.)
- Advanced AI behaviors using Kitz engine
- Interactive taming and feeding systems

**Bale v2.0.0**: Companion mod for farming integration

#### 🎯 **Tested Environments**
- ✅ **Luanti 5.14.0-dev** - Fully working
- ✅ **minetest_game** - Complete compatibility  
- ✅ **Docker deployment** - Tested in containerized environment
- ✅ **Multiplayer server** - Verified with multiple players

#### ⚙️ **Installation Notes**
- Requires Luanti 5.4+ (tested with 5.14.0-dev)
- Dependencies: default, stairs, dye, farming, vessels, wool, tnt, player_api, fire
- Optional: bonemeal, 3d_armor, crops, playerphysics, player_monoids

#### 🔄 **Migration from v1.x**
- Existing worlds compatible
- No data loss during upgrade
- Automatic API conversion on load
- Backup recommended before upgrade

---

### Previous Versions

#### Version 1.x
- Legacy Minetest compatibility
- Original mobkit-based implementation
- Deprecated API usage

---

**Author**: toddllm  
**License**: GPLv3  
**Repository**: https://github.com/toddllm/petz  
**ContentDB**: Coming soon!