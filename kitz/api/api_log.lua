local _id = 0

function kitz.logon_mob(self)
	_id = _id + 1
	kitz.active_mobs[_id] = self
	self._id = _id
end

function kitz.logout_mob(self)
	kitz.active_mobs[self._id] = nil
end
