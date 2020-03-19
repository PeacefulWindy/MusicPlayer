#include<oT/Base/String/String.hpp>
#include<oT/Base/Lua/Lua.hpp>

int main(void)
{
	auto L = oT::Lua();
	if (!L.openFromResources("Scripts/src/main.lua"))
	{
		return -1;
	}

	return 0;
}