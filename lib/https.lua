-- Update the cryptposting member count using https
Cryptposting = Cryptposting or {}
local member_fallback = 65 -- Fallback member count in case the request fails or is not available
local succ, https = pcall(require, "SMODS.https")
Cryptposting.member_count = member_fallback

if not succ then
    sendErrorMessage("HTTP module could not be loaded. " .. tostring(https), "Cryptposting")
end

local function apply_discord_member_count(code, body, headers)
    if body then
        local v = string.match(body, '"approximate_member_count"%s*:%s*(%d+)')
        Cryptposting.member_count = v or Cryptposting.member_count
    end
end

function Cryptposting.update_member_count()
    if https and https.asyncRequest then
        https.asyncRequest(
            "https://discord.com/api/v10/invites/Jk9Q9usrNy?with_counts=true", -- this is all you guys; thisispeam :bulgoe:
            apply_discord_member_count
        )
    end
end

-- make the request once on startup
Cryptposting.update_member_count()