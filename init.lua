local function sync_to_real_time()
	minetest.log("action", "Syncing time to hardware clock")
    local t = os.date("*t")

    print(dump(t))

    local seconds_today =
        t.hour * 3600 +
        t.min  * 60 +
        t.sec

    local fraction = seconds_today / 86400
    minetest.set_timeofday(fraction)
end

-- Sync when a player joins
-- This makes it so that there are regular syncs of time when needed
minetest.register_on_joinplayer(function()
    sync_to_real_time()
end)
