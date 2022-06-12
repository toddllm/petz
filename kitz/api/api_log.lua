function kitz.logon_mob(self)
	table.insert(kitz.active_mobs, self.object)
end

function kitz.logout_mob(self)
	kitz.active_mobs[self.object] = nil
end
