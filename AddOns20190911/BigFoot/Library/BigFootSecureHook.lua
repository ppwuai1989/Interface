 local BLSH_dbdf11f5b07258936fb1c5a31eaa969c = 1; local BLSH_1b5523f0adb45c4b8ee51f89ebf6f2b2 = 0; local BLSH_6dc50cf393baa8395c3f8b6cd575c5d9 = { _F = {}, }; function BLSH_6dc50cf393baa8395c3f8b6cd575c5d9:Hook(BLSH_89d99bb0d06dd535e6d6f6d9b3f04006, BLSH_c31af5fd9021206e921af3d99e5a90af, BLSH_9ed8bd8a19b94f73925daece17a05623) if (BLSH_9ed8bd8a19b94f73925daece17a05623) then assert(BLSH_89d99bb0d06dd535e6d6f6d9b3f04006 and type(BLSH_89d99bb0d06dd535e6d6f6d9b3f04006) == "table", "BSecureHook: Invalid ui object"); assert(BLSH_c31af5fd9021206e921af3d99e5a90af and type(BLSH_c31af5fd9021206e921af3d99e5a90af) == "string", "BSecureHook: Invalid function to hook"); assert(BLSH_9ed8bd8a19b94f73925daece17a05623 and type(BLSH_9ed8bd8a19b94f73925daece17a05623) == "function", "BSecureHook: Invalid hookfunc"); self._E[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006] = self._E[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006] or {}; self._E[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_c31af5fd9021206e921af3d99e5a90af] = true; if (BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006] and BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_c31af5fd9021206e921af3d99e5a90af] and BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_c31af5fd9021206e921af3d99e5a90af][BLSH_9ed8bd8a19b94f73925daece17a05623]) then else hooksecurefunc(BLSH_89d99bb0d06dd535e6d6f6d9b3f04006, BLSH_c31af5fd9021206e921af3d99e5a90af, function(...) if (self.enable and self._E[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_c31af5fd9021206e921af3d99e5a90af]) then BLSH_9ed8bd8a19b94f73925daece17a05623(...) end end); BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006] = BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006] or {}; BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_c31af5fd9021206e921af3d99e5a90af] = BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_c31af5fd9021206e921af3d99e5a90af] or {}; BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_c31af5fd9021206e921af3d99e5a90af][BLSH_9ed8bd8a19b94f73925daece17a05623] = true; end else BLSH_9ed8bd8a19b94f73925daece17a05623 = BLSH_c31af5fd9021206e921af3d99e5a90af; BLSH_c31af5fd9021206e921af3d99e5a90af = BLSH_89d99bb0d06dd535e6d6f6d9b3f04006; self._E[BLSH_c31af5fd9021206e921af3d99e5a90af] = true; assert(BLSH_c31af5fd9021206e921af3d99e5a90af and type(BLSH_c31af5fd9021206e921af3d99e5a90af) == "string", "BSecureHook: Invalid function to hook"); assert(BLSH_9ed8bd8a19b94f73925daece17a05623 and type(BLSH_9ed8bd8a19b94f73925daece17a05623) == "function", "BSecureHook: Invalid hookfunc"); if (BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_c31af5fd9021206e921af3d99e5a90af] and BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_c31af5fd9021206e921af3d99e5a90af][BLSH_9ed8bd8a19b94f73925daece17a05623]) then else hooksecurefunc(BLSH_c31af5fd9021206e921af3d99e5a90af, function(...) if (self.enable and self._E[BLSH_c31af5fd9021206e921af3d99e5a90af]) then BLSH_9ed8bd8a19b94f73925daece17a05623(...) end end); BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_c31af5fd9021206e921af3d99e5a90af] = BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_c31af5fd9021206e921af3d99e5a90af] or {}; BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_c31af5fd9021206e921af3d99e5a90af][BLSH_9ed8bd8a19b94f73925daece17a05623] = true; end end end function BLSH_6dc50cf393baa8395c3f8b6cd575c5d9:Unhook(BLSH_89d99bb0d06dd535e6d6f6d9b3f04006, BLSH_c31af5fd9021206e921af3d99e5a90af) if (BLSH_c31af5fd9021206e921af3d99e5a90af) then if (self._E[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006] and self._E[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_c31af5fd9021206e921af3d99e5a90af]) then self._E[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_c31af5fd9021206e921af3d99e5a90af] = false; end else BLSH_c31af5fd9021206e921af3d99e5a90af = BLSH_89d99bb0d06dd535e6d6f6d9b3f04006; if (self._E[BLSH_c31af5fd9021206e921af3d99e5a90af]) then self._E[BLSH_c31af5fd9021206e921af3d99e5a90af] = false; end end end function BLSH_6dc50cf393baa8395c3f8b6cd575c5d9:HookScript(BLSH_89d99bb0d06dd535e6d6f6d9b3f04006, BLSH_57ad665d0e8800ab56a0e07f8ae9c063, BLSH_9ed8bd8a19b94f73925daece17a05623) assert(BLSH_89d99bb0d06dd535e6d6f6d9b3f04006 and type(BLSH_89d99bb0d06dd535e6d6f6d9b3f04006) == "table", "BSecureHook: Invalid ui object"); assert(BLSH_57ad665d0e8800ab56a0e07f8ae9c063 and type(BLSH_57ad665d0e8800ab56a0e07f8ae9c063) == "string", "BSecureHook: Invalid handler"); assert(BLSH_9ed8bd8a19b94f73925daece17a05623 and type(BLSH_9ed8bd8a19b94f73925daece17a05623) == "function", "BSecureHook: Invalid hookfunc"); self._E[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006] = self._E[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006] or {}; self._E[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_57ad665d0e8800ab56a0e07f8ae9c063] = true; if (BLSH_89d99bb0d06dd535e6d6f6d9b3f04006:GetScript(BLSH_57ad665d0e8800ab56a0e07f8ae9c063)) then if (BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006] and BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_57ad665d0e8800ab56a0e07f8ae9c063] and BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_57ad665d0e8800ab56a0e07f8ae9c063][BLSH_9ed8bd8a19b94f73925daece17a05623]) then else BLSH_89d99bb0d06dd535e6d6f6d9b3f04006:HookScript(BLSH_57ad665d0e8800ab56a0e07f8ae9c063, function(...) if (self.enable and self._E[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_57ad665d0e8800ab56a0e07f8ae9c063]) then BLSH_9ed8bd8a19b94f73925daece17a05623(...) end end); BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006] = BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006] or {}; BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_57ad665d0e8800ab56a0e07f8ae9c063] = BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_57ad665d0e8800ab56a0e07f8ae9c063] or {}; BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_57ad665d0e8800ab56a0e07f8ae9c063][BLSH_9ed8bd8a19b94f73925daece17a05623] = true; end else BLSH_89d99bb0d06dd535e6d6f6d9b3f04006:SetScript(BLSH_57ad665d0e8800ab56a0e07f8ae9c063, function(...) if (self.enable and self._E[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_57ad665d0e8800ab56a0e07f8ae9c063]) then BLSH_9ed8bd8a19b94f73925daece17a05623(...) end end); BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006] = BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006] or {}; BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_57ad665d0e8800ab56a0e07f8ae9c063] = BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_57ad665d0e8800ab56a0e07f8ae9c063] or {}; BLSH_6dc50cf393baa8395c3f8b6cd575c5d9._F[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_57ad665d0e8800ab56a0e07f8ae9c063][BLSH_9ed8bd8a19b94f73925daece17a05623] = true; end end function BLSH_6dc50cf393baa8395c3f8b6cd575c5d9:UnhookScript(BLSH_89d99bb0d06dd535e6d6f6d9b3f04006, BLSH_57ad665d0e8800ab56a0e07f8ae9c063) if (self._E[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006] and self._E[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_57ad665d0e8800ab56a0e07f8ae9c063]) then self._E[BLSH_89d99bb0d06dd535e6d6f6d9b3f04006][BLSH_57ad665d0e8800ab56a0e07f8ae9c063] = false; end end function BLSH_6dc50cf393baa8395c3f8b6cd575c5d9:Enable() self.enable = true; end function BLSH_6dc50cf393baa8395c3f8b6cd575c5d9:Disable() self.enable = false; end function BLSH_6dc50cf393baa8395c3f8b6cd575c5d9:constructor() self.enable = true; self._E = {}; end BLibrary:Register(BLSH_6dc50cf393baa8395c3f8b6cd575c5d9, "BSecureHook", BLSH_dbdf11f5b07258936fb1c5a31eaa969c, BLSH_1b5523f0adb45c4b8ee51f89ebf6f2b2); --[[ SECURE = BLibrary("BSecureHook"); local echoHook = function (...) local msg = ""; for k, v in pairs({...}) do msg = msg .. "[" .. k .. "] =" .. tostring(v) .. "\n"; end DEFAULT_CHAT_FRAME:AddMessage("[BF Secure Hook]: " .. msg); end SECURE:Hook("UnitName", echoHook); SECURE:Unhook("UnitName"); SECURE:Hook(GameTooltip, "SetUnitBuff", echoHook); SECURE:Unhook(GameTooltip, "SetUnitBuff"); SECURE:HookScript(TargetofTargetFrame, "OnEvent", echoHook); ]] 
