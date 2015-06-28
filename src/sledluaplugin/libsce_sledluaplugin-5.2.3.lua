-- Copyright (C) Sony Computer Entertainment America LLC. 
-- All Rights Reserved.
 
--
-- Dependencies
--

include "../../wws_lua/lua-5.2.3/src/lua-5.2.3.lua"

--
-- Premake build script for the libsce_sledluaplugin-5.2.3 library
--

sdk_project "libsce_sledluaplugin-5.2.3"
	sdk_location "."
	sdk_kind "Library"

	targetname "sce_sledluaplugin-5.2.3"

	configurations { sdk.DEBUG, sdk.RELEASE }
	platforms { sdk.WIN_STATIC_ALL }

	uuid "C3E72BF5-EED1-460B-AC15-1ABCDE123416"

	files {		
		"errorcodes.h",
		"luautils.h",
		"luautils_5.2.3.cpp",
		"luautils_common.cpp",
		"luavariable.h",
		"params.h",
		"profilestack.*",
		"scmp.*",
		"sledluaplugin.*",
		"sledluaplugin_class.cpp",
		"sledluaplugin_class.h",
		"sledluaplugin_class_5.2.3.cpp",
		"varfilter.*"
	}

	vpaths { ["Headers"] = {"*.h"} }
	vpaths { ["Source/*"] = {"**.h", "**.cpp"} }

	includedirs { "../../", "../../../" }
	
	objdir(path.join(sdk.rootdir, "tmp/sce_sled/%{prj.name}/%{sdk.platform(cfg)}"))

	defines { "SCE_LUA_VER=523", "WWS_LUA_VER=523" }
	
	configuration { "Debug*" }
		defines { "SCE_SLED_ASSERT_ENABLED=1" }
		-- JC2MP addition
		defines { "_HAS_ITERATOR_DEBUGGING=0" }
		
	configuration { "Win*" }
		linkoptions { "/ignore:4221" }
