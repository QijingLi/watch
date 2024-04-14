local float_win = nil

local function open_float_win()
    local buf = vim.api.nvim_create_buf(false, true)
    local date = os.date("%a %b %d %I:%M %p")

    vim.api.nvim_buf_set_lines(buf, 0, -1, true, { ' ' .. date })

    -- Calculate the position to center the window
    local row = math.floor(vim.o.lines / 2)
    local col = math.floor(vim.o.columns / 2)

    local opts = {
        relative = 'editor',
        width = #date + 2,
        height = 1,
        col = col,
        row = row,
        style = 'minimal',
        border = 'double',
    }

    float_win = vim.api.nvim_open_win(buf, 0, opts)
end

local function toggle()
    if float_win == nil then
        open_float_win()
    else
        vim.api.nvim_win_close(float_win, false)
        float_win = nil
    end
end

return {
    toggle = toggle
}

