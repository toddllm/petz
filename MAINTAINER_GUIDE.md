# Petz Modpack - Maintainer Guide

## 🔧 Development & Release Process

This guide covers the complete process for maintaining, updating, and releasing the Petz modpack for Luanti.

## 📁 Repository Structure

```
petz/
├── petz/              # Main animals mod
│   ├── mod.conf       # Mod configuration
│   ├── init.lua       # Main initialization
│   ├── api/           # Petz API functions
│   ├── brains/        # AI behavior systems
│   ├── petz/          # Individual animal definitions
│   └── misc/          # Utilities and integrations
├── kitz/              # Mob engine API
│   ├── mod.conf       # Engine configuration
│   ├── init.lua       # Engine initialization
│   ├── engine.lua     # Core mob engine
│   └── api/           # Low-level mob APIs
├── bale/              # Farming integration
│   ├── mod.conf       # Farming mod config
│   └── init.lua       # Farming items/nodes
├── .cdb.json          # ContentDB metadata
├── .gitattributes     # Release file exclusions
├── modpack.txt        # Modpack identifier
├── README.md          # User documentation
└── LICENSE.md         # GPL-3.0 license
```

## 🛠️ Development Workflow

### 1. Making Changes

```bash
# Clone the repository
git clone https://github.com/toddllm/petz.git
cd petz

# Create feature branch
git checkout -b feature/new-animal

# Make your changes...
# Test thoroughly on Luanti 5.14+

# Commit changes
git add .
git commit -m "Add new animal: descriptive commit message"

# Push feature branch
git push origin feature/new-animal

# Create pull request on GitHub
```

### 2. API Compatibility Guidelines

When updating for new Luanti versions, check these common compatibility issues:

#### **Deprecated API Calls to Fix:**
```lua
# OLD (deprecated) → NEW (modern)
object:set_bone_position() → object:set_bone_override()
object:getpos() → object:get_pos()
minetest.env → minetest (direct access)
physical = true → initial_properties = {physical = true}
```

#### **Common Nil Value Fixes:**
```lua
# Always check for nil before accessing
local item_def = minetest.registered_items[item_name]
if item_def and item_def.inventory_image then
    texture = item_def.inventory_image
else
    texture = "fallback_texture.png"
end
```

### 3. Testing Process

```bash
# Test on development server
docker run -it --name petz-test \
  -v $(pwd):/usr/local/share/luanti/mods/petz \
  luanti-server:latest --gameid minetest_game

# Check for errors
docker logs petz-test | grep -E "(ERROR|WARNING|petz|kitz)"

# Test with players
# 1. Create animals
# 2. Test taming/feeding
# 3. Verify head animations work
# 4. Check breeding systems
```

## 🚀 Release Process

### 1. Version Planning

Use semantic versioning: `MAJOR.MINOR.PATCH`
- **MAJOR**: Breaking changes, major Luanti version updates
- **MINOR**: New animals, features, significant improvements  
- **PATCH**: Bug fixes, minor compatibility updates

### 2. Pre-Release Checklist

```bash
# Update version numbers in mod.conf files
# kitz/mod.conf:
version = 2.0.x

# petz/mod.conf:  
version = 2.0.x

# bale/mod.conf:
version = 2.0.x

# Test thoroughly
# Update CHANGELOG.md if present
# Verify .cdb.json metadata is current
```

### 3. Creating a Release

```bash
# Ensure all changes are committed
git status
git add .
git commit -m "Prepare release v2.0.x"

# Create and push release tag
git tag -a v2.0.x -m "Petz v2.0.x - Brief release description

✅ Changes in this release:
- List major changes
- Bug fixes applied  
- New features added
- Compatibility updates

📋 Testing:
- Tested on Luanti 5.14+
- Multiplayer server verified
- No critical errors found"

# Push to repository
git push origin master
git push origin v2.0.x
```

### 4. ContentDB Automatic Release

ContentDB will automatically:
- ✅ Detect the new git tag
- ✅ Create a new release using tag message
- ✅ Make it available for download
- ✅ Notify users of the update

## 🌐 ContentDB Management

### Initial Submission Process

1. **Prepare Repository**
   - Ensure clean modpack structure (only mod directories)
   - Complete `.cdb.json` configuration  
   - Create initial release tag

2. **Submit to ContentDB**
   - Visit https://content.luanti.org/
   - Sign in with GitHub account
   - Click "Add Package" → "Modpack"
   - Enter repository: `https://github.com/toddllm/petz`
   - Select "git tag" for release method
   - Choose latest tag (e.g., `v2.0.2`)

3. **ContentDB Settings**
   - **Release Method**: "git tag" (recommended)
   - **Auto-update**: Enabled
   - **Webhook**: Optional for instant updates

### Managing Updates

```bash
# For bug fixes (patch release)
git tag -a v2.0.3 -m "Bug fix release"
git push origin v2.0.3
# → ContentDB auto-creates v2.0.3 release

# For new features (minor release)  
git tag -a v2.1.0 -m "New animals and features"
git push origin v2.1.0
# → ContentDB auto-creates v2.1.0 release
```

## 🔍 Common Issues & Solutions

### ContentDB Validation Errors

**"Expecting mod or modpack, found unknown"**
- **Cause**: Non-mod directories in repository
- **Fix**: Remove or exclude via `.gitattributes`

**"Aliased field does not match"**  
- **Cause**: Conflicting fields in `.cdb.json`
- **Fix**: Use only one description field

**"Missing mod.conf"**
- **Cause**: Incomplete mod configuration
- **Fix**: Ensure all mods have proper `mod.conf` files

### Server Compatibility Issues

**"Deprecated call to set_bone_position"**
- **Fix**: Update to `set_bone_override` with proper parameter format
- **Example**: See `petz/brains/bh_head.lua` for reference

**"attempt to index a nil value"**
- **Fix**: Add nil checks before accessing table fields
- **Example**: See `petz/api/api_on_step.lua` for reference

## 📊 Monitoring

### Health Checks
- Monitor ContentDB download statistics
- Check GitHub Issues for bug reports  
- Review ContentDB reviews and ratings
- Test with new Luanti releases

### Community Feedback
- Respond to GitHub Issues promptly
- Engage with ContentDB reviews
- Consider feature requests from users
- Maintain compatibility with popular mods

## 📝 Documentation Updates

When making significant changes:

1. **Update README.md**: User-facing documentation
2. **Update mod.conf descriptions**: Keep current with features
3. **Version .cdb.json**: Update metadata for ContentDB
4. **Create release notes**: Document changes for users

## 🏷️ Current Release Tags

- **v2.0.2**: Luanti 5.14 compatibility, ContentDB ready
- **v2.0.1**: API modernization and crash fixes  
- **v2.0.0**: Initial modern Luanti support

## 🔗 Important Links

- **Repository**: https://github.com/toddllm/petz
- **ContentDB**: https://content.luanti.org/packages/toddllm/petz/
- **Issues**: https://github.com/toddllm/petz/issues
- **Luanti API Docs**: https://api.luanti.org/

## 👥 Contributors

- **toddllm**: Original author and maintainer
- **Claude**: Development assistance and API modernization

---

**Last Updated**: September 2025  
**Current Version**: v2.0.2  
**Luanti Compatibility**: 5.4+ (tested with 5.14.0-dev)