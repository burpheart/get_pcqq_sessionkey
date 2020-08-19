--BY BURPHEART
sessionkey = ""
function debugger_onBreakpoint()
	table=readBytes(readPointer(ESP+0x0C),16,true)
	for key, value in ipairs(table) do
	if (value<16)
		then
		sessionkey = sessionkey .. string.format("0%x",value) .." "
		else
		sessionkey = sessionkey .. string.format("%x",value) .." "
		end
	end
	debug_removeBreakpoint(getSymbolInfo("Common.oi_symmetry_encrypt2")["address"])
	debug_continueFromBreakpoint(co_run)
	print("如果解密失败多取几次 有一定几率取到的不是sessionkey")
	print("sessionkey: " .. sessionkey)
	return 1
end
debug_setBreakpoint(getSymbolInfo("Common.oi_symmetry_encrypt2")["address"])
