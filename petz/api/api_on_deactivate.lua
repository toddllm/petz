function petz.on_deactivate(self)
	if self.dreamcatcher then
		petz.dreamcatcher_save_metadata(self)
	end
end
