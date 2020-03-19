local _M=
{
}

function _M.debug(content)
    oTLog_Debug(content)
end

function _M.info(content)
    oTLog_Info(content)
end

function _M.warring(content)
    oTLog_Warring(content)
end

function _M.error(content)
    oTLog_Error(content)
end

return _M
