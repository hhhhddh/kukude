
local cn = locale == 'zh' or locale == 'zhr'
name = cn and 'kukude' or 'kukude'
version = '1.0.0'

description = cn and version..'\n'..'' or version..'\n'..''

author = ''

forumthread = ''

api_version = 10

dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
all_clients_require_mod = true

icon_atlas = 'modicon.xml'
icon = 'modicon.tex'

local function Title(title)
    return {
        name = title,
        hover = '',
        options = {{description = '', data = 0}},
        default = 0,
        }
end

configuration_options = cn and
{
    Title('语言'),
    {
        name = 'lang_kukude', 
        label = '语言',
        hover = '',
        options = 
        {
            {description = '英文', data = 'en'},
            {description = '简体中文', data = 'chs'},
        },
        default = 'chs',
    },
} or
{
    Title('Language'),
    {
        name = 'lang_kukude', 
        label = 'Language',
        hover = '',
        options = 
        {
            {description = 'English', data = 'en'},
            {description = '简体中文', data = 'chs'},
        },
        default = 'en',
    },
}

