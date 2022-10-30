local S = ...

function petz.register(_name, def)

	local name = "petz:".._name
	local mesh = def.mesh or 'petz_'.._name..'.b3d'
	local visual_size = {
		x = petz.settings.visual_size.x * def.scale_model,
		y = petz.settings.visual_size.y * def.scale_model
	}
	local visual_size_baby
	if def.visual_size_baby then
		visual_size_baby = {
			x = visual_size.x * def.scale_baby,
			y = visual_size.y * def.scale_baby
		}
	end
	local skin_colors = def.skin_colors
	local textures = {}
	for n = 1, #skin_colors do
		textures[n] = "petz_".._name.."_"..skin_colors[n]..".png"
	end
	local collisionbox, collisionbox_baby
	if def.collisionbox then
		collisionbox, collisionbox_baby = petz.get_collisionbox(def.collisionbox.p1,
			def.collisionbox.p2, def.scale_model, def.scale_baby)
	end
	local replace_rate
	local replace_offset
	local replace_what
	if def.replace then
		replace_rate = def.replace.replace_rate
		replace_offset = def.replace.replace_offset
		replace_what = def.replace.replace_what
	end

	petz:register_egg(name, S(def.description), "petz_spawnegg_".._name..".png", true)

	minetest.register_entity(name, {

		--set petz specific properties
		animation =	def.animation or nil,
		attack = def.attack or nil,
		breed = def.breed or false,
		buoyancy = def.buoyancy or 0.5, -- portion of hitbox submerged
		can_be_brushed = def.can_be_brushed or false,
		can_fly = def.can_fly or false,
		can_alight = def.can_alight or false, --birds can stand and walk on ground
		can_perch = def.can_perch or false,
		capture_item = def.capture_item or nil,
		drops = def.drops,
		fly_rate = def.fly_rate or 60,
		follow = def.capture_item,
		give_orders = def.give_orders or false,
		has_affinity = def.has_affinity or false,
		head = def.head or nil,
		init_tamagochi_timer = def.init_tamagochi_timer or false,
		is_pet = def.is_pet or true,
		is_wild = def.is_wild or false,
		jump_height = def.jump_height or 1,
		max_height = def.max_height or 10,
		max_hp = def.max_hp or 10,
		max_speed = def.max_speed or 1,
		milkable = def.milkable or false,
		logic = def.logic,
		lung_capacity = def.lung_capacity or 10, -- seconds
		poop = def.poop or false,
		replace_rate = replace_rate or nil,
		replace_offset = replace_offset or nil,
		replace_what = replace_what or nil,
		rotate = petz.settings.rotate,
		skin_colors = skin_colors or nil,
		sounds = def.sounds or nil,
		springiness = def.springiness or 0,
		type = _name,
		view_range = def.view_range or 10,

		--set entity properties
		collide_with_objects = def.collide_with_objects or true,
		collisionbox = collisionbox,
		collisionbox_baby = collisionbox_baby,
		makes_footstep_sound = def.makes_footstep_sound or false,
		mesh = mesh,
		physical = def.physical or true,
		stepheight = def.stepheight or 0.1, --EVIL!
		textures = textures,
		visual = petz.settings.visual,
		visual_size = visual_size,
		visual_size_baby = visual_size_baby,
		static_save = def.static_save or true,

		--Functions
		get_staticdata = kitz.statfunc,

		on_activate = function(self, staticdata, dtime_s) --on_activate, required
			kitz.actfunc(self, staticdata, dtime_s)
			petz.set_initial_properties(self, staticdata, dtime_s)
		end,

		on_deactivate = function(self)
			petz.on_deactivate(self)
		end,

		on_punch = function(self, puncher, time_from_last_punch, tool_capabilities, dir)
			petz.on_punch(self, puncher, time_from_last_punch, tool_capabilities, dir)
		end,

		on_rightclick = function(self, clicker)
			petz.on_rightclick(self, clicker)
		end,

		on_step = function(self, dtime)
			kitz.stepfunc(self, dtime) -- required
			petz.on_step(self, dtime)
		end,
	})

end
